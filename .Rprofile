options(repos = "http://cran.r-project.org")

update_news <- function(repo = basename(getwd())) {
  
    News <- readLines("NEWS")
    
    News <- qdap::mgsub(
        c("<", ">", "&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;", "BUG FIXES", 
            "NEW FEATURES", "MINOR FEATURES", "CHANGES", " TRUE ", " FALSE ", 
            " NULL ", "TRUE.", "FALSE.", "NULL.", ":m:"), 
        c("&lt;", "&gt;", "**&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;**", 
            "**BUG FIXES**", "**NEW FEATURES**", "**MINOR FEATURES**", 
            "**CHANGES**", " `TRUE` ", "`FALSE`.", "`NULL`.", "`TRUE`.", 
            " `FALSE` ", " `NULL` ", " : m : "), 
            News, trim = FALSE, fixed=TRUE)
    
    News <- sub(pattern="issue *# *([0-9]+)", 
        replacement=sprintf("<a href=\"https://github.com/trinker/%s/issues/\\1\">issue #\\1</a>",
        repo), 
        x=News)
    
    News <- sub(pattern="pull request *# *([0-9]+)", 
        replacement=sprintf("<a href=\"https://github.com/trinker/%s/issues/\\1\">pull request #\\1</a>",
        repo), 
        x=News)
 
    News <- gsub(sprintf(" %s", repo), 
        sprintf(" <a href=\"https://github.com/trinker/%s\" target=\"_blank\">%s</a>", 
        repo, repo), News)
    
    cat(paste(News, collapse = "\n"), file = "NEWS.md")
    message("news.md updated")
}

update_version <- function(ver = NULL){
    
    desc <- suppressWarnings(readLines("DESCRIPTION"))
    regex <- "(^Version:\\s+\\d+\\.\\d+\\.)(\\d+)"
    loc <- grep(regex, desc)
    ver <- ifelse(is.null(ver), as.numeric(gsub(regex, "\\2", desc[loc])) + 1, ver)    
    desc[loc] <- sprintf(gsub(regex, "\\1%s", desc[loc]), ver)
    cat(paste(desc, collapse="\n"), file="DESCRIPTION")
    
    cit <- suppressWarnings(readLines("inst/CITATION"))
    regex2 <- '(version\\s+\\d+\\.\\d+\\.)(\\d+)([."])'
    cit <- paste(cit, collapse="\n")
    cat(gsub(regex2, paste0("\\1", ver, "\\3"), cit), file = "inst/CITATION")
    message(sprintf("Updated to version: %s", ver))
}


update_date <- function(){
    desc <- read.dcf("DESCRIPTION")
	if (Sys.Date() > desc[,"Date"]) {
		desc[,"Date"] <- as.character(Sys.Date())
        write.dcf(desc, "DESCRIPTION")
		message("Date updated")
	} else {
		message("Date is current")
	}
}

update_date()

