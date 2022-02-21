# Introduction to tidyverse
# Package `dplyr` and `tidyr`
# EKB; Feb 2022

# install.packages("tidyverse")
library(tidyverse)

# data
surveys <- read_csv("data_raw/portal_data_joined.csv")
str(surveys)
head(surveys)
view(surveys)
glimpse(surveys)

# select
# choose columns
select(surveys, plot_id, species_id, weight)
select(surveys, -record_id)

# filter
# choosing rows based on specified critera
filter(surveys, year == 1995)
filter(surveys, year >= 1995)
filter(surveys, species_id == "DM")
filter(surveys, year >= 1995, species_id == 'DM')

# pipes
# %>% 
# Ctrl + Shift + M (Windows)
# Cmd + Shift + M (Mac)

surveys2 <- filter(surveys, weight < 5)
surveys_smol <- select(surveys2, species_id, sex, weight)

rm(surveys_smol)

surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight) %>% 
  glimpse()
  