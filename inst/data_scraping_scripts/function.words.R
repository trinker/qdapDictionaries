url <- "http://myweb.tiscali.co.uk/wordscape/museum/funcword.html"

pacman::p_load(qdap, XML)
doc <- htmlParse(url)
function.words <- bag_o_words(sapply(getNodeSet(doc, "//dd"), xmlValue)[[6]])

function.words <- sort(c(
    function.words,
    contractions[[1]][!contractions[[1]] %in% function.words][c(4:14, 17:36)]
))