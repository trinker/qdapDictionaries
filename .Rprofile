update_news <- function(repo = "qdapDictionaries") {
  
    News <- readLines("NEWS")
    library(qdap)
    
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

	News <- gsub("(http://[^ ]*)", '<a href="\\1" target="_blank">\\1</a>', News)
	
    cat(paste(News, collapse = "\n"), file = "NEWS.md")
	  message("news.md updated")
}

