#' qdapDictionaries
#'
#' A collection of dictionaries and Word Lists to Accompany the qdap Package
#' @docType package
#' @name qdapDictionaries
#' @aliases qdapDictionaries package-qdapDictionaries
NULL



#' Buckley & Salton Stopword List
#' 
#' A stopword list containing a character vector of stopwords.
#' 
#' @details \href{http://www.lextek.com/manuals/onix/stopwords2.html}{From Onix Text Retrieval Toolkit API Reference}:
#' "This stopword list was built by Gerard Salton and Chris Buckley for the
#' experimental SMART information retrieval system at Cornell University.
#' This stopword list is generally considered to be on the larger side and so
#' when it is used, some implementations edit it so that it is better suited
#' for a given domain and audience while others use this stopword list as it
#' stands."
#' 
#' @note Reduced from the original 571 words to 546.
#' 
#' @docType data 
#' @keywords datasets 
#' @name BuckleySaltonSWL 
#' @usage data(BuckleySaltonSWL) 
#' @format A character vector with 546 elements 
#' @export
#' @references \url{http://www.lextek.com/manuals/onix/stopwords2.html}
NULL
 
#' Nettalk Corpus Syllable Data Set
#' 
#' A dataset containing syllable counts.
#' 
#' @note This data set is based on the Nettalk Corpus but has some researcher 
#' word deletions and additions based on the needs of the 
#' \code{\link[qdap]{syllable.sum}} algorithm.
#' 
#' @details 
#' \itemize{ 
#'   \item word. The word
#'   \item syllables. Number of syllables
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name DICTIONARY 
#' @usage data(DICTIONARY) 
#' @format A data frame with 20137 rows and 2 variables 
#' @export
#' @references Sejnowski, T.J., and Rosenberg, C.R. (1987). "Parallel networks 
#' that learn to pronounce English text" in Complex Systems, 1, 145-168. 
#' Retrieved from: \url{http://archive.ics.uci.edu/ml/datasets/Connectionist+Bench+(Nettalk+Corpus)}
#' 
#' \href{http://archive.ics.uci.edu/ml/machine-learning-databases/undocumented/connectionist-bench/nettalk/}{UCI Machine Learning Repository website}
NULL
 
#' Onix Text Retrieval Toolkit Stopword List 1
#' 
#' A stopword list containing a character vector of stopwords. 
#' 
#' @details \href{http://www.lextek.com/manuals/onix/stopwords1.html}{From Onix Text Retrieval Toolkit API Reference}:
#' "This stopword list is probably the most widely used stopword list. It
#' covers a wide number of stopwords without getting too aggressive and
#' including too many words which a user might search upon."
#' 
#' @note Reduced from the original 429 words to 404.
#' 
#' @docType data 
#' @keywords datasets 
#' @name OnixTxtRetToolkitSWL1 
#' @usage data(OnixTxtRetToolkitSWL1) 
#' @format A character vector with 404 elements 
#' @export
#' @references \url{http://www.lextek.com/manuals/onix/stopwords1.html}
NULL
 
#' Fry's  100 Most Commonly Used English Words
#' 
#' A stopword list containing a character vector of stopwords. 
#' 
#' @details Fry's Word List: The first 25 make up about one-third of all printed 
#' material in English. The first 100 make up about one-half of all printed 
#' material in English. The first 300 make up about 65\% of all printed 
#' material in English."
#' 
#' 
#' @docType data 
#' @keywords datasets 
#' @name Top100Words 
#' @usage data(Top100Words) 
#' @format A character vector with 100 elements 
#' @export
#' @references Fry, E. B. (1997). Fry 1000 instant words. Lincolnwood, IL: 
#' Contemporary Books.
NULL
 
