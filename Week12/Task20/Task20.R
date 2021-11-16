install.packages("USAboudaries")
library(sf)
library(tidyverse)
library(maps)
library(lwgeom)
library(USAboundaries)
library(viridis)
install.packages("USAboundariesData", repos = "https://ropensci.r-universe.dev", type = "source")
install.packages("remotes")
remotes::install_github("ropensci/USAboundaries")
remotes::install_github("ropensci/USAboundariesData")

id <- us_counties(states = "ID")
states <- sf::st_as_sf(map("state", plot = FALSE, fill = TRUE))

contemporary_cities <- us_cities()

top_cities <- contemporary_cities %>%
  filter(state_name != 'Alaska', state_name != 'Hawaii') %>%
  group_by(state_name) %>%
  arrange(desc(population)) %>%
  slice(1:3)
View(top_cities)

number1 <- top_cities %>%
  slice(1:1)
View(number1)

number2 <- top_cities %>%
  slice(2:2)

number3 <- top_cities %>%
  slice(3:3)

ggplot() +
  geom_sf(data = states, fill = NA) +
  geom_sf(data = id, fill = NA) +
  geom_sf(data = number3, aes(size = population/1000), color = "lightblue") +
  geom_sf(data = number2, aes(size = population/1000), color = "royalblue1") +
  geom_sf(data = number1, aes(size = population/1000), color = "royalblue4") +
  geom_sf_label(data = number1, aes(label = city), color = "darkblue", nudge_x = 1.5, nudge_y = 1, size = 2) +
  scale_size_continuous(name = 'Population\n(1,000)') +
  theme_bw()

