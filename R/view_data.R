#' List all data sets available in a qdapDictionaries
#' 
#' Lists and describes all the data sets available in qdapDictionaries.
#' 
#' @seealso \code{\link[utils]{data}}
#' @return Returns the data sets of qdapDictionaries as a dataframe.
#' @export
#' @examples
#' view_data()
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


#' Prints a view_data Object
#' 
#' Prints a view_data object.
#' 
#' @param x The view_data object.
#' @param \ldots ignored
#' @method print view_data
#' @S3method print view_data
print.view_data <-
function(x, ...) {
    width <- options()[["width"]]
	options(width=10000)
    on.exit(options(width=width))
    print(left.just(x))
    return()
}