#' Fry's 200 Most Commonly Used English Words
#' 
#' A stopword list containing a character vector of stopwords. 
#' 
#' @details Fry's Word List: The first 25 make up about one-third of all printed 
#' material in English. The first 100 make up about one-half of all printed 
#' material in English. The first 300 make up about 65\% of all printed 
#' material in English."
#' 
#' 
#' @docType data 
#' @keywords datasets 
#' @name Top200Words 
#' @usage data(Top200Words) 
#' @format A character vector with 200 elements 
#' @export
#' @references Fry, E. B. (1997). Fry 1000 instant words. Lincolnwood, IL: 
#' Contemporary Books.
NULL
 
#' Fry's 25 Most Commonly Used English Words
#' 
#' A stopword list containing a character vector of stopwords. 
#' 
#' @details Fry's Word List: The first 25 make up about one-third of all printed 
#' material in English. The first 100 make up about one-half of all printed 
#' material in English. The first 300 make up about 65\% of all printed 
#' material in English."
#' 
#' @docType data 
#' @keywords datasets 
#' @name Top25Words 
#' @usage data(Top25Words) 
#' @format A character vector with 25 elements 
#' @export
#' @references Fry, E. B. (1997). Fry 1000 instant words. Lincolnwood, IL: 
#' Contemporary Books.
NULL
 
#' Small Abbreviations Data Set
#' 
#' A dataset containing abbreviations and their qdap friendly form.
#' 
#' @details 
#' \itemize{ 
#'   \item abv. Common transcript abbreviations
#'   \item rep. qdap representation of those abbreviations
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name abbreviations 
#' @usage data(abbreviations) 
#' @format A data frame with 14 rows and 2 variables 
#' @export
NULL
 
#' Action Word List
#' 
#' A dataset containing a vector of action words.  This is a subset of the 
#' \href{http://icon.shef.ac.uk/Moby/}{Moby project: Moby Part-of-Speech}.
#' 
#' @details 
#' \href{http://icon.shef.ac.uk/Moby/}{From Grady Ward's Moby project:}
#' "This second edition is a particularly thorough revision of the original Moby
#' Part-of-Speech. Beyond the fifteen thousand new entries, many thousand more
#' entries have been scrutinized for correctness and modernity. This is
#' unquestionably the largest P-O-S list in the world. Note that the many included
#' phrases means that parsing algorithms can now tokenize in units larger than a
#' single word, increasing both speed and accuracy."
#' 
#' @docType data 
#' @keywords datasets 
#' @name action.verbs 
#' @usage data(action.verbs) 
#' @format A vector with 1569 elements 
#' @export
#' @references 
#' \url{http://icon.shef.ac.uk/Moby/mpos.html}
NULL
 
#' Adverb Word List
#' 
#' A dataset containing a vector of adverbs words.  This is a subset of the 
#' \href{http://icon.shef.ac.uk/Moby/}{Moby project: Moby Part-of-Speech}.
#' 
#' @details 
#' \href{http://icon.shef.ac.uk/Moby/}{From Grady Ward's Moby project:}
#' "This second edition is a particularly thorough revision of the original Moby
#' Part-of-Speech. Beyond the fifteen thousand new entries, many thousand more
#' entries have been scrutinized for correctness and modernity. This is
#' unquestionably the largest P-O-S list in the world. Note that the many included
#' phrases means that parsing algorithms can now tokenize in units larger than a
#' single word, increasing both speed and accuracy."
#' 
#' @docType data 
#' @keywords datasets 
#' @name adverb 
#' @usage data(adverb) 
#' @format A vector with 13398 elements 
#' @export
#' @references 
#' \url{http://icon.shef.ac.uk/Moby/mpos.html}
NULL

#' Contraction Conversions
#' 
#' A dataset containing common contractions and their expanded form.
#' 
#' @details 
#' \itemize{ 
#'   \item contraction. The contraction word.
#'   \item expanded. The expanded form of the contraction.
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name contractions 
#' @usage data(contractions) 
#' @format A data frame with 65 rows and 2 variables 
#' @export
NULL


