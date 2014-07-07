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


##===
##ENCODING

x <- key.syn[[2]][which(stri_enc_mark(key.syn[[2]]) != "ASCII")]


   ser <- c("<e2><80><98>", 
        "<e2><80><99>", "<e2><80><9b>", "<ef><bc><87>",  
         "<c3><a1>", "<c3><a9>", 
        "<c2><bd>",
"<c3><aa>", "<c3><a0>", "<c3><a7>", "<c3><a8>", "<c3><af>", "<c3><a4>", "<c3><a2>",
" @@@@ [6]<da><a9><d8><aa><d8><a7><d8><a8>")

    reps <- c("'", "'", "'", "'", "a", "e", "half", "e", "a", "c", "e", "f", "a", "a", "")

#sink(file="temp.txt")

key.syn[[2]][which(stri_enc_mark(key.syn[[2]]) != "ASCII")] <- 
mgsub(ser, reps, iconv(x, "", "ASCII", "byte"))
#sink()

pack.skel(key.syn)

#==========================
## Add countries
grady2 <- qdapDictionaries::GradyAugmented[!grepl("\\s", qdapDictionaries::GradyAugmented)]

reps <- grep("\\s", GradyAugmented, value=TRUE)

pref <- c("north ", "south ", "east ", "west ", "new ")
reps <- mgsub(pref,"", Trim(reps))
reps <- unique(unlist(strsplit(reps, " ")))

z <- c("Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua ", 
    "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", 
    "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", 
    "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia Herzegovina", 
    "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina", "Burundi", 
    "Cambodia", "Cameroon", "Canada", "Cape Verde", "Chad", "Chile", 
    "China", "Colombia", "Comoros", "Congo", "Costa Rica", "Croatia", 
    "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", 
    "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", 
    "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", 
    "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", 
    "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Bissau", 
    "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", 
    "Indonesia", "Iran", "Iraq", "Ireland ", "Israel", "Italy", "Ivory Coast", 
    "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", 
    "Korea North", "Korea South", "Kosovo", "Kuwait", "Kyrgyzstan", 
    "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", 
    "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", 
    "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", 
    "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", 
    "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", 
    "Myanmar", "Burma", "Namibia", "Nauru", "Nepal", "Netherlands", 
    "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", 
    "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", 
    "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", 
    "Russian Federation", "Rwanda", "Nevis", "St Lucia", "Saint Vincent ", 
    "Grenadines", "Samoa", "San Marino", "Sao Tome ", "Principe", 
    "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", 
    "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", 
    "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", 
    "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", 
    "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad", 
    "Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", 
    "Ukraine", "United Arab Emirates", "United Kingdom", "United States", 
    "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", 
    "Vietnam", "Yemen", "Zambia", "Zimbabwe")

reps2 <- tolower(unique(unlist(strsplit(mgsub(pref,"", Trim(z)), " "))))

GradyAugmented <- tolower(unique(c(grady2, reps, reps2)))

