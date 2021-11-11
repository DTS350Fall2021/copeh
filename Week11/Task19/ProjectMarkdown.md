---
title: "DTS 350 Project: Volleymetrics"
author: "Hannah Cope"
date: "11/10/2021"
output: 
  html_document:
    keep_md: True
    code_folding: 'hide'
---
### 1: How many times does the team get a kill off of different scored passes in serve receive?
### 2: How many times does the team get a kill off of different scored digs?
### 3: How is the team's conversion when given freeball, tip, and out of system swing? 

#### Website: https://portal.volleymetrics.hudl.com/#/portal/matches
#### Volleymetrics is a volleyball film website that breaks down the statistics of the matches. Thousands of teams use this website for filming and statistical purposes. I decided to watch the five matches that the University of Kentucky played in the 2020 NCAA tournament since they were the champions last year. The stats that I used were "Receive", "Dig", "Attack", and "Freeball". With these statistics pulls out, I was able to watch the rallies and rate the passes 1, 2, or 3. Three is a perfect pass where the setter barely has to take a step. Two is a pass that is a couple feet off the net, allowing the setter to easily set at least two of her hitters. One is a pass that is about 15 feet or more off the net, making it very difficult for the setter to put the hitters in good situations. I then found how many kills Kentucky got off of each serve receive pass or dig. This allowed me to see where Kentucky strives or stuggles the most. For question three, I went through the attacks coming from their opponents. I noted if they were tips, out of system balls, or freeballs, and saw if they were able to convert off of these balls. Simple balls like these should almost always be converted to a kill for the team on the receiving end. 


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
library(readxl)
```


```r
Volley <- read_excel("/Users/hannahcope/DTS350ProjectData.xlsx") 
```

```
## New names:
## * `` -> ...4
## * `` -> ...8
```


```r
volleyball <- Volley %>%
  select(-...4, -...8) %>%
  mutate('Game_SR' = `Game SR`) %>%
  mutate('SR_Score' = `SR Score`) %>%
  mutate('Kills_SR' = `Kill Off SR`) %>%
  mutate('Game_Dig' = `Game Dig`) %>%
  mutate('Dig_Score' = `Dig Score`) %>%
  mutate('Kills_Dig' = `Kil off Dig`) %>%
  mutate('Game_Conv' = `Came Conv`) %>%
  mutate('Type' = `Type`) %>%
  mutate('Converted' = `Converted?`) %>%
  select(Game_SR, SR_Score, Kills_SR, Game_Dig, Dig_Score, Kills_Dig, Game_Conv, Type, Converted)
```

### Plot of Kills off Serve Receive by Game

```r
SR_Games <- volleyball %>%
  select(Game_SR, SR_Score, Kills_SR) %>%
  ggplot(aes(x = SR_Score, fill = Kills_SR)) +
  geom_bar(position = 'dodge') +
  facet_wrap(~Game_SR, nrow = 1) +
  theme_bw() +
  labs(x = "Serve Recieve Score",
       y = "Total Swings",
       title = "Kills Based on Serve Recieve Passing Scores by Game") +
  scale_fill_discrete(name = "Kill?")
SR_Games
```

![](ProjectMarkdown_files/figure-html/unnamed-chunk-1-1.png)<!-- -->
This plot tells me that when UK gets a perfect pass in serve receive, they almost always get a kill. Serve Receive seems to be their strong suite, and where they get most of their points. This results in a good side out percentage. In the game against Purdue, Kentucky needed to convert more of their 3 passes into kills. The team serve received really well that games, but the passes were not used as they should be. 

### Plot of Kills off Digs by Game

```r
Dig_Games <- volleyball %>%
  select(Game_Dig, Dig_Score, Kills_Dig) %>%
  drop_na(Game_Dig, Dig_Score, Kills_Dig) %>%
  ggplot(aes(x = Dig_Score, fill = Kills_Dig)) +
  geom_bar(position = 'dodge') +
  facet_wrap(~Game_Dig, nrow = 1) +
  theme_bw() +
  labs(x = "Dig Score",
       y = "Total Swings",
       title = "Kills Based on Dig Scores by Game") +
  scale_fill_discrete(name = "Kill?")
