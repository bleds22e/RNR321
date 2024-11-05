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
  map_dfr(read_csv, col_types = cols("Note" = col_character())) %>% 
  select(-RelativePath, -`...18`, -Mange:-`...17`)

# deal with datetimes
camera_data <- camera_data %>% 
  mutate(Date = dmy(Date)) %>% 
  mutate(Date = if_else(is.na(Date), as_date(DateTime), Date))

# extract camera label
camera_data <- camera_data %>% 
  mutate(Folder = case_when(str_detect(Folder, "Santa") ~ paste0("SC", str_extract(Folder, "\\d+")),
                            str_detect(Folder, "SCR") ~ str_remove(Folder, "R"),
                            TRUE ~ Folder)) %>% 
  separate(col = Folder, into = c("Camera", "date_range"), extra = "drop", remove = TRUE) %>% 
  select(-date_range, -File, -Time:-DeleteFlag, -Flag:-DateTime)

# pivot longer
long <- camera_data %>% 
  pivot_longer(cols = c(species1, species2), names_to = "sp", values_to = "Species") %>% 
  pivot_longer(cols = c(species1count, species2count),  values_to = "Count") %>% 
  select(-sp, -name)
  
# create a week column
long <- long %>% 
  mutate(Week = floor_date(Date, unit = "week"))

# turn into something that resembles an occupancy table
occupancy <- long %>% 
  drop_na(Species) %>% 
  select(-Date) %>% 
  group_by(Species, Camera, Week) %>% 
  pivot_wider(id_cols = Species:Camera,
              id_expand = TRUE,
              names_from = Week,
              values_from = Count,
              values_fill = 0,
              values_fn = sum) %>% 
  mutate(across(`2021-01-10`:`2021-08-29`, ~ if_else(. > 0, 1, .)))
