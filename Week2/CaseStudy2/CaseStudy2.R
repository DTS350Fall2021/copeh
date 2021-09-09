library(tidyverse)

urlfile = "https://github.com/WJC-Data-Science/DTS350/raw/master/coral.csv"
mydata <- read_csv(url(urlfile))
View(mydata)

ggplot(data = mydata, aes(x = Year, y = Value, fill = Event)) +
  facet_wrap(~Entity, nrow = 3, scales = "free") +
  geom_col() +
  labs(title = "Number of coral bleaching events", 
       subtitle = "The number of moderate (up to 30% of corals affected) and severe bleaching events (more than 30% corals) measured at 100 \nfixed global locations. Bleaching occurs when stressful conditions cause corals to expel their algal symbionts.", 
       caption = "Source: Hughes, T. P., et al. (2018). Spatial and temporal patterns of mass bleaching of corals in the Anthropocene. Science. \nOurWorldInData.org/biodiversity · CC BY") +
  
  scale_fill_manual(values = c("deepskyblue4", "firebrick"), labels = c("Moderate (<30%)", "Severe (>30%)")) +
  scale_x_continuous(breaks = seq(1980, 2016, 3), expand = c(0, 0.1)) +
  scale_y_continuous(breaks = seq(0, 150, 25), expand = c(0, 0)) +
  
  theme(legend.title = element_blank(), legend.justification = c(0, 1), 
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.caption = element_text(hjust = 0, size = 8, color = 'gray40'),
        plot.title = element_text(size = 16, family = 'serif', color = "grey37", margin = margin(t = 1)),
        plot.subtitle = element_text(size = 8, color = "grey40"), 
        axis.ticks.x = element_line(color = "black"),
        axis.ticks.y = element_line(color = "white"),
        axis.text.y = element_text(color = "grey 40"),
        axis.text.x = element_text(color = "grey40"),
        panel.background = element_rect(fill = "white"),
        panel.grid.major.y = element_line(color = "gray", linetype = "dotted"))

# This data makes me believe that the bleaching is becoming more frequent because each of the plots are show raising bleaching events from 2012-2016.

ggplot(data = mydata, aes(x = Entity, y = Value, fill = Event)) +
  geom_col() +
  labs(title = "Number of coral bleaching events") +
  
  scale_fill_manual(values = c("deepskyblue4", "firebrick"), labels = c("Moderate (<30%)", "Severe (>30%)")) +
  
  theme(legend.title = element_blank(), legend.justification = c(0, 1), 
        legend.key.width = unit(1, "lines"),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(size = 16, family = 'serif', color = "grey37", margin = margin(t = 1)),
        axis.ticks.x = element_line(color = "black"),
        axis.ticks.y = element_line(color = "white"),
        axis.text.y = element_text(color = "grey 40", margin = margin(r = 0)),
        axis.text.x = element_text(color = "grey40", margin = margin(t = 0)),
        panel.background = element_rect(fill = "white"),
        panel.grid.major.y = element_line(color = "gray", linetype = "dotted"),
        axis.text = element_text(color = "black"))

#With this graph I am able to tell which region has the most bleaching evens total, while still seperating which events were severe or moderate.
