install.packages("ggrepel")

library(tidyverse)
library(ggrepel)

?iris

ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point()

# PROPERLY LABELING THE CHART
ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setosa's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris")

# Exercise
ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setosa's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris",
       shape = "Species of Iris",
       color = "Species of Iris")
# Before I did the color line it was giving me two legends, one being the shape and the other being the color. After adding shape it combined the two legends.

# ANNOTATION
best_flower <- iris %>%
  group_by(Species) %>%
  filter(row_number(desc(Sepal.Width)) == 1)

ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length)) +
  geom_point(aes(color = Species, shape = Species)) +
  geom_text(aes(color = Species, label = Species), data = best_flower) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setosa's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris")

ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length)) +
  geom_point(aes(color = Species, shape = Species)) +
  geom_point(size = 3, shape = 1, color = "black", data = best_flower) +
  ggrepel::geom_label_repel(aes(color = Species, label = Species), data = best_flower) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setosa's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris") +
  theme(legend.position = "none")

label_data <- tibble(
  Sepal.Width = 2.55,
  Sepal.Length = 4.5,
  label = "My Favorite Flower"
)

arrow_data <- data.frame(x1 = 2.5, y1 = 4.5, x2 = 2.35, y2 = 4.5)

ggplot(data = iris, mapping = aes(x = Sepal.Width, y = Sepal.Length)) +
  geom_point(aes(color = Species)) +
  geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), color = "purple", data = arrow_data, arrow = arrow(length = unit(0.1, "in"))) +
  geom_point(size = 3, shape = 1, color = "black", data = best_flower) +
  geom_text(aes(label = label), data = label_data, vjust = "center", hjust = "left") +
  ggrepel::geom_label_repel(aes(label = Species, color = Species), data = best_flower) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "We can predict Setosa's sepal length from its width",
       subtitle = "Versicolor and Virginica are not predictable",
       caption = "Source: iris") +
  theme(legend.position = "none")

# ADJUSTING THE SCALE OF VARIOUS ASTHESTICS
ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) 

# Exercise
ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10()
# This changed the scale of the x and y axis which shifted my data

ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c("purple", "darkorange", "blue"))

ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species),
       size = 5) +
  geom_point() +
  scale_color_brewer(palette = "Set1") 

# ZOOMING
ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species),
       size = 5) +
  geom_point() +
  coord_cartesian(xlim = c(2,4), ylim = c(5,7), expand = FALSE) +
  scale_color_brewer(palette = "Set1")

# THEMES
ggplot(data = iris, mapping = aes(x=Sepal.Width, 
                                  y = Sepal.Length, 
                                  color = Species,
                                  shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c(setosa = "purple", versicolor = "darkorange", virginica = "blue")) +
  labs(x= "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "This is where I would put a title") +
  theme(plot.title = element_text(hjust = .5))

ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, color = Species, shape = Species)) +
  geom_point() +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c("purple", "orange", "blue")) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "This is where I would put a title",
       shape = "Species of Iris",
       color = "Species of Iris") +
  theme_bw()

# Exercise
averages <- iris %>%
  group_by(Species) %>%
  mutate(avglength = mean(Sepal.Length))
averages

ggplot(data = iris, mapping = aes(x = Sepal.Width, 
                                  y = Sepal.Length, color = Species, shape = Species)) +
  geom_point() +
  geom_hline(data = averages, mapping = aes(yintercept = avglength), color = "red") +
  scale_shape_manual(values =  c(1, 5, 7)) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values = c("purple", "orange", "blue")) +
  labs(x = "Sepal Width (cm)",
       y = "Sepal Length (cm)",
       title = "This is where I would put a title",
       shape = "Species of Iris",
       color = "Species of Iris") +
  theme_bw()
# To change the color you as the code "color = 'red'" to the geom_hline data.

 






