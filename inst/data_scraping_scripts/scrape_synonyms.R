library(RCurl)
library(XML)
library(parallel)
library(qdap)
library(acc.roxygen2)
load("C:/Users/trinker/Dropbox/Public/LIST.RData") #the seed list
head(LIST)

#Parsing and counting functions:
term.count <- qdap:::term.count

#Scraping function:
FUN <- function(x){

    url1 <- "http://dictionary.reverso.net/english-synonyms/"
    url2 <- x

    doc <- suppressWarnings(readLines(paste0(url1, url2)))
    Ant <- grep(">Antonyms<", doc)

    if (!identical(integer(0), Ant)) {
        doc <- doc[1:(Ant[1])]
        doc[Ant] <- strsplit(doc[Ant], ">Antonyms<", fixed=TRUE)[[c(1, 1)]]
    } 

    doc <- htmlTreeParse(doc, useInternalNodes = TRUE)
    ncontent2 <- getNodeSet(doc, "//span[@direction='']//text()")[[1]]
    if(xmlToList(ncontent2) != x) {
        return("***XX")
    }

    content <- getNodeSet(doc, "//span[@direction='target']//text()")
    ncontent <- getNodeSet(doc, "//span[@class='ellipsis_text']//text()")
    content <- content[!unlist(content) %in% unlist(ncontent)]

    if (is.null(content)) return(NA)

    x <- lapply(content, function(x) Trim(xmlToList(x)))
    x <- x[!sapply(x, function(y) y=="")]
    words <- unlist(lapply(x, function(x) length(unlist(strsplit(x, "\\s+")))))
    commas <- sapply(x, function(x) term.count(x, ","), USE.NAMES=FALSE)
    ctw <- commas/words
    ctw[words < 3] <- 1
    if (sum(ctw > .25) == 0) return("***XX")

    y <- x[ctw > .25]
    if (length(y) == 1 && y[[1]] == "") return("***XX")

    paste(paste("[", seq_len(length(y)), "]", y, sep = "") , collapse = " @@@@ ")
}


##TEST
## LIST <- LIST[1000:1020]

tic()

#parallel processing the scrape
cl <- makeCluster(mc <- getOption("cl.cores", detectCores()))
clusterExport(cl=cl, varlist=c("LIST", "Trim", "FUN", "term.count", "htmlTreeParse",
    "getNodeSet", "xmlToList"), envir=environment())

L1 <- parLapply(cl, LIST, function(x) {
    Sys.sleep(.5)
    try(FUN(x))
})

stopCluster(cl) #stop the cluster

names(L1) <- LIST

save(L1, file="syns.Rdata")
## load("syns.RData")

toc()

## Time last run
## Time difference of 2.334487 hours
#=====================
## Retry errors

m <- sapply(L1, inherits, "try-error")
L1[which(m)] <- syn_erorrs <- setNames(lapply(names(m[m]), function(x){
    try(FUN(x), silent = TRUE)
}), names(m[m]))

#=====================
## Reshape it


## find the non-synonyms
m2 <- sapply(L1, function(x){
    if(inherits(x, "try-error")) return(NA)
    if(is.na(x)) return(NA)    
    if(x == "***XX") return(NA) 
    x 
})

m2[is.na(m2)]
syns_list <- m2[!is.na(m2)]

## current size
## 10976
length(syns_list)

## check difference from last scrape
setdiff(qdapDictionaries::key.syn[[1]], names(syns_list))

syns_df <- list2df(syns_list, "y", "x")[2:1]
rownames(syns_df) <- NULL

syns_dt <- hash(syns_df)

synonyms_frame

#=====================
## Check with `qdap::syn` function

syn(c("outstanding", "memorable", "hilarious", "relish", "excellent", 
   "fantastic", "brisk", "perfectly", "offbeat"), synonym.frame = syns_dt)

#=====================
## save it for the package:

key.syn <- syns_dt

## user defined function
pack.skel(key.syn)

## change the qdaDictioaries size if necessary
nrow(key.syn)