#' Emoticons Data Set
#' 
#' A dataset containing common emoticons (adapted from 
#' \href{http://www.lingo2word.com/lists/emoticon_listH.html}{Popular Emoticon List}).
#' 
#' @details 
#' \itemize{ 
#'   \item meaning. The meaning of the emoticon
#'   \item emoticon. The graphic representation of the emoticon
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name emoticon 
#' @usage data(emoticon) 
#' @format A data frame with 81 rows and 2 variables 
#' @export
#' @references 
#' \url{http://www.lingo2word.com/lists/emoticon_listH.html}
NULL
 
#' Syllable Lookup Environment
#' 
#' A dataset containing a syllable lookup environment (see \code{link[qdap]{DICTIONARY}}).
#' 
#' @details For internal use.
#' 
#' @docType data 
#' @keywords datasets 
#' @name env.syl 
#' @usage data(env.syl) 
#' @format A environment with the DICTIONARY data set.  
#' @export
#' @references 
#' \href{http://archive.ics.uci.edu/ml/machine-learning-databases/undocumented/connectionist-bench/nettalk/}{UCI Machine Learning Repository website}
NULL
 
#' Amplifying Words
#' 
#' A dataset containing a vector of words that amplify word meaning.
#' 
#' @details 
#' Valence shifters are words that alter or intensify the meaning of the polarized
#' words and include negators and amplifiers. Negators are, generally, adverbs
#' that negate sentence meaning; for example the word like in the sentence, "I do
#' like pie.", is given the opposite meaning in the sentence, "I do not like
#' pie.", now containing the negator not. Amplifiers are, generally, adverbs or
#' adjectives that intensify sentence meaning. Using our previous example, the
#' sentiment of the negator altered sentence, "I seriously do not like pie.", is
#' heightened with addition of the amplifier seriously.  Whereas de-amplifiers 
#' decrease the intensity of a polarized word as in the sentence "I barely like
#' pie"; the word "barely" deamplifies the word like.
#' 
#' @docType data 
#' @keywords datasets 
#' @name amplification.words 
#' @usage data(amplification.words) 
#' @format A vector with 25 elements 
#' @export
NULL
 
#' De-amplifying Words
#' 
#' A dataset containing a vector of words that de-amplify word meaning.
#' 
#' @details 
#' Valence shifters are words that alter or intensify the meaning of the polarized
#' words and include negators and amplifiers. Negators are, generally, adverbs
#' that negate sentence meaning; for example the word like in the sentence, "I do
#' like pie.", is given the opposite meaning in the sentence, "I do not like
#' pie.", now containing the negator not. Amplifiers are, generally, adverbs or
#' adjectives that intensify sentence meaning. Using our previous example, the
#' sentiment of the negator altered sentence, "I seriously do not like pie.", is
#' heightened with addition of the amplifier seriously.  Whereas de-amplifiers 
#' decrease the intensity of a polarized word as in the sentence "I barely like
#' pie"; the word "barely" deamplifies the word like.
#' 
#' @docType data 
#' @keywords datasets 
#' @name deamplification.words 
#' @usage data(deamplification.words) 
#' @format A vector with 14 elements 
#' @export
NULL

#' Interjections
#' 
#' A dataset containing a character vector of common interjections.
#' 
#' @docType data 
#' @keywords datasets 
#' @name interjections
#' @usage data(interjections) 
#' @format A character vector with 139 elements 
#' @export
#' @references
#' \url{http://www.vidarholen.net/contents/interjections/}
NULL
 
 
#' Negating Words
#' 
#' A dataset containing a vector of words that negate word meaning.
#' 
#' @details 
#' Valence shifters are words that alter or intensify the meaning of the polarized
#' words and include negators and amplifiers. Negators are, generally, adverbs
#' that negate sentence meaning; for example the word like in the sentence, "I do
#' like pie.", is given the opposite meaning in the sentence, "I do not like
#' pie.", now containing the negator not. Amplifiers are, generally, adverbs or
#' adjectives that intensify sentence meaning. Using our previous example, the
#' sentiment of the negator altered sentence, "I seriously do not like pie.", is
#' heightened with addition of the amplifier seriously.  Whereas de-amplifiers 
#' decrease the intensity of a polarized word as in the sentence "I barely like
#' pie"; the word "barely" deamplifies the word like.
#' 
#' @docType data 
#' @keywords datasets 
#' @name negation.words 
#' @usage data(negation.words) 
#' @format A vector with 23 elements 
#' @export
NULL
 
