library(tidyverse)
library(readr)

RandomLetters <- read_lines("https://github.com/WJC-Data-Science/DTS350/raw/master/randomletters.txt")
LetterNumbers <- read_lines("https://github.com/WJC-Data-Science/DTS350/raw/master/randomletters_wnumbers.txt")

#Hidden message with every 1700 letter = "the plural of anecdote is not data."
NewLetterList <- c()
for (i in seq(1, str_length(RandomLetters)/1700)) {
  if (i == 1) {
    NewLetterList <- str_c(NewLetterList, str_sub(RandomLetters, start = 1, end = 1))
  }
  NewLetterList <- str_c(NewLetterList, str_sub(RandomLetters, start = i*1700, end = i*1700))
  if (str_sub(RandomLetters, i*1700, end = i*1700) == ".") {
    break
  }
}
NewLetterList

#Numbers converted to letters = experts often posses more data than judgment
str_extract_all(LetterNumbers, ("\\d+"))

#Longest palindrome = 'gsgccgsg'
str_extract_all(RandomLetters, "(.)(.)(.)(.)\\4\\3\\2\\1")

#Remove spaces and periods and find longest vowel sequence = "oooo" and "aaaa"
NoSpaces <- RandomLetters %>%
  str_remove_all("[ ]") %>%
  str_remove_all("[.]")
NoSpaces

str_extract_all(NoSpaces, ("(.)\\1{3}"))
