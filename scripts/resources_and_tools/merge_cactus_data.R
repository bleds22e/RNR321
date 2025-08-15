# Merge Cactus and Cactus Pad Data

# Read in the data

## load the tidyverse
library(tidyverse)

# insert name of folder for the semester and names of csvs
semester <- "2025_fall"
cactus <- "Cactus_Fall2025.csv"
cactus_pads <- "CactusPads_Fall2025.csv"

## cactus data
cactus <- readr::read_csv(paste0("../../../ebledsoe@arizona.edu - Google Drive/My Drive/UArizona/Teaching/RNR321/", 
                                 semester, 
                                 "Labs/",
                                 cactus)) %>% 
  tidyr::drop_na()
pads <- readr::read_csv(paste0("../../../ebledsoe@arizona.edu - Google Drive/My Drive/UArizona/Teaching/RNR321/", 
                               semester, 
                               "Labs/",
                               cactus_pads))

# remove column 10 and empty rows from pads data
pads <- pads %>% 
  select(-`...10`) %>% 
  drop_na()

# join data frames
all_data <- dplyr::inner_join(pads, cactus)

# save as new csv file
readr::write_csv(all_data, "../../../ebledsoe@arizona.edu - Google Drive/My Drive/UArizona/Teaching/RNR321/",
                 semester, 
                 "Labs/CactusData.csv")
