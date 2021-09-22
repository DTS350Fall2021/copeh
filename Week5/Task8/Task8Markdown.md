---
title: "Task8Markdown"
author: "Hannah Cope"
date: "9/22/2021"
output: 
  html_document:
    keep_md: TRUE
---

### Load Packages

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

### Read in the data

```r
heightsdata <- read_csv("heights.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   earn = col_double(),
##   height = col_double(),
##   sex = col_character(),
##   ed = col_double(),
##   age = col_double(),
##   race = col_character()
## )
```

```r
head(heightsdata)
```

```
## # A tibble: 6 × 6
##    earn height sex       ed   age race 
##   <dbl>  <dbl> <chr>  <dbl> <dbl> <chr>
## 1 50000   74.4 male      16    45 white
## 2 60000   65.5 female    16    58 white
## 3 30000   63.6 female    16    29 white
## 4 50000   63.1 female    16    91 other
## 5 51000   63.4 female    17    39 white
## 6  9000   64.4 female    15    26 white
```

### Make a new data set called HeightEd with different categories.

```r
HeightEd <- heightsdata %>%
  mutate(grade =
           case_when(
             ed >= 3 & ed <= 6 ~ "primary", 
             ed >= 7 & ed <= 11 ~ "secondary",
             ed == 12 ~ "highschoolgrad",
             ed >= 13 & ed <= 15 ~ "associate",
             ed == 16 ~ "bachelors",
             ed >= 17 & ed <= 18 ~ "mastersdoctorate"))
head(HeightEd)
```

```
## # A tibble: 6 × 7
##    earn height sex       ed   age race  grade           
##   <dbl>  <dbl> <chr>  <dbl> <dbl> <chr> <chr>           
## 1 50000   74.4 male      16    45 white bachelors       
## 2 60000   65.5 female    16    58 white bachelors       
## 3 30000   63.6 female    16    29 white bachelors       
## 4 50000   63.1 female    16    91 other bachelors       
## 5 51000   63.4 female    17    39 white mastersdoctorate
## 6  9000   64.4 female    15    26 white associate
```

### Make a graphic to show the relationship between education and race.

```r
HeightEd %>%
  mutate(grade = as.factor(fct_reorder(grade, earn))) %>%
  ggplot(aes(x = grade, y = earn, fill = race)) +
  geom_boxplot() +
  labs(x = "Grade",
       y = "Earnings",
       title = "Relationship Bewteen Education and Race")
```

![](Task8Markdown_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

### Make a graphic to show the relationship between education and sex.

```r
HeightEd %>%
  mutate(grade = as.factor(fct_reorder(grade, earn))) %>%
  ggplot(aes(x = grade, y = earn, fill = sex)) +
  geom_boxplot() +
  labs(x = "Grade",
       y = "Earnings",
       title = "Relationship Betweeen Education and Sex")
```

![](Task8Markdown_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

### Make a graph to show that incorporates good labels and good placement of the objects on the graph.

```r
HeightEd %>%
  mutate(grade = fct_reorder(grade, age)) %>%
  ggplot(aes(x = grade, y = age, color = race)) +
  geom_boxplot() +
  labs(x = "Grades", 
       y = "Age", 
       title = "Relationship Between Grade, Age, and Race") +
  theme_bw()
```

![](Task8Markdown_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

If I am understanding the data correctly, this is data for teachers. So from this graph I was able to see that older people tend to teach primary education. It is surprising that the age range for Masters Doctorate was pretty low. I am also not surprised that there are a lot of professors under the "other" category for Bachelors because even being at Jewell there are a wide range of races for professors, while primary had hardly any teachers that were apart of that category.