#' Negative Words
#' 
#' A dataset containing a vector of negative words.
#' 
#' @details 
#' A sentence containing more negative words would be deemed a negative sentence,
#' whereas a sentence containing more positive words would be considered positive.
#' 
#' @docType data 
#' @keywords datasets 
#' @name negative.words 
#' @usage data(negative.words) 
#' @format A vector with 4776 elements 
#' @export
#' @references Hu, M., & Liu, B. (2004). Mining opinion features in customer 
#' reviews. National Conference on Artificial Intelligence. 
#' 
#' \url{http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html}
NULL
 
#' Positive Words
#' 
#' A dataset containing a vector of positive words.
#' 
#' @details 
#' A sentence containing more negative words would be deemed a negative sentence,
#' whereas a sentence containing more positive words would be considered positive.
#' 
#' @docType data 
#' @keywords datasets 
#' @name positive.words 
#' @usage data(positive.words) 
#' @format A vector with 2003 elements 
#' @export
#' @references Hu, M., & Liu, B. (2004). Mining opinion features in customer 
#' reviews. National Conference on Artificial Intelligence. 
#' 
#' \url{http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html}
NULL
 
#' Preposition Words
#' 
#' A dataset containing a vector of common prepositions.
#' 
#' 
#' @docType data 
#' @keywords datasets 
#' @name preposition 
#' @usage data(preposition) 
#' @format A vector with 162 elements 
#' @export
NULL
 
#' Polarity Lookup Environment
#' 
#' A dataset containing a polarity lookup environment (see 
#' \code{link[qdap]{polarity}}).
#' 
#' 
#' @docType data 
#' @keywords datasets 
#' @name env.pol 
#' @usage data(env.pol) 
#' @format A environment with  words and corresponding values.
#' @export
#' @references Hu, M., & Liu, B. (2004). Mining opinion features in customer 
#' reviews. National Conference on Artificial Intelligence. 
#' 
#' \url{http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html}
NULL

#' Language Assessment by Mechanical Turk (labMT) Sentiment Words
#' 
#' A dataset containing words, average happiness score (polarity), standard 
#' deviations, and rankings. 
#' 
#' @details 
#' \itemize{ 
#'   \item word. The word.
#'   \item happiness_rank. Happiness ranking of words based on average happiness 
#'   scores.
#'   \item happiness_average. Average happiness score.
#'   \item happiness_standard_deviation. Standard deviations of the happiness 
#'   scores.
#'   \item twitter_rank. Twitter ranking of the word.
#'   \item google_rank. Google ranking of the word.
#'   \item nyt_rank. New York Times ranking of the word.
#'   \item lyrics_rank. lyrics ranking of the word.
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name labMT 
#' @usage data(labMT) 
#' @format A data frame with 10222 rows and 8 variables 
#' @export
#' @references 
#' Dodds, P.S., Harris, K.D., Kloumann, I.M., Bliss, C.A., & Danforth, C.M. (2011) 
#' Temporal patterns of happiness and information in a global social network: 
#' Hedonometrics and twitter. PLoS ONE 6(12): e26752. 
#' doi:10.1371/journal.pone.0026752
#' 
#' \url{http://www.plosone.org/article/fetchSingleRepresentation.action?uri=info:doi/10.1371/journal.pone.0026752.s001}
NULL
 
