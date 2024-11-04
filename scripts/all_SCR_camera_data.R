# Santa Cruz River Camera Trap Data
# November 2025
# EKB; RNR 321 Occupancy 

# Packages and Data
library(tidyverse)
library(fs) # package for file systems

## Set the directory
data_dir <- "data_raw/SCR camera data raw/"

## Read in all CSVs in the directory and join by row using purrr
camera_data <- data_dir %>% 
  dir_ls() %>% 
  map_dfr(read_csv, col_types = cols("species1count" = col_character(), 
                                     "species2count" = col_character(),
                                     "Note" = col_character())) %>% 
  select(-RelativePath, -`...18`, -Mange:-`...17`)
