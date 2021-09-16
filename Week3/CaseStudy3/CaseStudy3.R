install.packages("gapminder")
library(tidyverse)
library(gapminder)
library(dplyr)
library(ggplot2)

str(gapminder)
gapminder

life_data <- filter(gapminder, country != 'Kuwait')
life_data

ggplot(data = life_data) +
  geom_point(mapping = aes(x = lifeExp, y = gdpPercap, color = continent, size = pop)) +
  facet_wrap(~ year, nrow = 1) +
  scale_y_continuous(trans = "sqrt") +
  ylab("GDP Per Capita") +
  xlab("Life Expectancy") +
  theme_bw()

weighted_avg <- life_data %>%
  group_by(year, continent) %>%
  summarise(average = weighted.mean(gdpPercap), population = pop/10000)
weighted_avg

?gapminder
ggplot(data = life_data, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(data = life_data, mapping = aes(color = continent)) +
  geom_line(data = life_data, mapping = aes(color = continent, group = country)) +
  geom_point(data = weighted_avg, aes(x = year, y = average, size = population)) +
  geom_line(data = weighted_avg, aes(x = year, y = average)) +
  facet_wrap(~ continent, nrow = 1) +
  xlab("Year") + 
  ylab("GDP Per Capita") +
  scale_size_continuous(name = "Population (100k)", breaks = c(10000, 20000, 30000)) +
  theme_bw()

