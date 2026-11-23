# Merge Bead Data from Distance Sampling
# EKB; November 2024
# Code originally from ChatGPT

# Install packages if not already installed
# install.packages(c("tidyverse", "googlesheets4"))

# Load necessary libraries
library(tidyverse)
library(googlesheets4)

# Set the URL of the Google Sheet
# CANNOT be an Excel file, even on the web
sheet_url <- "https://docs.google.com/spreadsheets/d/17gaN72s9nQlZ1bSmsTFI0P2Df2GehVREupWrXTYf4Gc/edit?gid=1302884103#gid=1302884103"

# Read all sheet names
sheet_names <- googlesheets4::sheet_names(sheet_url)
sheet_names <- sheet_names[1:12]  # actual used sheets

# Read each sheet and bind them together by rows
all_data <- sheet_names %>%
  map_dfr(~ read_sheet(sheet_url, sheet = .x), .id = "GroupID") %>% 
  drop_na() %>% 
  mutate(Transect_m = 33) # modify if different

# Write to file
file_path <- "data_raw/Distance_Data_Fall2026.csv" #insert file path here

write_csv(all_data, file_path)

