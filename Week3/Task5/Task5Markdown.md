---
title: "Task5Markdown"
author: "Hannah Cope"
date: "9/15/2021"
output: 
  html_document:
    theme: cosmo
    keep_md: True
    code_folding: 'hide'
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
library(readxl)
```

### Load in data

```r
SoloData <- tibble(read_csv("solo-artist-followers.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   name = col_character(),
##   band = col_character(),
##   followers = col_character(),
##   band_followers = col_character(),
##   follower_difference = col_character()
## )
```

```r
SoloData
```

```
## # A tibble: 139 × 5
##    name              band                followers band_followers follower_differ…
##    <chr>             <chr>               <chr>     <chr>          <chr>           
##  1 Daron Jones       112                 1.28k     783k           −782k           
##  2 Slim              112                 2.14k     783k           −781k           
##  3 Q Parker          112                 3.51k     783k           −780k           
##  4 JC Chasez         *NSYNC              30.8k     1.44M          −1.41M          
##  5 Joey Fatone       *NSYNC              1.13k     1.44M          −1.44M          
##  6 Justin Timberlake *NSYNC              10.3M     1.44M          8.90M           
##  7 Ashton Irwin      5 Seconds of Summer 130k      7.14M          −7.01M          
##  8 Abz Love          5ive                223       19.0k          −18.7k          
##  9 Jeff Timmons      98º                 111       302k           −302k           
## 10 Nick Lachey       98º                 142k      302k           −160k           
## # … with 129 more rows
```

```r
BillboardData <- tibble(read_csv("billboard-hits.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   name = col_character(),
##   band = col_character(),
##   title = col_character(),
##   peak_date = col_date(format = ""),
##   peak_rank = col_double()
## )
```

```r
BillboardData
```

```
## # A tibble: 456 × 5
##    name   band  title                     peak_date  peak_rank
##    <chr>  <chr> <chr>                     <date>         <dbl>
##  1 *NSYNC <NA>  It's Gonna Be Me          2000-07-28         1
##  2 *NSYNC <NA>  Music Of My Heart         1999-10-15         2
##  3 *NSYNC <NA>  Bye Bye Bye               2000-04-14         4
##  4 *NSYNC <NA>  This I Promise You        2000-12-01         5
##  5 *NSYNC <NA>  Girlfriend                2002-04-05         5
##  6 *NSYNC <NA>  A Little More Time On You 1999-02-26         8
##  7 *NSYNC <NA>  Gone                      2001-11-23        11
##  8 *NSYNC <NA>  I Want You Back           1998-05-01        13
##  9 *NSYNC <NA>  Pop                       2001-06-15        19
## 10 *NSYNC <NA>  Tearin' Up My Heart       1998-12-04        59
## # … with 446 more rows
```

```r
tail(BillboardData)
```

```
## # A tibble: 6 × 5
##   name   band   title                     peak_date  peak_rank
##   <chr>  <chr>  <chr>                     <date>         <dbl>
## 1 Xscape <NA>   Who Can I Run To          1995-11-17         8
## 2 Xscape <NA>   My Little Secret          1998-10-23         9
## 3 Xscape <NA>   Feels So Good             1995-07-21        32
## 4 Xscape <NA>   Love On My Mind           1994-06-03        46
## 5 Xscape <NA>   Do You Want To/Can't Hang 1996-03-15        50
## 6 Kandi  Xscape Don't Think I'm Not       2000-10-06        24
```
##### All of the data types seem to have added in correctly.

### Remove signers who do not have at least 6 times they have had a top 100 hit.

```r
top100 <- BillboardData %>%
  group_by(name) %>%
  filter(n() >6 & band != "")
top100
```

```
## # A tibble: 144 × 5
## # Groups:   name [10]
##    name              band   title                           peak_date  peak_rank
##    <chr>             <chr>  <chr>                           <date>         <dbl>
##  1 Justin Timberlake *NSYNC SexyBack                        2006-09-08         1
##  2 Justin Timberlake *NSYNC My Love                         2006-11-10         1
##  3 Justin Timberlake *NSYNC What Goes Around...Comes Around 2007-03-02         1
##  4 Justin Timberlake *NSYNC Can't Stop The Feeling!         2016-05-27         1
##  5 Justin Timberlake *NSYNC Mirrors                         2013-06-14         2
##  6 Justin Timberlake *NSYNC Cry Me A River                  2003-01-31         3
##  7 Justin Timberlake *NSYNC Suit & Tie                      2013-04-05         3
##  8 Justin Timberlake *NSYNC Rock Your Body                  2003-05-09         5
##  9 Justin Timberlake *NSYNC Summer Love                     2007-06-08         6
## 10 Justin Timberlake *NSYNC Not A Bad Thing                 2014-05-02         8
## # … with 134 more rows
```

```r
tail(top100)
```

```
## # A tibble: 6 × 5
## # Groups:   name [1]
##   name  band          title          peak_date  peak_rank
##   <chr> <chr>         <chr>          <date>         <dbl>
## 1 ZAYN  One Direction Dusk Till Dawn 2017-09-29        44
## 2 ZAYN  One Direction Like I Would   2016-04-01        55
## 3 ZAYN  One Direction It's You       2016-03-18        59
## 4 ZAYN  One Direction Still Got Time 2017-04-14        66
## 5 ZAYN  One Direction Let Me         2018-04-27        73
## 6 ZAYN  One Direction Better         2020-10-09        89
```

### Find the corresponding data in the data set for the top singers' bands.

```r
top_bands <- BillboardData %>% 
  group_by(band) %>%
  filter(name %in% top100$band)
top_bands
```

```
## # A tibble: 101 × 5
## # Groups:   band [1]
##    name   band  title                     peak_date  peak_rank
##    <chr>  <chr> <chr>                     <date>         <dbl>
##  1 *NSYNC <NA>  It's Gonna Be Me          2000-07-28         1
##  2 *NSYNC <NA>  Music Of My Heart         1999-10-15         2
##  3 *NSYNC <NA>  Bye Bye Bye               2000-04-14         4
##  4 *NSYNC <NA>  This I Promise You        2000-12-01         5
##  5 *NSYNC <NA>  Girlfriend                2002-04-05         5
##  6 *NSYNC <NA>  A Little More Time On You 1999-02-26         8
##  7 *NSYNC <NA>  Gone                      2001-11-23        11
##  8 *NSYNC <NA>  I Want You Back           1998-05-01        13
##  9 *NSYNC <NA>  Pop                       2001-06-15        19
## 10 *NSYNC <NA>  Tearin' Up My Heart       1998-12-04        59
## # … with 91 more rows
```
##### The band name showed up in the name column, so I am going to switch it into the band column.

```r
top_bands <- rename(top_bands, band = name, name = band)
top_bands
```

```
## # A tibble: 101 × 5
## # Groups:   name [1]
##    band   name  title                     peak_date  peak_rank
##    <chr>  <chr> <chr>                     <date>         <dbl>
##  1 *NSYNC <NA>  It's Gonna Be Me          2000-07-28         1
##  2 *NSYNC <NA>  Music Of My Heart         1999-10-15         2
##  3 *NSYNC <NA>  Bye Bye Bye               2000-04-14         4
##  4 *NSYNC <NA>  This I Promise You        2000-12-01         5
##  5 *NSYNC <NA>  Girlfriend                2002-04-05         5
##  6 *NSYNC <NA>  A Little More Time On You 1999-02-26         8
##  7 *NSYNC <NA>  Gone                      2001-11-23        11
##  8 *NSYNC <NA>  I Want You Back           1998-05-01        13
##  9 *NSYNC <NA>  Pop                       2001-06-15        19
## 10 *NSYNC <NA>  Tearin' Up My Heart       1998-12-04        59
## # … with 91 more rows
```
### Graph the data 

```r
ggplot(data = top100, aes(x = peak_date, y = peak_rank, color = name, group = name)) +
  geom_point() +
  geom_line() +
  geom_point(data = top_bands, color = "black") +
  geom_line(data = top_bands, color = "black", linetype = "dotted") +
  facet_wrap(~ band, scales = "free") +
  ylab("Peak Rank") +
  xlab("Peak Date") +
  scale_color_discrete("Name") +
  theme_bw()
```

```
## geom_path: Each group consists of only one observation. Do you need to adjust
## the group aesthetic?
```

![](Task5Markdown_files/figure-html/unnamed-chunk-6-1.png)<!-- -->
From this plot I can tell that the top artist help give the band top 100 ranked songs. New Edition and Jonas Brothers show to have a lot of top songs reguardless of the singer though. 

## Data Sources

Data for overseas trade index for the June 2021 quarter
https://www.stats.govt.nz/large-datasets/csv-files-for-download/

```r
overseas <- tibble(read_csv("overseas-trade-indexes-June-2021-quarter-provisional-csv.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   Series_reference = col_character(),
##   Period = col_double(),
##   Data_value = col_double(),
##   STATUS = col_character(),
##   UNITS = col_character(),
##   MAGNTUDE = col_double(),
##   Subject = col_character(),
##   Group = col_character(),
##   Series_title_1 = col_character(),
##   Series_title_2 = col_character(),
##   Series_title_3 = col_character(),
##   Series_title_4 = col_logical(),
##   Series_title_5 = col_logical()
## )
```

```
## Warning: 17063 parsing failures.
##   row            col           expected              actual                                                           file
## 32101 Series_title_4 1/0/T/F/TRUE/FALSE Seasonally adjusted 'overseas-trade-indexes-June-2021-quarter-provisional-csv.csv'
## 32102 Series_title_4 1/0/T/F/TRUE/FALSE Seasonally adjusted 'overseas-trade-indexes-June-2021-quarter-provisional-csv.csv'
## 32103 Series_title_4 1/0/T/F/TRUE/FALSE Seasonally adjusted 'overseas-trade-indexes-June-2021-quarter-provisional-csv.csv'
## 32104 Series_title_4 1/0/T/F/TRUE/FALSE Seasonally adjusted 'overseas-trade-indexes-June-2021-quarter-provisional-csv.csv'
## 32105 Series_title_4 1/0/T/F/TRUE/FALSE Seasonally adjusted 'overseas-trade-indexes-June-2021-quarter-provisional-csv.csv'
## ..... .............. .................. ................... ..............................................................
## See problems(...) for more details.
```

```r
overseas
```

```
## # A tibble: 96,770 × 13
##    Series_reference Period Data_value STATUS UNITS MAGNTUDE Subject     Group   
##    <chr>             <dbl>      <dbl> <chr>  <chr>    <dbl> <chr>       <chr>   
##  1 OTVA.SEA2AA1      1971.       369. FINAL  Index        0 Overseas T… Export …
##  2 OTVA.SEA2AA1      1972.       376. FINAL  Index        0 Overseas T… Export …
##  3 OTVA.SEA2AA1      1973.       416. FINAL  Index        0 Overseas T… Export …
##  4 OTVA.SEA2AA1      1974.       375. FINAL  Index        0 Overseas T… Export …
##  5 OTVA.SEA2AA1      1975.       401. FINAL  Index        0 Overseas T… Export …
##  6 OTVA.SEA2AA1      1976.       474. FINAL  Index        0 Overseas T… Export …
##  7 OTVA.SEA2AA1      1977.       555. FINAL  Index        0 Overseas T… Export …
##  8 OTVA.SEA2AA1      1978.       484. FINAL  Index        0 Overseas T… Export …
##  9 OTVA.SEA2AA1      1979.       527. FINAL  Index        0 Overseas T… Export …
## 10 OTVA.SEA2AA1      1980.       465. FINAL  Index        0 Overseas T… Export …
## # … with 96,760 more rows, and 5 more variables: Series_title_1 <chr>,
## #   Series_title_2 <chr>, Series_title_3 <chr>, Series_title_4 <lgl>,
## #   Series_title_5 <lgl>
```

Research and development servery from 2016-2019
https://www.stats.govt.nz/large-datasets/csv-files-for-download/

```r
research <- tibble(read_csv("research-and-development-survey-2016-2019-csv.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   Variable = col_character(),
##   Breakdown = col_character(),
##   Breakdown_category = col_character(),
##   Year = col_double(),
##   RD_Value = col_character(),
##   Units = col_character(),
##   Footnotes = col_character()
## )
```

```r
research
```

```
## # A tibble: 14,946 × 7
##    Variable       Breakdown  Breakdown_category   Year RD_Value Units  Footnotes
##    <chr>          <chr>      <chr>               <dbl> <chr>    <chr>  <chr>    
##  1 _01_Current a… ANZSIC_1_… A_Agriculture, For…  2016 91       NZ Do… 8 and 20 
##  2 _01_Current a… ANZSIC_1_… A_Agriculture, For…  2018 89       NZ Do… 8 and 20 
##  3 _01_Current a… ANZSIC_1_… A_Agriculture, For…  2019 89       NZ Do… 8 and 9 …
##  4 _01_Current a… ANZSIC_1_… B_Mining             2016 5        NZ Do… 8 and 20 
##  5 _01_Current a… ANZSIC_1_… B_Mining             2018 9        NZ Do… 8 and 20 
##  6 _01_Current a… ANZSIC_1_… B_Mining             2019 9        NZ Do… 8 and 9 …
##  7 _01_Current a… ANZSIC_1_… C_Manufacturing      2016 671      NZ Do… 8 and 20 
##  8 _01_Current a… ANZSIC_1_… C_Manufacturing      2018 673      NZ Do… 8 and 20 
##  9 _01_Current a… ANZSIC_1_… C_Manufacturing      2019 763      NZ Do… 8 and 9 …
## 10 _01_Current a… ANZSIC_1_… D_Electricity, Gas…  2016 6        NZ Do… 8 and 20 
## # … with 14,936 more rows
```

Household living-costs price indexes in June 2021 quarter
https://www.stats.govt.nz/large-datasets/csv-files-for-download/

```r
household <- tibble(read_csv("Household-living-costs-price-indexes-June-2021-quarter-group-facts.csv"))
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   hlpi_name = col_character(),
##   year = col_double(),
##   hlpi = col_character(),
##   tot_hhs = col_double(),
##   own = col_double(),
##   own_wm = col_double(),
##   own_prop = col_double(),
##   own_wm_prop = col_double(),
##   prop_hhs = col_double(),
##   age = col_double(),
##   size = col_double(),
##   income = col_double(),
##   expenditure = col_double(),
##   eqv_income = col_double(),
##   eqv_exp = col_double()
## )
```

```r
household
```

```
## # A tibble: 70 × 15
##    hlpi_name      year hlpi  tot_hhs    own own_wm own_prop own_wm_prop prop_hhs
##    <chr>         <dbl> <chr>   <dbl>  <dbl>  <dbl>    <dbl>       <dbl>    <dbl>
##  1 All househol…  2008 allhh 1560859 1.09e6 574406     69.7        36.8    100  
##  2 Beneficiary    2008 benef  185965 7.13e4  39405     38.3        21.2     11.9
##  3 Income quint…  2008 disq1  312376 1.91e5  48424     61.3        15.5     20  
##  4 Income quint…  2008 disq2  312333 1.96e5  84171     62.8        26.9     20  
##  5 Income quint…  2008 disq3  312240 2.18e5 141318     69.7        45.3     20  
##  6 Income quint…  2008 disq4  312336 2.29e5 147658     73.3        47.3     20  
##  7 Income quint…  2008 disq5  311574 2.53e5 152835     81.3        49.1     20  
##  8 Expenditure …  2008 expq1  312761 1.94e5  49448     62.1        15.8     20  
##  9 Expenditure …  2008 expq2  311973 2.06e5  86390     66.1        27.7     20  
## 10 Expenditure …  2008 expq3  311840 1.94e5 108065     62.3        34.7     20  
## # … with 60 more rows, and 6 more variables: age <dbl>, size <dbl>,
## #   income <dbl>, expenditure <dbl>, eqv_income <dbl>, eqv_exp <dbl>
```

