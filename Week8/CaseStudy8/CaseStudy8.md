---
title: "Case Study 8"
author: "Hannah Cope"
date: "10/28/2021"
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

```r
names <- read_csv(url("https://github.com/WJC-Data-Science/DTS350/raw/master/Names.csv"))
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   X1 = col_double(),
##   name = col_character(),
##   nchar = col_double(),
##   words = col_double()
## )
```

#### Filter out Old Testament Data and Make it a String

```r
OldTest <- bible %>%
  filter(volume_id == 1) %>%
  select(scripture_text) %>%
  str_c()
```

```
## Warning in stri_c(..., sep = sep, collapse = collapse, ignore_null = TRUE):
## argument is not an atomic vector; coercing
```

#### Filter out New Testament Data and Make it a String

```r
NewTest <- bible %>%
  filter(volume_id == 2) %>%
  select(scripture_text) %>%
  str_c()
```

```
## Warning in stri_c(..., sep = sep, collapse = collapse, ignore_null = TRUE):
## argument is not an atomic vector; coercing
```

### Find Savior Names in Old Testament

```r
OldTest %>%
  str_extract_all(names$name)
```

```
## [[1]]
## character(0)
## 
## [[2]]
## character(0)
## 
## [[3]]
## character(0)
## 
## [[4]]
## character(0)
## 
## [[5]]
## character(0)
## 
## [[6]]
## character(0)
## 
## [[7]]
## character(0)
## 
## [[8]]
## character(0)
## 
## [[9]]
## character(0)
## 
## [[10]]
## character(0)
## 
## [[11]]
## character(0)
## 
## [[12]]
## character(0)
## 
## [[13]]
## character(0)
## 
## [[14]]
## character(0)
## 
## [[15]]
## character(0)
## 
## [[16]]
## character(0)
## 
## [[17]]
## character(0)
## 
## [[18]]
## character(0)
## 
## [[19]]
## character(0)
## 
## [[20]]
## character(0)
## 
## [[21]]
## character(0)
## 
## [[22]]
## character(0)
## 
## [[23]]
## character(0)
## 
## [[24]]
## character(0)
## 
## [[25]]
## character(0)
## 
## [[26]]
## character(0)
## 
## [[27]]
## character(0)
## 
## [[28]]
## character(0)
## 
## [[29]]
## character(0)
## 
## [[30]]
## character(0)
## 
## [[31]]
## character(0)
## 
## [[32]]
## character(0)
## 
## [[33]]
## character(0)
## 
## [[34]]
## [1] "The Prince of Peace"
## 
## [[35]]
## character(0)
## 
## [[36]]
## character(0)
## 
## [[37]]
## [1] "God of our fathers" "God of our fathers" "God of our fathers"
## [4] "God of our fathers"
## 
## [[38]]
## character(0)
## 
## [[39]]
## character(0)
## 
## [[40]]
## character(0)
## 
## [[41]]
## [1] "Holy One of Jacob"
## 
## [[42]]
## character(0)
## 
## [[43]]
## character(0)
## 
## [[44]]
## character(0)
## 
## [[45]]
## character(0)
## 
## [[46]]
## character(0)
## 
## [[47]]
## character(0)
## 
## [[48]]
## character(0)
## 
## [[49]]
## character(0)
## 
## [[50]]
## character(0)
## 
## [[51]]
##  [1] "God of Abraham" "God of Abraham" "God of Abraham" "God of Abraham"
##  [5] "God of Abraham" "God of Abraham" "God of Abraham" "God of Abraham"
##  [9] "God of Abraham" "God of Abraham" "God of Abraham" "God of Abraham"
## 
## [[52]]
## character(0)
## 
## [[53]]
## character(0)
## 
## [[54]]
## [1] "King of heaven"
## 
## [[55]]
## character(0)
## 
## [[56]]
## character(0)
## 
## [[57]]
##   [1] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##   [5] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##   [9] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [13] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [17] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [21] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [25] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [29] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [33] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [37] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [41] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [45] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [49] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [53] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [57] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [61] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [65] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [69] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [73] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [77] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [81] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [85] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [89] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [93] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
##  [97] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [101] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [105] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [109] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [113] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [117] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [121] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [125] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [129] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [133] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [137] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [141] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [145] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [149] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [153] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [157] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [161] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [165] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [169] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [173] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [177] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [181] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [185] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [189] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [193] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [197] "God of Israel" "God of Israel" "God of Israel" "God of Israel"
## [201] "God of Israel"
## 
## [[58]]
## character(0)
## 
## [[59]]
## character(0)
## 
## [[60]]
## character(0)
## 
## [[61]]
## character(0)
## 
## [[62]]
## character(0)
## 
## [[63]]
## character(0)
## 
## [[64]]
## [1] "Lord our God" "Lord our God"
## 
## [[65]]
## [1] "God of Isaac" "God of Isaac" "God of Isaac" "God of Isaac"
## 
## [[66]]
##  [1] "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob"
##  [6] "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob"
## [11] "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob"
## [16] "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob"
## 
## [[67]]
## character(0)
## 
## [[68]]
## character(0)
## 
## [[69]]
## [1] "his Holy One" "his Holy One"
## 
## [[70]]
## character(0)
## 
## [[71]]
## character(0)
## 
## [[72]]
## character(0)
## 
## [[73]]
## [1] "Almighty God" "Almighty God"
## 
## [[74]]
## character(0)
## 
## [[75]]
## character(0)
## 
## [[76]]
## character(0)
## 
## [[77]]
## character(0)
## 
## [[78]]
## character(0)
## 
## [[79]]
## character(0)
## 
## [[80]]
## [1] "Lord my God" "Lord my God"
## 
## [[81]]
## character(0)
## 
## [[82]]
## [1] "Son of God"
## 
## [[83]]
## [1] "Mighty God"
## 
## [[84]]
## character(0)
## 
## [[85]]
## character(0)
## 
## [[86]]
## [1] "Wonderful"
## 
## [[87]]
## character(0)
## 
## [[88]]
## character(0)
## 
## [[89]]
## [1] "Lord God"
## 
## [[90]]
## [1] "Redeemer" "Redeemer" "Redeemer" "Redeemer" "Redeemer" "Redeemer" "Redeemer"
## [8] "Redeemer"
## 
## [[91]]
## [1] "Shepherd"
## 
## [[92]]
## character(0)
## 
## [[93]]
##  [1] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
##  [7] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
## [13] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
## [19] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
## [25] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
## [31] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
## [37] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
## 
## [[94]]
##  [1] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
##  [7] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## [13] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## [19] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## [25] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## [31] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## [37] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## [43] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## 
## [[95]]
## [1] "Lord God"
## 
## [[96]]
## [1] "Messiah" "Messiah"
## 
## [[97]]
## [1] "Creator" "Creator"
## 
## [[98]]
## character(0)
## 
## [[99]]
## character(0)
## 
## [[100]]
## [1] "Father"
## 
## [[101]]
## character(0)
## 
## [[102]]
## character(0)
## 
## [[103]]
## [1] "Maker" "Maker" "Maker" "Maker" "Maker" "Maker" "Maker" "Maker"
## 
## [[104]]
##  [1] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [10] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [19] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [28] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [37] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [46] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [55] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [64] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [73] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [82] "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## [91] "O God" "O God" "O God" "O God" "O God" "O God" "O God"
## 
## [[105]]
## character(0)
## 
## [[106]]
##   [1] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [11] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [21] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [31] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [41] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [51] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [61] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [71] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [81] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [91] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [101] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [111] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [121] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [131] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [141] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [151] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [161] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [171] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [181] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [191] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [201] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [211] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [221] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [231] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [241] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [251] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [261] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [271] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [281] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [291] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [301] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [311] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [321] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [331] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [341] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [351] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [361] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [371] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [381] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [391] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [401] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [411] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [421] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [431] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [441] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [451] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [461] "Lord"
## 
## [[107]]
## character(0)
## 
## [[108]]
##  [1] "King" "King" "King" "King" "King" "King" "King" "King" "King" "King"
## [11] "King" "King" "King" "King" "King" "King" "King" "King" "King" "King"
## [21] "King" "King" "King" "King" "King" "King" "King" "King" "King" "King"
## [31] "King" "King" "King" "King" "King" "King" "King" "King" "King"
## 
## [[109]]
##    [1] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [13] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [25] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [37] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [49] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [61] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [73] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [85] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [97] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [109] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [121] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [133] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [145] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [157] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [169] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [181] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [193] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [205] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [217] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [229] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [241] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [253] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [265] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [277] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [289] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [301] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [313] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [325] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [337] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [349] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [361] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [373] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [385] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [397] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [409] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [421] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [433] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [445] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [457] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [469] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [481] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [493] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [505] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [517] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [529] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [541] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [553] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [565] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [577] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [589] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [601] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [613] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [625] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [637] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [649] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [661] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [673] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [685] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [697] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [709] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [721] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [733] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [745] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [757] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [769] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [781] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [793] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [805] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [817] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [829] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [841] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [853] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [865] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [877] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [889] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [901] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [913] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [925] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [937] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [949] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [961] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [973] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [985] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [997] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1009] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1021] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1033] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1045] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1057] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1069] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1081] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1093] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1105] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1117] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1129] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1141] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1153] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1165] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1177] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1189] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1201] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1213] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1225] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1237] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1249] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1261] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1273] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1285] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1297] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1309] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1321] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1333] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1345] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1357] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1369] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1381] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1393] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1405] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1417] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1429] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1441] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1453] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1465] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1477] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1489] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1501] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1513] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1525] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1537] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1549] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1561] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1573] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1585] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1597] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1609] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1621] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1633] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1645] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1657] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1669] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1681] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1693] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1705] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1717] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1729] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1741] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1753] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1765] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1777] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1789] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1801] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1813] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1825] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1837] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1849] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1861] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1873] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1885] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1897] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1909] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1921] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1933] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1945] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1957] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1969] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1981] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1993] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2005] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2017] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2029] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2041] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2053] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2065] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2077] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2089] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2101] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2113] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2125] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2137] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2149] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2161] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2173] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2185] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2197] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2209] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2221] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2233] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2245] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2257] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2269] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2281] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2293] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2305] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2317] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2329] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2341] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2353] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2365] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2377] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2389] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2401] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2413] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2425] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2437] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2449] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2461] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2473] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2485] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2497] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2509] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2521] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2533] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2545] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2557] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2569] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2581] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2593] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2605] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2617] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2629] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2641] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2653] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2665] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2677] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2689] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2701] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2713] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [2725] "God" "God" "God" "God" "God" "God" "God" "God"
## 
## [[110]]
##   [1] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [13] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [25] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [37] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [49] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [61] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [73] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [85] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
##  [97] "One" "One" "One" "One" "One"
## 
## [[111]]
##  [1] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [13] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [25] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [37] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [49] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [61] "Son" "Son" "Son" "Son" "Son"
## 
## [[112]]
##   [1] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [13] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [25] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [37] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [49] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [61] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [73] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [85] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
##  [97] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [109] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [121] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [133] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [145] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [157] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [169] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [181] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [193] "Man" "Man"
```

