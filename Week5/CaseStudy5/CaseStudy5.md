---
title: "Case Study 5"
author: "Hannah Cope"
date: "9/27/2021"
output: 
  html_document:
    keep_md: True
    code_folding: 'hide'
---

### Gun Deaths in America Article
##### This article is talking about the estimate of firearm deaths from all 50 states from the years 2012 to 2014. This excludes accidental shootings. A large part of the information is based on the killings of law enforcement officers. The graphs also inclues mass shooting in which at least four people were killed. Acts of terrorism consisting of gun deaths are also included. 

#### Load in packages

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
```

#### Load in the data

```r
GunData <- read_csv("full_data.csv")
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   X1 = col_double(),
##   year = col_double(),
##   month = col_character(),
##   intent = col_character(),
##   police = col_double(),
##   sex = col_character(),
##   age = col_double(),
##   race = col_character(),
##   hispanic = col_double(),
##   place = col_character(),
##   education = col_character()
## )
```

```r
head(GunData)
```

```
## # A tibble: 6 × 11
##      X1  year month intent  police sex     age race    hispanic place  education
##   <dbl> <dbl> <chr> <chr>    <dbl> <chr> <dbl> <chr>      <dbl> <chr>  <chr>    
## 1     1  2012 01    Suicide      0 M        34 Asian/…      100 Home   BA+      
## 2     2  2012 01    Suicide      0 F        21 White        100 Street Some col…
## 3     3  2012 01    Suicide      0 M        60 White        100 Other… BA+      
## 4     4  2012 02    Suicide      0 M        64 White        100 Home   BA+      
## 5     5  2012 02    Suicide      0 M        31 White        100 Other… HS/GED   
## 6     6  2012 02    Suicide      0 M        17 Native…      100 Home   Less tha…
```

#### Remove all data that does not have information for age or intent

```r
filteredGunData <- GunData %>%
  filter(age != "", intent != "")
```

#### Put the seperate ages into age groups

```r
guns <- filteredGunData %>%
  mutate(age_groups = 
           case_when(
             age >= 0 & age <= 14 ~ "under 15",
             age >= 15 & age <= 34 ~ "15-34",
             age >= 35 & age <= 64 ~ "35-64",
             age >= 65 ~ "65+"),
         age_groups = fct_relevel(age_groups,
                                  "under 15", "15-34", "35-64", "65+"))
head(guns)
```

```
## # A tibble: 6 × 12
##      X1  year month intent  police sex     age race    hispanic place  education
##   <dbl> <dbl> <chr> <chr>    <dbl> <chr> <dbl> <chr>      <dbl> <chr>  <chr>    
## 1     1  2012 01    Suicide      0 M        34 Asian/…      100 Home   BA+      
## 2     2  2012 01    Suicide      0 F        21 White        100 Street Some col…
## 3     3  2012 01    Suicide      0 M        60 White        100 Other… BA+      
## 4     4  2012 02    Suicide      0 M        64 White        100 Home   BA+      
## 5     5  2012 02    Suicide      0 M        31 White        100 Other… HS/GED   
## 6     6  2012 02    Suicide      0 M        17 Native…      100 Home   Less tha…
## # … with 1 more variable: age_groups <fct>
```

#### Plot showing the relationship between intent, sex, and age

```r
ggplot(data = guns, aes(x = age_groups, fill = sex)) +
  geom_bar() +
  facet_wrap(~intent, nrow = 2, scales = 'free') +
  scale_fill_manual(values = c('#CC6699', '#3366CC')) +
  labs(x = "agegroup",
       title = "Gun Deaths in Relationship to Intent, Sex, and Age") +
  theme_bw()
```

![](CaseStudy5_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

#### Plot showing the relationship between intent, sex, and age using a desity graph

```r
ggplot(data = guns, aes(x = age, fill = intent)) +
  geom_density(adjust = 1.5, position = "fill") +
  scale_fill_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3")) +
  facet_wrap (~ sex) +
  labs(title = "Density of Each Intent in Relation to Age and Sex") +
  theme_bw() 
```

![](CaseStudy5_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

```r
# this code helped me find the colors for the graph
pal <- palette("Set 2")
pal
```

```
## [1] "black"   "#DF536B" "#61D04F" "#2297E6" "#28E2E5" "#CD0BBC" "#F5C710"
## [8] "gray62"
```

#### Change the month column to integers

```r
guns$month <- as.integer(guns$month)
```

#### Create a column that groups the months into their seasons

```r
SeasonsData <- guns %>%
  mutate(season =
           case_when(
             month >= 3 & month <= 5 ~ "Spring",
             month >= 6 & month <= 8 ~ "Summer",
             month >= 9 & month <= 11 ~ "Fall",
             month >= 1 & month <= 2 ~ "Winter",
             month == 12 ~ "Winter"))
```

#### Plot showing the relationship between intent and race througout each season

```r
ggplot(data = SeasonsData, aes(x = season, fill = race)) +
  geom_bar() +
  facet_wrap(~intent, nrow = 2, scales = 'free') +
  scale_fill_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3", "grey")) +
  labs(x = "season",
       title = "Gun Deaths in Relationship to Race Through Each Season") +
  theme_bw()
```

![](CaseStudy5_files/figure-html/unnamed-chunk-9-1.png)<!-- -->
#### There are a large amount of gun deaths that are classified as suicide. It was interesting to see the difference in the amount of gun deaths separated by race. I was shocked to see how different the values for blacks vs. whites were for homicide. It was also interesting to note that the only graph that shifted through each season was accidental gun deaths. 

#### Plot showing the relationship between age and season

```r
ggplot(data = SeasonsData, aes(x = age, fill =season)) +
  geom_bar() +
  facet_wrap(~intent, nrow = 2, scales = 'free') +
  scale_fill_manual(values = c("#66C2A5", "#FC8D62", "#8DA0CB", "#E78AC3", "grey")) +
  labs(x = "age",
       title = "Gun Deaths in Relationship to Age and Season") +
  theme_bw()
```

![](CaseStudy5_files/figure-html/unnamed-chunk-10-1.png)<!-- -->
#### These plots show that gun deaths are most common in the fall. It was also interesting to see how young the gun deaths start for suicide and accidental deaths. Winter is usually the season with the least amount of gun deaths across all ages. A large amount of homocides tend to begin around the of 15. 

