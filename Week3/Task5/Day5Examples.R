install.packages("downloader")
install.packages("readxl")

library(tidyverse)
library(downloader)
library(readxl)

#EXAMPLE 1
money <- c("4,554,25", "$45", "8025.33cents", "288f45")
as.numeric(money)
# Output = NA NA NA NA
parse_number(money)
# Output = 455425.00 45.00 8025.33 288.00

#EXAMPLE 2
my_string <- c("123", ".", "3a", "5.4")
parse_integer(my_string, na = ".")
problems(my_string)
# The problem is that 3a and 5.4 are not integers so the code is printing an error. "." would also come up as an error is it wasn't coded as NA.

#EXAMPLE 3
challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)
head(challenge)
tail(challenge)
# All of the Y values are NA

challenge <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)
challenge

#DATA IMPORT
download.file("https://educationdata.urban.org/csv/ipeds/colleges_ipeds_completers.csv",
              "colleges_ipeds_completers.csv")
download.file("https://educationdata.urban.org/csv/ipeds/colleges_ipeds_completers.csv",
              "colleges_ipeds_completers.csv", mode = "wb")
ipeds <- read_csv("colleges_ipeds_completers.csv")

#TEMPORARY FILES
bob <- tempfile()
download("https://educationdata.urban.org/csv/ipeds/colleges_ipeds_completers.csv", bob, mode = "wb")
ipeds <- read_csv(bob)

#SAVING FILES
ipeds_2011 <- ipeds %>%
  filter(year == 2011)

write_csv(ipeds_2011, "colleges_ipeds_completers_2011.csv")

exercise1 <- ipeds %>%
  filter(year == 2014:2015, fips == 6)
head(exercise1)
tail(exercise1)

write_csv(exercise1, "ipeds_completers_ca.csv")

# THE READXL PACKAGE
download.file("https://www.hud.gov/sites/dfiles/Housing/documents/FHA_SFSnapshot_Apr2019.xlsx",
              "sfsnap.xlsx", mode = "wb")
excel_sheets("sfsnap.xlsx")
purchases <- read_excel("sfsnap.xlsx", sheet = "Purchase Data April 2019")
purchases

refinances <- read_excel("sfsnap.xlsx", sheet = "Refinance Data April 2019")
refinances
