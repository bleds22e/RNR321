# Script to Create New Cactus Data

library(tidyverse)

cactus <- readr::read_csv("../../../Google Drive/My Drive/UArizona/Teaching/RNR321/2024_spring/Labs/Cactus_Spring2024.csv") %>% 
  drop_na() %>% 
  mutate(species = if_else(species == "Opuntia engelemannii", 
                           "Opuntia engelmannii",
                           species)) %>% 
  select(-group_members)
pads <- readr::read_csv("../../../Google Drive/My Drive/UArizona/Teaching/RNR321/2024_spring/Labs/CactusPads_Spring2024.csv",
                        col_select = c(1:9)) %>% 
  drop_na()

cactus_data <- full_join(cactus, pads)

write_csv(cactus_data, "output/all_cactus_data_sp2024.csv")