### Find Savior Names in New Testament

```r
NewTest %>%
  str_extract_all(names$name)
```

```
## [[1]]
## character(0)
## 
## [[2]]
## character(0)
## 
## [[3]]
## character(0)
## 
## [[4]]
## character(0)
## 
## [[5]]
## character(0)
## 
## [[6]]
## character(0)
## 
## [[7]]
## character(0)
## 
## [[8]]
## character(0)
## 
## [[9]]
## [1] "Jesus Christ, the Son of God"
## 
## [[10]]
## character(0)
## 
## [[11]]
## character(0)
## 
## [[12]]
## character(0)
## 
## [[13]]
## character(0)
## 
## [[14]]
## character(0)
## 
## [[15]]
## character(0)
## 
## [[16]]
## character(0)
## 
## [[17]]
## character(0)
## 
## [[18]]
## character(0)
## 
## [[19]]
## [1] "the beginning and the end" "the beginning and the end"
## [3] "the beginning and the end"
## 
## [[20]]
## character(0)
## 
## [[21]]
## character(0)
## 
## [[22]]
## character(0)
## 
## [[23]]
## character(0)
## 
## [[24]]
## character(0)
## 
## [[25]]
## character(0)
## 
## [[26]]
## [1] "Son of the living God" "Son of the living God"
## 
## [[27]]
## character(0)
## 
## [[28]]
## character(0)
## 
## [[29]]
## character(0)
## 
## [[30]]
## character(0)
## 
## [[31]]
## character(0)
## 
## [[32]]
## character(0)
## 
## [[33]]
## character(0)
## 
## [[34]]
## character(0)
## 
## [[35]]
## character(0)
## 
## [[36]]
## character(0)
## 
## [[37]]
## [1] "God of our fathers" "God of our fathers" "God of our fathers"
## 
## [[38]]
## [1] "Lord God Almighty" "Lord God Almighty" "Lord God Almighty"
## [4] "Lord God Almighty" "Lord God Almighty"
## 
## [[39]]
## character(0)
## 
## [[40]]
## character(0)
## 
## [[41]]
## character(0)
## 
## [[42]]
## character(0)
## 
## [[43]]
##  [1] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
##  [4] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
##  [7] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [10] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [13] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [16] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [19] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [22] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [25] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [28] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [31] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [34] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [37] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [40] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [43] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [46] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [49] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [52] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [55] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [58] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [61] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [64] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [67] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [70] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [73] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [76] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [79] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [82] "Lord Jesus Christ" "Lord Jesus Christ" "Lord Jesus Christ"
## [85] "Lord Jesus Christ"
## 
## [[44]]
## character(0)
## 
## [[45]]
## character(0)
## 
## [[46]]
## [1] "Christ, the Lord"
## 
## [[47]]
## character(0)
## 
## [[48]]
## character(0)
## 
## [[49]]
## [1] "Alpha and Omega" "Alpha and Omega" "Alpha and Omega" "Alpha and Omega"
## 
## [[50]]
## [1] "heavenly Father" "heavenly Father" "heavenly Father" "heavenly Father"
## [5] "heavenly Father" "heavenly Father"
## 
## [[51]]
## [1] "God of Abraham" "God of Abraham" "God of Abraham" "God of Abraham"
## [5] "God of Abraham"
## 
## [[52]]
## [1] "Lord their God"
## 
## [[53]]
## character(0)
## 
## [[54]]
## character(0)
## 
## [[55]]
## [1] "Christ the Son"
## 
## [[56]]
##  [1] "God the Father" "God the Father" "God the Father" "God the Father"
##  [5] "God the Father" "God the Father" "God the Father" "God the Father"
##  [9] "God the Father" "God the Father" "God the Father" "God the Father"
## 
## [[57]]
## [1] "God of Israel" "God of Israel"
## 
## [[58]]
## character(0)
## 
## [[59]]
## character(0)
## 
## [[60]]
## [1] "Lord your God" "Lord your God"
## 
## [[61]]
## [1] "good shepherd" "good shepherd" "good shepherd"
## 
## [[62]]
## character(0)
## 
## [[63]]
## character(0)
## 
## [[64]]
## [1] "Lord our God" "Lord our God" "Lord our God"
## 
## [[65]]
## [1] "God of Isaac" "God of Isaac" "God of Isaac" "God of Isaac"
## 
## [[66]]
## [1] "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob" "God of Jacob"
## 
## [[67]]
## character(0)
## 
## [[68]]
## [1] "Lord thy God" "Lord thy God" "Lord thy God" "Lord thy God" "Lord thy God"
## [6] "Lord thy God" "Lord thy God"
## 
## [[69]]
## character(0)
## 
## [[70]]
## character(0)
## 
## [[71]]
## character(0)
## 
## [[72]]
##   [1] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##   [6] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [11] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [16] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [21] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [26] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [31] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [36] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [41] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [46] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [51] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [56] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [61] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [66] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [71] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [76] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [81] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [86] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [91] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
##  [96] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [101] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [106] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [111] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [116] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [121] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [126] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [131] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [136] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [141] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [146] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [151] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [156] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [161] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [166] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [171] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [176] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [181] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [186] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [191] "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ" "Jesus Christ"
## [196] "Jesus Christ" "Jesus Christ" "Jesus Christ"
## 
## [[73]]
## [1] "Almighty God"
## 
## [[74]]
##  [1] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
##  [6] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [11] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [16] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [21] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [26] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [31] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [36] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [41] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [46] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [51] "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus" "Christ Jesus"
## [56] "Christ Jesus" "Christ Jesus" "Christ Jesus"
## 
## [[75]]
## character(0)
## 
## [[76]]
## character(0)
## 
## [[77]]
## character(0)
## 
## [[78]]
## [1] "Lamb of God" "Lamb of God"
## 
## [[79]]
## character(0)
## 
## [[80]]
## character(0)
## 
## [[81]]
## character(0)
## 
## [[82]]
##  [1] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
##  [6] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [11] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [16] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [21] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [26] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [31] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [36] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [41] "Son of God" "Son of God" "Son of God" "Son of God" "Son of God"
## [46] "Son of God"
## 
## [[83]]
## character(0)
## 
## [[84]]
## [1] "O Lord God"
## 
## [[85]]
## character(0)
## 
## [[86]]
## character(0)
## 
## [[87]]
## character(0)
## 
## [[88]]
## character(0)
## 
## [[89]]
##  [1] "Lord God" "Lord God" "Lord God" "Lord God" "Lord God" "Lord God"
##  [7] "Lord God" "Lord God" "Lord God" "Lord God" "Lord God" "Lord God"
## [13] "Lord God"
## 
## [[90]]
## character(0)
## 
## [[91]]
## [1] "Shepherd" "Shepherd"
## 
## [[92]]
## character(0)
## 
## [[93]]
## [1] "Holy One" "Holy One" "Holy One" "Holy One" "Holy One" "Holy One"
## 
## [[94]]
## [1] "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty" "Almighty"
## [8] "Almighty" "Almighty"
## 
## [[95]]
##  [1] "Lord God" "Lord God" "Lord God" "Lord God" "Lord God" "Lord God"
##  [7] "Lord God" "Lord God" "Lord God" "Lord God" "Lord God" "Lord God"
## [13] "Lord God"
## 
## [[96]]
## character(0)
## 
## [[97]]
## [1] "Creator" "Creator"
## 
## [[98]]
## [1] "Beloved" "Beloved" "Beloved" "Beloved" "Beloved" "Beloved" "Beloved"
## [8] "Beloved" "Beloved"
## 
## [[99]]
## character(0)
## 
## [[100]]
##   [1] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##   [9] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [17] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [25] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [33] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [41] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [49] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [57] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [65] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [73] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [81] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [89] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
##  [97] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [105] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [113] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [121] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [129] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [137] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [145] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [153] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [161] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [169] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [177] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [185] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [193] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [201] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [209] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [217] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [225] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [233] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [241] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [249] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [257] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [265] "Father" "Father" "Father" "Father" "Father" "Father" "Father" "Father"
## [273] "Father"
## 
## [[101]]
##   [1] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##   [9] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [17] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [25] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [33] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [41] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [49] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [57] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [65] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [73] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [81] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [89] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
##  [97] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [105] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [113] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [121] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [129] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [137] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [145] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [153] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [161] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [169] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [177] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [185] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [193] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [201] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [209] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [217] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [225] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [233] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [241] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [249] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [257] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [265] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [273] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [281] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [289] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [297] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [305] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [313] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [321] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [329] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [337] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [345] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [353] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [361] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [369] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [377] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [385] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [393] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [401] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [409] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [417] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [425] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [433] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [441] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [449] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [457] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [465] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [473] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [481] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [489] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [497] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [505] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [513] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [521] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [529] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [537] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [545] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [553] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [561] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## [569] "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ" "Christ"
## 
## [[102]]
##   [1] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [10] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [19] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [28] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [37] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [46] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [55] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [64] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [73] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [82] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
##  [91] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [100] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [109] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [118] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [127] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [136] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [145] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [154] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [163] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [172] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [181] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [190] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [199] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [208] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [217] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [226] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [235] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [244] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [253] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [262] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [271] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [280] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [289] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [298] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [307] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [316] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [325] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [334] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [343] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [352] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [361] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [370] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [379] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [388] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [397] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [406] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [415] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [424] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [433] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [442] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [451] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [460] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [469] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [478] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [487] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [496] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [505] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [514] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [523] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [532] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [541] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [550] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [559] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [568] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [577] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [586] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [595] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [604] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [613] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [622] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [631] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [640] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [649] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [658] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [667] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [676] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [685] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [694] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [703] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [712] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [721] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [730] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [739] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [748] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [757] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [766] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [775] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [784] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [793] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [802] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [811] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [820] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [829] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [838] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [847] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [856] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [865] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [874] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [883] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [892] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [901] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [910] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [919] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [928] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [937] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [946] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [955] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [964] "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus" "Jesus"
## [973] "Jesus" "Jesus" "Jesus" "Jesus"
## 
## [[103]]
## character(0)
## 
## [[104]]
## [1] "O God" "O God" "O God"
## 
## [[105]]
##  [1] "Being" "Being" "Being" "Being" "Being" "Being" "Being" "Being" "Being"
## [10] "Being" "Being"
## 
## [[106]]
##   [1] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [11] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [21] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [31] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [41] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [51] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [61] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [71] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [81] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
##  [91] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [101] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [111] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [121] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [131] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [141] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [151] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [161] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [171] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [181] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [191] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [201] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [211] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [221] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [231] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [241] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [251] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [261] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [271] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [281] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [291] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [301] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [311] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [321] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [331] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [341] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [351] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [361] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [371] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [381] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [391] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [401] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [411] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [421] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [431] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [441] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [451] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [461] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [471] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [481] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [491] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [501] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [511] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [521] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [531] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [541] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [551] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [561] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [571] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [581] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [591] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [601] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [611] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [621] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [631] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [641] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [651] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [661] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [671] "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord" "Lord"
## [681] "Lord"
## 
## [[107]]
##  [1] "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb"
## [11] "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb"
## [21] "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb" "Lamb"
## 
## [[108]]
##  [1] "King" "King" "King" "King" "King" "King" "King" "King" "King" "King"
## [11] "King" "King" "King" "King" "King" "King" "King" "King" "King" "King"
## [21] "King" "King" "King" "King" "King" "King" "King" "King" "King" "King"
## [31] "King" "King" "King" "King" "King"
## 
## [[109]]
##    [1] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [13] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [25] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [37] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [49] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [61] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [73] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [85] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##   [97] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [109] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [121] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [133] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [145] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [157] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [169] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [181] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [193] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [205] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [217] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [229] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [241] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [253] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [265] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [277] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [289] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [301] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [313] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [325] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [337] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [349] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [361] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [373] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [385] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [397] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [409] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [421] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [433] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [445] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [457] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [469] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [481] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [493] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [505] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [517] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [529] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [541] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [553] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [565] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [577] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [589] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [601] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [613] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [625] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [637] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [649] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [661] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [673] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [685] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [697] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [709] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [721] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [733] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [745] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [757] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [769] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [781] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [793] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [805] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [817] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [829] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [841] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [853] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [865] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [877] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [889] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [901] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [913] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [925] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [937] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [949] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [961] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [973] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [985] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
##  [997] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1009] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1021] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1033] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1045] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1057] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1069] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1081] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1093] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1105] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1117] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1129] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1141] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1153] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1165] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1177] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1189] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1201] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1213] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1225] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1237] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1249] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1261] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1273] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1285] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1297] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1309] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1321] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1333] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1345] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1357] "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God" "God"
## [1369] "God"
## 
## [[110]]
##  [1] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
## [13] "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One" "One"
## [25] "One"
## 
## [[111]]
##   [1] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [13] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [25] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [37] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [49] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [61] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [73] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [85] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
##  [97] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [109] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [121] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [133] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [145] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [157] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [169] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [181] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [193] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [205] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [217] "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son" "Son"
## [229] "Son" "Son" "Son" "Son"
## 
## [[112]]
##  [1] "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man" "Man"
## [13] "Man" "Man"
```

### Replace Savior Names with Placeholder in order to Split the String and Count the Words Inbetween

```r
notSaviorNames <- function(df, case) {
  for (names in names$name) {
    place_holder <- str_replace_all(df, names, "savior")
  }
  split <- str_split(place_holder, "savior")
  remove_split <- str_remove_all(split, "\n")
  if (case == "mean") {
    stri_stats_latex(unlist(remove_split))[[4]] / length(unlist(split))
  } else {
    stri_stats_latex(unlist(remove_split)) [[4]]
  }
}
```

### Count the Number of Words Inbetween the Savior Names of the Old Testament

```r
notSaviorNames(OldTest, "between")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 611503
```

### Count the Number of Words Inbetween the Savior Names of the New Testament

```r
notSaviorNames(NewTest, "between")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 180662
```

### Find the Mean of the Number of Words Inbetween the Savior Names of the Old Testament

```r
notSaviorNames(OldTest, "mean")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 3135.913
```

### Find the Mean of the Number of Words Inbetween the Savior Names of the New Testament

```r
notSaviorNames(NewTest, "mean")
```

```
## Warning in stri_replace_all_regex(string, pattern,
## fix_replacement(replacement), : argument is not an atomic vector; coercing
```

```
## [1] 12044.13
```



