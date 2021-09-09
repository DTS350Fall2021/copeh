library(tidyverse)
library(tibble)

#Convert the iris data to a tibble called iris_data.
iris_data <- tibble(iris)
iris_data

#Arrange the iris data by Sepal.Length and display the first ten rows.
sepal_length <- arrange(iris_data, Sepal.Length)
head(sepal_length, n = 10)

#Select the Species and Petal.Width columns and put them into a new data set called testdat.
testdat <- select(iris_data, Species, Petal.Width)
testdat

#Create a new table called species_mean that has the mean for each variable for each Species,
species_group <- group_by(iris_data, Species)
species_mean <- summarise(species_group, Sepal.Length_mean = mean(Sepal.Length, na.rm = TRUE),
                            Sepal.Width_mean = mean(Sepal.Width, na.rm = TRUE),
                            Petal.Length_mean = mean(Petal.Length, na.rm = TRUE),
                            Petal.Width_mean = mean(Petal.Width, na.rm = TRUE))
species_mean         

#Create a data frame called iris_min with only the observations with at least 3 for Sep.Width and not 2.5 for Petal.Width.
iris_min <- filter(iris_data, Sepal.Width >= 3, Petal.Width != 2.5)
iris_min                          

#Create a date frame called iris_size with a column Sepal.Size which is small if Sepal.Length < 5, medium if Speal.Length >= 5 and < 6.5, and large if Sepal.Length >= 6.5.
iris_size <- mutate(iris_data,
                    Sepal.Size = 
                      case_when(
                        Sepal.Length < 5 ~ "small",
                        Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "medium",
                        Sepal.Length >= 6.5 ~ "large"))
iris_size                          
                          
#Create a data frame called iris_rank which ranks all of the data by Petal.Length, where a rnking of 1 is the largest Petal.Length and order by ranking.
iris_rank <- arrange(iris_data, desc(Petal.Length))
iris_rank

#Read about the ?summarize_all() function and get a new table with the means and standard devisations for each species.
?summarize_all()

Mean_Sd_ForallSpecies <- 
  iris_data %>%
  group_by(Species) %>%
  summarize_all(list(Mean = mean, Std_Dev = sd))
Mean_Sd_ForallSpecies  
