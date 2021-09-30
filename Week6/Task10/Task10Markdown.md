---
title: "Task 10 Markdown"
author: "Hannah Cope"
date: "9/29/2021"
output: 
  html_document:
    keep_md: True
    code_folding: 'hide'
---

#### Load package

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

### Tooth Growth Plot 1

```r
ggplot(data = ToothGrowth, aes(x = supp, y = len)) +
  geom_boxplot(aes(fill = supp), width = 0.5) +
  scale_fill_manual(values = c('orange', 'purple')) +
  theme_bw() +
  theme(legend.position = 'none') +
  labs(y = "Tooth Length",
       x = "Supplement Type \n(Orange Juice (OJ) vs. ascorbic acid (VC))",
       title = "Tooth Length in Relation to Supplement Type",
       subtitle = "60 guinea pigs were given one of three dose levels of vitamin C by one of two delivery\nmethods: orange juice (OJ), or ascorbic acid (VC).")
```

![](Task10Markdown_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
This plot is showing the relationship between tooth length and the supplement given to the guinea pigs. I can see that the orange juice supplement is overall producing the longer tooth length, but the ascorbic acid is able to produce the longest and shortest tooth lengths. 

I chose a box plot for this data because, not only is it showing me which supplement, on average, has the larger tooth lengths, but I am also able to see the range of tooth lengths that both of the supplements are producing. 

### Tooth Growth Plot 2

```r
ggplot(data = ToothGrowth, aes(factor(dose), len)) +
  geom_point() +
  scale_x_discrete(labels = c('0.5','1.0','2.0')) +
  facet_wrap(~supp, nrow = 1) +
  labs(x = "Dose (Milligrams Per Day)",
       y = "Tooth Length",
       title = "Tooth Length in Relationship to the Dose of Both Supplements",
       subtitle = "60 guinea pigs were given one of three dose levels of vitamin C by one of two delivery\nmethods: orange juice (OJ), or ascorbic acid (VC).") +
  theme_bw()
```

![](Task10Markdown_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
Now, this plot shows the tooth length of the guinea pigs based off the dose of the supplement they were given. I am able to tell that 2 milligrams per day of the ascorbic acid can reach a larger tooth length than 2 milligrams per day of orange juice. On the other hand, 0.5 milligrams per day of the ascorbic acid is producing smaller tooth lengths than 0.5 milligrams per day of orange juice.
  
I chose a dot plot for this data because I wanted to see the spread of data for tooth length. Having these right next to each other makes it very easy to compare which dosage of the supplements produces the largest tooth lengths.
  
### Motor Trend Cars Plot 1

```r
cars <- mtcars %>%
  mutate(trans = 
           case_when(
             am == 0 ~ "automatic",
             am == 1 ~ "manual",
           ))
```


```r
ggplot(data = cars, aes(x = hp, y = mpg, size = wt, color = trans)) +
  geom_point(alpha = 0.7) +
  scale_size(range = c(1.4, 13), name = "Weight (1000 lbs)") +
  theme_bw() +
  theme(legend.position = 'right') +
  labs(x = "Gross Horsepower",
       y = "Miles per US Gallon",
       title = "Relationship Between Gross Horsepower and Miles Per Gallon \nfor Different Transmission Types",
       subtitle = "The data was extracted from the 1974 'Motor Trend' magazine",
       color = "Transmission", labels = c("Automatic", "Manual"))
```

![](Task10Markdown_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
This plot shows the difference in horsepower and miles per gallon of car with different transmissions. I can tell that manual cars usually get higher miles per gallon with a lower horsepower. Manual cars that weight more tend to get lower miles per gallon with a larger horsepower. Manual cars tend to weight less than automatic cars. Automatic cars get less miles per gallon and overall horsepower than manual cars.

I chose to use a bubble plot for this data because it was able to help me compare so many different variable in the data set. Not only was I able to compare horsepower vs. miles per gallon, but I could also see how those factors related to the transmission type and wieght of the cars.

### Motor Trend Cars Plot 2

```r
mtcar <- mtcars %>%
  mutate(gear = as.factor(gear))
```


```r
ggplot(data = mtcar, aes(x = wt, y = mpg, color = gear)) +
  geom_point() +
  scale_color_manual(values = c("blue", "orange", "red")) +
  facet_wrap(~ gear, nrow = 1) +
  theme_bw() +
  labs(x = "Weight (1000 lbs)",
       y = "Miles Per US Gallon",
       title = "Weight vs. Miles Per Gallon in Relation to the Number of Forward Gears",
       subtitle = "The data was extracted from the 1974 'Motor Trend' magazine",
       color = "Number of \nForward Gears")
```

![](Task10Markdown_files/figure-html/unnamed-chunk-7-1.png)<!-- -->
This plot compare the weight and miles per gallon of cars with a different amounts of forwards gears. I am able to tell that cars with 4 forward gears tend to not weight as much and get a more miles per gallon. Cars with 3 forward gears weight more but get less miles per gallon. I am also tell that there are not many cars with 5 forward gears.

I chose to do a scatter plot because it made it easy to compare which cars had the best and worst miles per gallon, along with easily being able to compare weights.
