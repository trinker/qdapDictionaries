#' List all data sets available in a qdapDictionaries
#' 
#' Lists and describes all the data sets available in qdapDictionaries.
#' 
#' @seealso \code{\link[utils]{data}}
#' @return Returns the data sets of qdapDictionaries as a dataframe.
#' @export
#' @examples
#' data_view()
view_data <-
function() {
    pack <- "qdapDictionaries"
    results <- data(package = pack)[["results"]]
    o <- data.frame(results[, 3:4], 
        stringsAsFactors = FALSE
    )
    class(o) <- c("view_data", "data.frame")
    return(o)
}


#' Prints a data_view Object
#' 
#' Prints a data_view object.
#' 
#' @param x The data_view object.
#' @param \ldots ignored
#' @method print data_view
#' @S3method print data_view
print.data_view <-
function(x, ...) {
    print.data.frame(left.just(x))
}
