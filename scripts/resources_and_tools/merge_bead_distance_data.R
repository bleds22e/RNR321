# Merge Bead Data from Distance Sampling
# EKB; November 2024
# Code originally from ChatGPT

# Install packages if not already installed
# install.packages(c("tidyverse", "googlesheets4"))

# Load necessary libraries
library(tidyverse)
library(googlesheets4)

# Set the URL of the Google Sheet
sheet_url <- "https://docs.google.com/spreadsheets/d/1X8l6yWhIVZ8b-GhuYLiHGPjtkrGkPGUfWB0KdnP5HmY/edit?gid=1097855229#gid=1097855229"

# Read all sheet names
sheet_names <- googlesheets4::sheet_names(sheet_url)
sheet_names <- sheet_names[1:10]

# Read each sheet and bind them together by rows
all_data <- sheet_names %>%
  map_dfr(~ read_sheet(sheet_url, sheet = .x), .id = "GroupID") %>% 
  drop_na() %>% 
  mutate(Transect_m = 37) # modify if different

# Write to file
file_path <- "" #insert file path here

write_csv(all_data, "data_raw/Distance_Data_Fall2024.csv")

