# Merge Cactus and Cactus Pad Data

# Read in the data

## load the tidyverse
library(tidyverse)

## cactus data
cactus <- readr::read_csv("../../../ebledsoe@arizona.edu - Google Drive/My Drive/UArizona/Teaching/RNR321/2024_fall/Labs/Cactus_Fall2024.csv") %>% 
  tidyr::drop_na()
pads <- readr::read_csv("../../../ebledsoe@arizona.edu - Google Drive/My Drive/UArizona/Teaching/RNR321/2024_fall/Labs/CactusPads_Fall2024.csv")

# remove column 10 and empty rows from pads data
pads <- pads %>% 
  select(-`...10`) %>% 
  drop_na()

# join data frames
all_data <- dplyr::inner_join(pads, cactus)

# save as new csv file
readr::write_csv(all_data, "../../../ebledsoe@arizona.edu - Google Drive/My Drive/UArizona/Teaching/RNR321/2024_fall/Labs/CactusData.csv")
