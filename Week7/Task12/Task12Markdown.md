---
title: "Task 12"
author: "Hannah Cope"
date: "10/6/2021"
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
library(downloader)
```

#### Load in Data

```r
fandango <- read_csv("fandango_score_comparison.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   .default = col_double(),
##   FILM = col_character()
## )
## ℹ Use `spec()` for the full column specifications.
```

#### Tidy Data

```r
ratings <- fandango %>%
  select(FILM, Fandango_Ratingvalue, RT_norm_round, Metacritic_norm_round, IMDB_norm_round) %>%
  pivot_longer(2:5, names_to = "WEBSITE", values_to = "RATING") %>%
  select(FILM, WEBSITE, RATING)
```

#### Select the top 20 rows

```r
top_20 <- head(ratings, n = 20)
```

### Plot of top 20 rows

```r
ggplot(data = top_20, aes(x = RATING, y = FILM, fill = FILM)) +
  geom_col(position = "dodge") +
  facet_wrap(~ WEBSITE, nrow = 2) +
  theme_bw() +
  theme(legend.position = 'none') +
  labs(x = "Rating",
       y = "Film")
```

![](Task12Markdown_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
By splitting the graphs up by website, I am able to see that, overall, Fandango gives the highest ratings while Metacritic gives the lowest. I can also tell that "Cinderella" is the movie with the highest ratings for almost every website while "Do You Believe?" is usually the lowest. 
