---
title: "CaseStudy4"
author: "Hannah Cope"
date: "9/20/2021"
output: 
  html_document:
    theme: cosmo
    keep_md: True
    code_folding: 'hide'
---

### Load Packages

```r
library(nycflights13)
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
library(ggrepel)
```

#### 2. Which origin airport is best to minimize my chances of a late arrival when I am using Delta Airline?

```r
lowest_late_arrival <- flights %>%
  filter(carrier == "DL")
lowest_late_arrival
```

```
## # A tibble: 48,110 × 19
##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
##  1  2013     1     1      554            600        -6      812            837
##  2  2013     1     1      602            610        -8      812            820
##  3  2013     1     1      606            610        -4      837            845
##  4  2013     1     1      615            615         0      833            842
##  5  2013     1     1      653            700        -7      936           1009
##  6  2013     1     1      655            655         0     1021           1030
##  7  2013     1     1      655            700        -5     1037           1045
##  8  2013     1     1      655            700        -5     1002           1020
##  9  2013     1     1      657            700        -3      959           1013
## 10  2013     1     1      658            700        -2      944            939
## # … with 48,100 more rows, and 11 more variables: arr_delay <dbl>,
## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>
```


```r
ggplot(data = lowest_late_arrival, mapping = aes(x = sched_arr_time, y = arr_delay, color = origin)) + 
  geom_point() +
  labs(x = "Scheduled Arrival Time",
       y = "Arrival Delay")
```

```
## Warning: Removed 452 rows containing missing values (geom_point).
```

![](CaseStudy4Markdown_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
#### This plot shows that the JFK origin is most likely the best to minimize the chances of a late arrival time with Delta Airlines. This airport seems to have the most flights that arrived before the scheduled arrival time.

#### 3. Which destination airport is the worst airport for arrival time?

```r
delay <- flights %>%
  group_by(origin) %>%
  summarise(
    avg_delay = mean(arr_delay, na.rm = TRUE))
delay
```

```
## # A tibble: 3 × 2
##   origin avg_delay
##   <chr>      <dbl>
## 1 EWR         9.11
## 2 JFK         5.55
## 3 LGA         5.78
```


```r
ggplot(data = flights, aes(x = origin, y = arr_delay)) +
  geom_point(aes(color = origin)) +
  geom_point(data = delay, aes(y = avg_delay, size = 1)) +
  annotate("text", x = c(1.2,2.2,3.2), y = 10, label = c("9.11", "5.55", "5.78")) +
  labs(x = "Destination Airport", 
       y = "Arrival Delay") +
  theme(legend.position = "none")
```

```
## Warning: Removed 9430 rows containing missing values (geom_point).
```

![](CaseStudy4Markdown_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
#### This plot shows that airport EWR has the worst arrival times. I was able to find the average arrival time for each airport and EWR ended up being the highest by almost double the amount of minutes as the other two airports.