#' Synonyms Data Set
#' 
#' A dataset containing words and possible synonym matches.
#' 
#' @details 
#' \itemize{ 
#'   \item word. The look up word. 
#'   \item match.string. A single string of possible matches.
#' } 
#' 
#' @note Intended for internal use with the \code{\link[qdap]{synonyms}} function.
#' @docType data 
#' @keywords datasets 
#' @name SYNONYM 
#' @usage data(SYNONYM) 
#' @format A data frame with 11050 rows and 2 variables 
#' @export
#' @references Scraped from:
#' \href{http://dictionary.reverso.net/english-synonyms/}{Reverso Online Dictionary}.
#' The word list fed to \href{http://dictionary.reverso.net/english-synonyms/}{Reverso} 
#' is the unique words from the combination of \code{\link[qdap]{DICTIONARY}} and
#' \code{\link[qdap]{labMT}}.
NULL
 
#' Synonym Lookup Environment
#' 
#' A dataset containing a synonym lookup environment (see 
#' \code{link[qdap]{SYNONYM}}).
#' 
#' 
#' @docType data 
#' @keywords datasets 
#' @name env.syn 
#' @usage data(env.syn) 
#' @format A environment with words and synonyms.
#' @export
#' @references Scraped from:
#' \href{http://dictionary.reverso.net/english-synonyms/}{Reverso Online Dictionary}.
#' The word list fed to \href{http://dictionary.reverso.net/english-synonyms/}{Reverso} 
#' is the unique words from the combination of \code{\link[qdap]{DICTIONARY}} and
#' \code{\link[qdap]{labMT}}.
NULL

#' First Names and Gender (U.S.)
#' 
#' A dataset containing 1990 U.S. census data on first names.
#' 
#' @details 
#' \itemize{ 
#'   \item name. A first name.
#'   \item per.freq. Frequency in percent of the name by gender.
#'   \item cum.freq. Cumulative frequency in percent of the name by gender.
#'   \item rank. Rank of the name by gender.
#'   \item gender. Gender of the combined male/female list (M/F).
#'   \item gender2. Gender of the combined male/female list with "B" in place of 
#'   overlapping (M/F) names.
#'   \item pred.sex. Predicted gender of the names with B's in \code{gender2} 
#'   repalced with the gender that had a higher \code{per.freq}.
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name NAMES 
#' @usage data(NAMES) 
#' @format A data frame with 5494 rows and 7 variables 
#' @export
#' @references \url{http://www.census.gov/genealogy/www/data/1990surnames/names_files.html}
NULL
 
#' First Names and Predictive Gender (U.S.)
#' 
#' A truncated version of the \code{\link[qdap]{NAMES}} dataset used for predicting.
#' 
#' @details 
#' \itemize{ 
#'   \item name. A first name. 
#'   \item gender2. Gender of the combined male/female list with "B" in place of 
#'   overlapping (M/F) names.
#'   \item pred.sex. Predicted gender of the names with B's in \code{gender2} 
#'   repalced with the gender that had a higher \code{per.freq}.
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name NAMES_SEX 
#' @usage data(NAMES_SEX) 
#' @format A data frame with 5163 rows and 3 variables 
#' @export
#' @references \url{http://www.census.gov/genealogy/www/data/1990surnames/names_files.html}
NULL

#' First Names and Predictive Gender (U.S.) List
#' 
#' A list version of the \code{\link[qdap]{NAMES_SEX}} dataset broken down by 
#' first letter.
#' 
#' @details Alphabetical list of dataframes with the following variables:
#' \itemize{ 
#'   \item name. A first name. 
#'   \item gender2. Gender of the combined male/female list with "B" in place of 
#'   overlapping (M/F) names.
#'   \item pred.sex. Predicted gender of the names with B's in \code{gender2} 
#'   repalced with the gender that had a higher \code{per.freq}.
#' } 
#' 
#' @docType data 
#' @keywords datasets 
#' @name NAMES_LIST 
#' @usage data(NAMES_LIST) 
#' @format A list with 26 elements 
#' @export
#' @references \url{http://www.census.gov/genealogy/www/data/1990surnames/names_files.html}
NULL
