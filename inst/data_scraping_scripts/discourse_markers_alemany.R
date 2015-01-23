URL <- "http://russell.famaf.unc.edu.ar/~laura/shallowdisc4summ/discmar/#revision_lexicon"

library(XML)
m <- readHTMLTable(URL, header=TRUE)
doc   <- htmlTreeParse(URL, useInternalNodes = TRUE)  
nodes <- getNodeSet(doc, "//center//b//text()")
nms <- c(sapply(nodes, xmlValue) , "polysemic", "vague")

discourse.markers.alemany <- setNames(lapply(m[-1], function(x){
    x[] <- lapply(x, as.character)
    out <- x[, colnames(x) %in% c("English", "structural", "semantic", "PoS"), drop=FALSE]
    if (ncol(out)==3) {
        out[6:7, 1] <- x[6:7, 2]
        out <- data.frame(out, PoS=NA) 
    }

    if (ncol(out) > 1) out[["semantic"]] <- gsub("\\)$", "", gsub("\\s+\\(or\\s+", ", ", out[["semantic"]]))
    if (ncol(out)==1) out <- data.frame(out, structural=NA, semantic=NA, PoS=NA) 
    colnames(out)<- c("marker", "structural", "semantic", "pos")
    out <- out[out[[1]] != "", ]

    wrds <- strsplit(out[[1]], ",|/")
    reps <- rep(1:nrow(out), sapply(wrds, length))
    out <- out[reps, ]
    out[[1]] <- unlist(wrds)
    rownames(out) <- NULL
    out

}), nms)


discourse.markers.alemany <- list_df2df(discourse.markers.alemany, "type")[, c(2, 1, 3:5)]
discourse.markers.alemany[discourse.markers.alemany[[1]] == "incluso", 1] <- "even"

library(dplyr)

discourse.markers.alemany <- discourse.markers.alemany %>%
    group_by(type, structural) %>%
    arrange(marker) %>%   
    as.data.frame %>%
    distinct()



save(discourse.markers.alemany, file="discourse.markers.alemany.rda")