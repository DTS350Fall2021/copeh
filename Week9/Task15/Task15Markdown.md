---
title: "Task 15"
author: "Hannah Cope"
date: "10/25/2021"
output: 
  html_document:
    code_folding: 'hide'
    keep_md: TRUE
---

#### Load Packages

```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
```

```
## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
## ✓ tibble  3.1.4     ✓ dplyr   1.0.7
## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
## ✓ readr   1.4.0     ✓ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(stringi)
```

#### Load in Data

```r
bible <- read_csv(url("https://github.com/WJC-Data-Science/DTS350/raw/master/bible.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   volume_id = col_double(),
##   book_id = col_double(),
##   chapter_id = col_double(),
##   verse_id = col_double(),
##   volume_title = col_character(),
##   book_title = col_character(),
##   volume_long_title = col_character(),
##   book_long_title = col_character(),
##   volume_subtitle = col_logical(),
##   book_subtitle = col_logical(),
##   volume_short_title = col_character(),
##   book_short_title = col_character(),
##   chapter_number = col_double(),
##   verse_number = col_double(),
##   scripture_text = col_character(),
##   verse_title = col_character(),
##   verse_short_title = col_character()
## )
```

### Count the Words in the Scriptures

```r
wordcount <- bible %>%
  mutate(word_count =
           sapply(bible$scripture_text, function(x) length(unlist(strsplit(as.character(x), "\\W+"))))
  )
```

### Mean for Old Testament

```r
OldTest <- wordcount %>%
  subset(volume_id == 1)

mean(OldTest$word_count)
```

```
## [1] 26.42208
```

### Mean for New Testament

```r
NewTest <- wordcount %>%
  subset(volume_id == 2)

mean(NewTest$word_count)
```

```
## [1] 22.71019
```

### Plot of the Word Count of Each Book in the New Testament

```r
ggplot(data = NewTest, aes(x = verse_number, y = word_count)) +
  geom_col() +
  facet_wrap(~book_title, scales = 'free') +
  theme_bw() +
  labs(x = "Verse Number",
       y = "Word Count",
       title = "Number of Words in Each Book in the New Testament")
```

![](Task15Markdown_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

#### I was able to find that the Old Testament had an average of 26.42208 words in the scriptures, and the New Testament had an average of 22.71019. I was also able to find that "Lord" was used a total of 23145 times in the Old Testament, while the New Testament only used it 7957 times. The Old Testament was known to give very detailed information about the coming of Christ, but it was very ambiguous, so the New Testament cleared everything up. This is most likely a big reason why the New Testament does not have as many words or include "Lord" as much as the Old Testament. 
#### In my plot, I was able to look for any trends in verse lengths in the New Testament. From it, I was able to notice that it is common for the books the have verses with more words at the beginning and decline as the verses go on. There are some that do not show this trend, like Titus, 2 John, 2 Peter, and Philemon. These books are small in general as none of them have verses that go above 100 words. 
