---
title: "Task 22"
author: "Hannah Cope"
date: "11/18/2021"
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
## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
## ✓ tibble  3.1.6     ✓ dplyr   1.0.7
## ✓ tidyr   1.1.4     ✓ stringr 1.4.0
## ✓ readr   2.1.0     ✓ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(gganimate)
```

### Plot the Animation

```r
anim <- ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, shape = Species, color = Species)) +
  transition_states(Species,
                    transition_length = 2,
                    state_length = 1)

anim + 
  enter_fade() + 
  exit_shrink()
```

![](Task22_files/figure-html/unnamed-chunk-2-1.gif)<!-- -->

