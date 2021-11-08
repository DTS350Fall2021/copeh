---
title: "Case Study 9"
author: "Hannah Cope"
date: "11/3/2021"
output: 
  html_document:
    keep_md: True
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

#### Load in Data

```r
sales <- read_csv(url("https://github.com/WJC-Data-Science/DTS350/raw/master/sales.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   Name = col_character(),
##   Type = col_character(),
##   Time = col_datetime(format = ""),
##   Amount = col_double()
## )
```

### Change to Mountain Time

```r
Sales <- sales %>%
  with_tz(tzone = 'US/Mountain')
```

### Aggregate Times

```r
NewSales <- Sales %>%
  mutate(Hour = ceiling_date(Time, 'hour'),
         Day = ceiling_date(Time, 'day'),
         Month = ceiling_date(Time, 'month'))
```

### Pull Out Just the Hour Number

```r
HourSales <- NewSales %>%
  mutate(OnlyHour = format(Hour,"%H"))
```

### Plot of Sales for All of the Businesses Together Over a Day

```r
ggplot(data = HourSales, aes(x = OnlyHour, y = Amount)) +
  geom_col(fill = 'pink') +
  theme_bw() +
  labs(x = "Hour",
       y = "Sales",
       title = "Sales per Hour Over Every Company")
```

![](CaseStudy9_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

This graph shows that overall, businesses should be open from 10am-9pm.

### Plot of Sales for Individual Business Over a Day

```r
ggplot(data = HourSales, aes(x = OnlyHour, y = Amount)) +
  geom_col(fill = 'green') +
  facet_wrap(~Name, scales = 'free') +
  theme_bw() +
  labs(x = "Hours",
       y = "Sales",
       title = "Sales per Hour per Company")
```

![](CaseStudy9_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

Frozone should be open from 10am-8pm. Hot Diggity should be open from 11am-5pm. LeBelle should be open from 12pm-8pm. Short Stop should be open from 12pm-4pm. Spash and Dash should be open from 12pm-5pm. Tacontento should be open from 12pm-4pm.

### Plot of Sales per Month

```r
ggplot(data = NewSales, aes(x = Month, y = Amount)) +
  geom_col() +
  facet_wrap(~Name, scales = 'free') +
  theme_bw() +
  labs(x = 'Month',
       y = 'Sales',
       title = 'Sales per Month')
```

![](CaseStudy9_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

This should that also all of the businesses have the most sales in July. LeBelle has the most in August.

### Plot of Sales per Company

```r
NewSales2 <- NewSales %>%
  group_by(Name) %>%
  summarise(across(Amount, sum))


NewSales2 %>%
  mutate(Name = as.factor(fct_reorder(Name, Amount))) %>%
  arrange(desc(Amount)) %>%
  ggplot(aes(x = Name, y = Amount, fill = Name)) +
  geom_col() +
  theme_bw() +
  theme(legend.position = 'none') +
  labs(x = "Company",
       y = "Sales",
       title = 'Sales per Company')
```

![](CaseStudy9_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

This shows that Hot Diggity has the most sales while Missing and Frozone have the least.

Overall, Hot Diggity is the best investment. It is the company that is making the most money, but at the still time does not heed to be open as long as the other companies, which could save my boss money. They should not invest in Missing since they have the least sales 


