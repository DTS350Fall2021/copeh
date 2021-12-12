library(tidyverse)
library(readxl)
library(plotly)

# For my project I am looking into the statistics of volleyball. Specifically, I want to know what is going to give a team the best outcome.
# 1: How many times does the team get a kill off of different scored passes in serve receive?
# 2: How many items does the team get a kill off of different scored digs?
# 3: How is the team's conversion when given freeball, tip, and out of system swing?
# https://portal.volleymetrics.hudl.com/#/portal/matches
# The data on this website breaks down the statistics of volleyball matches.

Volley <- read_excel("/Users/hannahcope/DTS350ProjectData.xlsx")
 View(Volley)

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
head(volleyball)

Game_levels <- c('vs. Las Vegas (Sectionals)', 'vs. Western Kentucky (Regionals)', 'vs. Purdue (Quarterfinals)', 'vs. Washington (Semifinals)', 'vs. Texas (Finals)')


# Split by games
SR_Games <- volleyball %>%
  mutate(Game_SR = factor(Game_SR, levels = Game_levels)) %>%
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

Dig_Games <- volleyball %>%
  mutate(Game_Dig = factor(Game_Dig, levels = Game_levels)) %>%
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

Convert_Games <- volleyball %>%
  mutate(Game_Conv = factor(Game_Conv, levels = Game_levels)) %>%
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

# Total for all games
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

SR_plot <- ggplotly(SR)
SR_plot

ggplotly(SR, tooltip = "text")

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

Dig_plot <- ggplotly(Dig)
Dig_plot

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

Convert_plot <- ggplotly(Convert)
Convert_plot
