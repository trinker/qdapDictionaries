#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")



#========================
#staticdocs dev version
#========================
#packages
# library(devtools); install_github("qdap", "trinker"); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker")
library(highlight); library(staticdocs); library(acc.roxygen2)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/qdapDictionaries")

#STEP 2: reshape index
path <- "inst/web"
path2 <- paste0(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdapDictionaries/inst/extra_statdoc/readme.R"
#extras <- qcv(right.just, coleman_liau, flesch_kincaid, fry, 
#    linsear_write, SMOG, syn, mgsub, adjmat, wc, wfdf, mcsv_w, dtm)
expand_statdoc(path2, readme = rdme)

#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com"
incoming <- file.path(file, "qdapDictionaries_dev")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
#delete(path)
#==========================
#staticdocs current version
#==========================
#packages
library(highlight); library(qdap); library(staticdocs); library(acc.roxygen2)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/qdapDictionaries")

#STEP 2: reshape index
path <- "inst/web"
path2 <- paste0(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdapDictionaries/inst/extra_statdoc/readme.R"
#extras <- qcv(right.just, coleman_liau, flesch_kincaid, fry, 
#    linsear_write, SMOG, syn, mgsub, adjmat, wc, wfdf, mcsv_w, dtm)
expand_statdoc(path2, readme = rdme)

#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com"
incoming <- file.path(file, "qdapDictionaries")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
#delete(path)




#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")


#=============================
#Update Name 2 Gender Data Set
#=============================
x <- "http://www.census.gov/genealogy/www/data/1990surnames/dist.female.first"
y <- "http://www.census.gov/genealogy/www/data/1990surnames/dist.male.first"

library(qdap)
female.names <- read.table(x, stringsAsFactors = FALSE, col.names = qcv(name, per.freq, cum.freq, rank))
female.names$gender <- "F"
str(female.names)
head(female.names)

male.names <- read.table(y, stringsAsFactors = FALSE, col.names = qcv(name, per.freq, cum.freq, rank))
male.names$gender <- "M"
str(male.names)
head(male.names)

nms <- rbind(female.names, male.names)
nms$gender <- factor(nms$gender)
str(nms)
head(nms)

nms$gender2 <- as.character(nms$gender)
nms$gender2[nms$name %in% intersect(female.names[, 1], male.names[, 1])] <- "B"
like <- sapply(unique(nms$name[nms$gender2 == "B"]), function(x) {
    y <- na.omit(nms[nms$name == x, ])
    y[which.max(y[, "per.freq"]), "gender"]
})
nms$pred.sex <- lookup(nms$name, names(like), like)
nms$pred.sex[is.na(nms$pred.sex)] <- nms$gender2[is.na(nms$pred.sex)]


nms$gender2 <- factor(nms$gender2)
nms$pred.sex <- factor(nms$pred.sex)
str(nms)

NAMES <- nms
NAMES_SEX <- unique(nms[, qcv(name, gender2, pred.sex)])

y <- NAMES_SEX[order(NAMES_SEX[, 1]), ]
NAMES_LIST <- lapply(LETTERS, function(x){
    na.omit(y[x == substring(y[, 1], 1, 1), ])
})
names(NAMES_LIST) <- LETTERS

#==========================
#Update Power/Strength Data
#==========================

dat <- readLines("inqdict.txt")

dat <- readLines("http://www.wjh.harvard.edu/~inquirer/inqdict.txt")
head(dat)

dat <- dat[-1]

df <- data.frame(word=beg2char(dat), type= char2end(dat))

head(df)

df[, qcv(Strong, Power, Weak, Submit)] <- lapply(c("Strng", "Power", "Weak ", 
	"Subm"), grepl, df[, 2])

head(df)

df[, "word"] <- tolower(beg2char(df[, "word"], "#"))


position <- setNames(lapply(3:6, function(i) {
    unique(df[df[, i], "word"])
}), colnames(df)[3:6])

lapply(position, nchar)

strong.words <- Strong
power.words <- Power
weak.words <- Weak
submit.words <- Submit

list2env(position, .GlobalEnv)

env.strength <- sentiment_frame(strong.words, weak.words)
env.power <- sentiment_frame(power.words, submit.words)

dat4rox(strong.words, weak.words, power.words, submit.words, env.strength, env.power)
pack.skel(strong.words, weak.words, power.words, submit.words, env.strength, env.power)
