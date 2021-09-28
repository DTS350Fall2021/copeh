library(tidyverse)
library(downloader)

heightsdata <- read_csv("heights.csv")
head(heightsdata)

# Make a new data set called HeightEd with different categories.
HeightEd <- heightsdata %>%
  mutate(grade =
           case_when(
             ed >= 3 & ed <= 6 ~ "primary", 
             ed >= 7 & ed <= 11 ~ "secondary",
             ed == 12 ~ "highschoolgrad",
             ed >= 13 & ed <= 15 ~ "associate",
             ed == 16 ~ "bachelors",
             ed >= 17 & ed <= 18 ~ "mastersdoctorate"))
head(HeightEd)

# Make a graphic to show the relationship between education and race.
HeightEd %>%
  mutate(grade = as.factor(fct_reorder(grade, earn))) %>%
  ggplot(aes(x = grade, y = earn, fill = race)) +
  geom_boxplot() +
  labs(x = "Grade",
       y = "Earnings",
       title = "Relationship Bewteen Education and Race")

# Make a graphic to show the relationship between education and sex.
HeightEd %>%
  mutate(grade = as.factor(fct_reorder(grade, earn))) %>%
  ggplot(aes(x = grade, y = earn, fill = sex)) +
  geom_boxplot() +
  labs(x = "Grade",
       y = "Earnings",
       title = "Relationship Betweeen Education adn Sex")

# Make a graph to show that incorporates good labels and good placement of the objects on the graph.
HeightEd %>%
  mutate(grade = fct_reorder(grade, age)) %>%
  ggplot(aes(x = grade, y = age, color = race)) +
  geom_boxplot() +
  labs(x = "Grades", 
       y = "Age", 
       title = "Relationship Between Grade, Age, and Race") +
  theme_bw()

# If I am understnding the data correctly, this is data for teachers. So from this graph 
# I was able to see that older people tend to teach primary education. It is surprising that 
# the age range for Masters Doctorate was pretty low. I am also not surprised that there are 
#a lot of professors under the "other" category for Bachelors because even being at Jewell 
# there are a wide range of races for professors, while primary had hardly any teachers that were apart of that category.


