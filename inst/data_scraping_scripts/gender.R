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
