---
title: "Task6Markdown"
author: "Hannah Cope"
date: "9/16/2021"
output: 
  html_document:
    theme: cosmo
    keep_md: True
    code_folding: 'hide'
---

### Load Packages

```r
library(lubridate)
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following objects are masked from 'package:base':
## 
##     date, intersect, setdiff, union
```

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
## x lubridate::as.difftime() masks base::as.difftime()
## x lubridate::date()        masks base::date()
## x dplyr::filter()          masks stats::filter()
## x lubridate::intersect()   masks base::intersect()
## x dplyr::lag()             masks stats::lag()
## x lubridate::setdiff()     masks base::setdiff()
## x lubridate::union()       masks base::union()
```

```r
library(downloader)
library(readxl)
```


```r
largest_petal_legnth <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Petal.Length)) == 1)

largest_petal_width <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Petal.Width)) == 1)
```


### Plot 1

```r
ggplot(data = iris, mapping = aes(x = Sepal.Length,
                                  y = Sepal.Width)) +
  geom_point(aes(color= Species, shape = Species)) +
  geom_point(size = 3, shape = 1, color = "black", data = largest_petal_legnth) +
  geom_text(aes(color = Species, label = "Largest Petal Length"), data = largest_petal_legnth, nudge_y = -0.015) +
  geom_point(size = 3, shape = 1, color = "black", data = largest_petal_width) +
  geom_text(aes(color = Species, label = "Largest Petal Width"), data = largest_petal_width, nudge_y = 0.015) +
  scale_y_log10() +
  labs(x = "Sepal Length (cm)",
       y = "Sepal Width (cm)",
       title = "Different Iris Species Have Different Sepal Sizes",
       subtitle = "The Largest Petal Sizes For Each Species Do Not Correspond To The Largest Sepal Sizes") +
  theme(legend.position = "bottom")
```

![](Task6Markdown_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

### Read in the Scrabble data

```r
ScrabbleData <- (read_csv("scrabble_games.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   gameid = col_double(),
##   tourneyid = col_double(),
##   tie = col_logical(),
##   winnerid = col_double(),
##   winnername = col_character(),
##   winnerscore = col_double(),
##   winneroldrating = col_double(),
##   winnernewrating = col_double(),
##   winnerpos = col_double(),
##   loserid = col_double(),
##   losername = col_character(),
##   loserscore = col_double(),
##   loseroldrating = col_double(),
##   losernewrating = col_double(),
##   loserpos = col_double(),
##   round = col_double(),
##   division = col_double(),
##   date = col_date(format = ""),
##   lexicon = col_logical()
## )
```

```r
ScrabbleData
```

```
## # A tibble: 1,542,642 × 19
##    gameid tourneyid tie   winnerid winnername          winnerscore winneroldrating
##     <dbl>     <dbl> <lgl>    <dbl> <chr>                     <dbl>           <dbl>
##  1      1         1 FALSE      268 Harriette Lakernick           0            1568
##  2      2         1 FALSE      268 Harriette Lakernick           0            1568
##  3      3         1 FALSE      268 Harriette Lakernick           0            1568
##  4      4         1 FALSE      268 Harriette Lakernick           0            1568
##  5      5         1 FALSE      268 Harriette Lakernick           0            1568
##  6      6         1 FALSE      268 Harriette Lakernick           0            1568
##  7      7         1 FALSE      268 Harriette Lakernick           0            1568
##  8      8         1 FALSE      268 Harriette Lakernick           0            1568
##  9      9         1 FALSE      429 Patricia Barrett              0            1915
## 10     10         1 FALSE      429 Patricia Barrett              0            1915
## # … with 1,542,632 more rows, and 12 more variables: winnernewrating <dbl>,
## #   winnerpos <dbl>, loserid <dbl>, losername <chr>, loserscore <dbl>,
## #   loseroldrating <dbl>, losernewrating <dbl>, loserpos <dbl>, round <dbl>,
## #   division <dbl>, date <date>, lexicon <lgl>
```




