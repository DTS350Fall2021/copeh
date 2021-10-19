---
title: "Task 13"
author: "Hannah Cope"
date: "10/19/2021"
output: 
  html_document:
    code_folding: 'hide'
    keep_m: TRUE
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
library(readxl)
library(haven)
library(ggbeeswarm)
```

#### Load Data

```r
data1 <- read_rds(url("https://github.com/WJC-Data-Science/DTS350/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.RDS"))
data2 <- read_dta(url("https://github.com/WJC-Data-Science/DTS350/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.dta"))
data3 <- read_csv(url("https://raw.githubusercontent.com/WJC-Data-Science/DTS350/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   contest_period = col_character(),
##   variable = col_character(),
##   value = col_double()
## )
```

```r
data4 <- read_sav(url("https://github.com/WJC-Data-Science/DTS350/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.sav"))
data <- tempfile()
download("https://github.com/WJC-Data-Science/DTS350/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.xlsx", data, mode = "wb")
data5 <- read_xlsx(data)
```

#### Make the data equal eachother

```r
all_equal(data1, data2, convert = TRUE)
```

```
## [1] TRUE
```

```r
all_equal(data2, data3, convert = TRUE)
```

```
## [1] TRUE
```

```r
all_equal(data3, data4, convert = TRUE)
```

```
## [1] TRUE
```

```r
all_equal(data4, data5, convert = TRUE)
```

```
## [1] TRUE
```

### Plots showing the performance of the different variables

```r
ggplot(data = data3, aes(x = variable, y = value)) +
  geom_boxplot() +
  theme_bw()
```

![](Task13Markdown_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```r
ggplot(data = data3, aes(x = variable, y = value)) +
  geom_jitter() +
  theme_bw()
```

![](Task13Markdown_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

```r
ggplot(data = data3, aes(x = variable, y = value)) +
  geom_boxplot() +
  geom_quasirandom() +
  theme_bw()
```

![](Task13Markdown_files/figure-html/unnamed-chunk-4-3.png)<!-- -->

```r
mean_var <- mean(data3$value)

ggplot(data = data3, aes(x = variable, y = value)) +
  geom_jitter() +
  geom_hline(yintercept = mean(mean_var)) +
  theme_bw()
```

![](Task13Markdown_files/figure-html/unnamed-chunk-4-4.png)<!-- -->

### Tidy the data

```r
month_levels = c("January", "February", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "Dec.")

new_data <- data3 %>%
  separate(contest_period, sep = '-', into = c("month", "year")) %>%
  separate(year, sep = -4, into = c("actual_month", "actual_year")) %>%
  mutate(actual_month = fct_recode(factor(actual_month, levels = month_levels), 
                                   "December" = "Dec.", "February" = "Febuary"))

new_data %>%
  count(actual_month)
```

```
## # A tibble: 12 × 2
##    actual_month     n
##    <fct>        <int>
##  1 January         24
##  2 February        24
##  3 March           24
##  4 April           24
##  5 May             24
##  6 June            27
##  7 July            27
##  8 August          27
##  9 September       27
## 10 October         24
## 11 November        24
## 12 December        24
```

```r
write_rds(new_data, "Final_Task_13_Table")

new_data1 <- new_data %>%
  mutate(half_year = 
           case_when(
             actual_month %in% c("January", "February", "March", "April", "May", "June") ~ 1,
             TRUE ~ 2,
  )) %>%
  group_by(actual_year, half_year, variable) %>%
  summarise(sum_collected = sum(value)) %>%
  unite(half_year, actual_year, col = "xvalue", sep = "-") %>%
  mutate(xvalue = factor(xvalue))
```

```
## `summarise()` has grouped output by 'actual_year', 'half_year'. You can override using the `.groups` argument.
```

### Plot of 6-month returns

```r
ggplot(data = new_data1, aes(x = xvalue , y = sum_collected, group = variable, color = variable)) +
  geom_line() +
  theme_bw() +
  labs(x = "Years",
       y = "Sum of Returns Collected")
```

![](Task13Markdown_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

### Table of DJIA returns

```r
new_data_DIJA <- new_data %>%
  filter(variable == "DJIA") %>%
  select(- month, - variable) %>%
  arrange(actual_month) %>%
  pivot_wider(names_from = actual_year, values_from = value) %>%
  select(actual_month, '1990', everything())
head(new_data_DIJA)
```

```
## # A tibble: 6 × 10
##   actual_month `1990` `1991` `1992` `1993` `1994` `1995` `1996` `1997` `1998`
##   <fct>         <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
## 1 January        NA     -0.8    6.5   -0.8   11.2    1.8   15     19.6   -0.3
## 2 February       NA     11      8.6    2.5    5.5    3.2   15.6   20.1   10.7
## 3 March          NA     15.8    7.2    9      1.6    7.3   18.4    9.6    7.6
## 4 April          NA     16.2   10.6    5.8    0.5   12.8   14.8   15.3   22.5
## 5 May            NA     17.3   17.6    6.7    1.3   19.5    9     13.3   10.6
## 6 June            2.5   17.7    3.6    7.7   -6.2   16     10.2   16.2   15
```

