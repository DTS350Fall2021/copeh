library(lubridate)
library(tidyverse)
install.packages("riem")
library(riem)
library(gridExtra)

car_wash <- read_csv(url("https://github.com/WJC-Data-Science/DTS350/raw/master/carwash.csv"))
head(car_wash)

#Convert times from UTC to mountain time
CarWash <- with_tz(car_wash, tzone = "US/Mountain")
head(CarWash)

#Create a new hourly grouping variable
new_CarWash <- CarWash %>%
  mutate(grouping_hour = ceiling_date(time, "hour"))
head(new_CarWash)

#Find the sum of the values over each hour
salesdata <- new_CarWash %>%
  mutate(hour = hour(time)) %>%
  group_by(hour) %>%
  summarise(amount = sum(amount, na.rm = TRUE))
View(salesdata)

#Get matching temperatures
temps <- riem_measures(station = "RXE", date_start = "2016-05-13", date_end = "2016-07-08")
View(temps)

#New hourly variable
new_temp <- temps %>%
  mutate(grouping_hour = ceiling_date(valid, "hour")) %>%
  select(valid, tmpf, grouping_hour) %>%
  drop_na(tmpf)
View(new_temp)

#Merge the two datasets
all_data <- left_join(new_CarWash, new_temp)
View(all_data)

#Visualization
hourplot <- ggplot(data = all_data, aes(x = grouping_hour, y = amount)) +
  geom_line() +
  theme_bw() +
  labs(x = "Time",
       y = "Sales Amount",
       title = "Sales per Hour")

tempplot <- ggplot(data = all_data, aes(x = grouping_hour, y = tmpf)) +
  geom_line() +
  theme_bw() +
  labs(x = "Time",
       y = "Temperature",
       title = "Temperatures During the Hours")

grid.arrange(tempplot, hourplot, nrow = 2)
# From this, I am not able to see any correlation that it very noticeable. The only point that I do see is that
# when the temperatures get to a low at the end of May, the sales take a drop. But then I see that when sales 
# are at there highest in mid-June, temperature are also pretty low, which is why I believe that there is no
# correlation between temperatures and sales.
