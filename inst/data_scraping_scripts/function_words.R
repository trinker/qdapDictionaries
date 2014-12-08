url <- "http://myweb.tiscali.co.uk/wordscape/museum/funcword.html"

pacman::p_load(qdap, XML)
doc <- htmlParse(url)
function_words <- bag_o_words(sapply(getNodeSet(doc, "//dd"), xmlValue)[[6]])