Dig_Games
```

![](ProjectMarkdown_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
This plot tells me that UK is not getting enough kills in transition. This is normal considering the ball is coming at the defenders a lot faster and is harder to control. I can assume that Washington and Texas go Kentucky in out of system situations a lot of times based on how mnany one passes they had, but Kentucky needs to be better at finding ways to turn those 1 passes into kills. I would suggest they work more on defending attacks so they are able to put their hitters in good positions in transition. This also tells me that UK most likely scores more of their points in serve receive or blocking. 

### Plot of Kills off Tips, Freeballs, and Out of Systems balls by Game

```r
Convert_Games <- volleyball %>%
  select(Game_Conv, Type, Converted) %>%
  drop_na(Game_Conv, Type, Converted) %>%
  ggplot(aes(x = Type, fill = Converted)) +
  geom_bar(position = 'dodge') +
  facet_wrap(~Game_Conv, nrow = 1) +
  theme_bw() +
  labs(x = "Type of Ball Given",
       y = "Total Swings",
       title = "Kills When Given a Freeball, Tip, or Out of System Swing by Game") +
  scale_fill_discrete(name = "Converted?")
Convert_Games 
```

![](ProjectMarkdown_files/figure-html/unnamed-chunk-3-1.png)<!-- -->
This plot tells me that UK is not the best at defending tips and out of system attacks. I can assume that Texas was very good at placing their tips finding the weak spots on the Kentucky defense with their tips since that was the game with the worst conversions for UK. Most likely, Kentucky was not able to get kills off of these balls because they were not able to get a good touch on defense. This is important because these are easy points for the opponent. On the other hand, UK is does well at converting when given a freeball. This is the easiest ball a team can receive and it is important to take advantage of those balls. 

### Plot of Total Kills off Serve Receive 

```r
SR <- volleyball %>%
  select(SR_Score, Kills_SR) %>%
  ggplot(aes(x = SR_Score, fill = Kills_SR)) +
  geom_bar(position = 'dodge') +
  theme_bw() +
  labs(x = "Serve Recieve Score",
       y = "Total Swings",
       title = "Kills Based on Serve Recieve Passing Scores") +
  scale_fill_discrete(name = "Kill?")
SR
```

![](ProjectMarkdown_files/figure-html/unnamed-chunk-4-1.png)<!-- -->
This plot makes sense. The better the pass, the easier it will be to convert into a kill. I suggest Kentucky works on working on their shots when the ball is not perfect.

### Plot of Total Kills off Digs

```r
Dig <- volleyball %>%
  select(Dig_Score, Kills_Dig) %>%
  drop_na(Dig_Score, Kills_Dig) %>%
  ggplot(aes(x = Dig_Score, fill = Kills_Dig)) +
  geom_bar(position = 'dodge') +
  theme_bw() +
  labs(x = "Dig Score",
       y = "Total Swings",
       title = "Kills Based on Dig Scores") +
  scale_fill_discrete(name = "Kill?")
Dig  
```

![](ProjectMarkdown_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
Kentucky needs to be able to product more kills off of perfect passes. If they could out number the amount of balls that aren't kills with balls that are kills off of perfect passes, they will be even more successful.

### Plot of Total Kills off Tips, Freeballs, and Out of System Balls

```r
Convert <- volleyball %>%
  select(Type, Converted) %>%
  drop_na(Type, Converted) %>%
  ggplot(aes(x = Type, fill = Converted)) +
  geom_bar(position = 'dodge') +
  theme_bw() +
  labs(x = "Type of Ball Given",
       y = "Total Swings",
       title = "Kills When Given a Freeball, Tip, or Out of System Swing") +
  scale_fill_discrete(name = "Converted?")
Convert 
```

![](ProjectMarkdown_files/figure-html/unnamed-chunk-6-1.png)<!-- -->
The plot shows that Kentucky needs to get better at converting on the easy things. 

### Questions that arose from the visualizations:
### 1: What affect does the setter have on these numbers?
#### In order to figure this out, I could construst another graph that scores the set instead of the pass so I could see if the quality of set affected whether the hitter gets a kill or not.
### 2: Where on the court are other teams scoring most of their points with tips?
#### This would be hard to do on my own, but I do know that Volleymetrics provides shot charts of matches as well, so I could look at that and see where the oppenents are finding their kills.

### Timeline: 
#### I would like to have my first draft done by November 22nd, my second draft done by December 1st, and the final draft done by Decemeber 6th. I could then present to 2-3 friends on the 7th. I would like to present on December 9th. 
