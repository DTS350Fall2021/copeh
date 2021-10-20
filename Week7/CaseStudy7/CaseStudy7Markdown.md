---
title: "Case Study 7"
author: "Hannah Cope"
date: "10/19/2021"
output: 
  html_document:
    keep_md: TRUE
    code_folding: 'hide'
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
library(readr)
library(readxl)
library(haven)
library(downloader)
library(foreign)
```

#### Load in Data

```r
germanconscr <- read_dta(url("https://github.com/WJC-Data-Science/DTS350/blob/master/germanconscr.dta?raw=true"))
germanprison <- read_dta(url("https://github.com/WJC-Data-Science/DTS350/blob/master/germanprison.dta?raw=true"))
heights <- read_csv(url("https://raw.githubusercontent.com/hadley/r4ds/master/data/heights.csv"))
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
heights2 <- tempfile()
download("https://github.com/WJC-Data-Science/DTS350/blob/master/Height.xlsx?raw=true", heights2, mode = "wb")
heights1 <- read_xlsx(heights2, skip = 2)
heights_se <- tempfile()
download("https://github.com/WJC-Data-Science/DTS350/raw/master/Heights_south-east/B6090.DBF?raw=true", heights_se, mode = "wb")
se_heights <- read.dbf(heights_se)
```

### Tidy the Worldwide Data

```r
new_heights <- heights1 %>%
  pivot_longer(3:203, names_to = "years", values_to = "heights.cm", values_drop_na = TRUE) %>%
  mutate(year_decade = years, height.in = heights.cm / 2.54) %>%
  separate(years, into = c("century", "decade"), sep = -2) %>%
  separate(decade, into = c("decade", "year"), sep = -1)
head(new_heights)  
```

```
## # A tibble: 6 × 8
##    Code `Continent, Regio… century decade year  heights.cm year_decade height.in
##   <dbl> <chr>              <chr>   <chr>  <chr>      <dbl> <chr>           <dbl>
## 1    40 Austria            18      2      0           164. 1820             64.4
## 2    40 Austria            18      3      0           163. 1830             64.3
## 3    40 Austria            18      4      0           165. 1840             64.9
## 4    40 Austria            18      5      0           166. 1850             65.3
## 5    40 Austria            18      6      0           166. 1860             65.5
## 6    40 Austria            18      7      0           167. 1870             65.8
```

```r
write.csv(new_heights, "new_heights.csv", row.names = TRUE)
```

### Tidy the other datasets

```r
germanconscr_data <- germanconscr %>%
  mutate(birth_year = bdec,
         height.cm = height,
         height.in = height.cm / 2.54,
         study_id = 'germanconscr') %>%
  select(birth_year, height.cm, height.in, study_id)

germanprison_data <- germanprison %>%
  mutate(birth_year = bdec,
         height.cm = height,
         height.in = height.cm / 2.54,
         study_id = 'germanprison') %>%
  select(birth_year, height.cm, height.in, study_id)

heights_data <- heights %>%
  mutate(birth_year = 1950,
         height.cm = height * 2.54,
         height.in = height,
         study_id = 'heights') %>%
  select(birth_year, height.cm, height.in, study_id)

se_heights_data <- se_heights %>%
  mutate(birth_year = SJ,
         height.cm = CMETER,
         height.in = CMETER / 2.54,
         study_id = 'se_heights') %>%
  select(birth_year, height.cm, height.in, study_id)
```

### Combine these into one tidied dataset

```r
combine <- bind_rows(germanconscr_data,germanprison_data,heights_data,se_heights_data)
head(combine)
```

```
## # A tibble: 6 × 4
##   birth_year height.cm height.in study_id    
##        <dbl>     <dbl>     <dbl> <chr>       
## 1       1850      170.      66.8 germanconscr
## 2       1850      156.      61.6 germanconscr
## 3       1850      172.      67.9 germanconscr
## 4       1850      168.      66.2 germanconscr
## 5       1850      167.      65.6 germanconscr
## 6       1850      160.      63.1 germanconscr
```

```r
write.csv(combine, "combined_data.csv", row.names = TRUE)
```

### Find the Germany data

```r
Germany_data <- new_heights %>%
  filter(`Continent, Region, Country` == 'Germany')
```

### Plot the Worldwide data with the Germany data highlighted

```r
ggplot(data = new_heights, aes(x = year_decade, y = height.in)) +
  geom_point(alpha = 0.2) +
  geom_point(data = Germany_data, color = "red") +
  theme_bw() +
  labs(x = "Year",
       y = "Height (inches)",
       title = "Heights Across the Decades",
       subtitle = "All of the countries in the dataset are shown on this graph with the \nGermany data being highlighted in red.")
```

![](CaseStudy7Markdown_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

### Plot the heights across countries

```r
ggplot(data = combine, aes(x = birth_year, y = height.in)) +
  geom_col() +
  facet_wrap(~ study_id, scales = 'free') +
  theme_bw() +
  labs(x = "Birth Year",
       y = "Quantity of Heights in Inches")
```

![](CaseStudy7Markdown_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

