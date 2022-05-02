#####################################################
#     RNR 321: Ecological Surveys and Sampling      #
#              Module 5, Assignment 2               #
#  Exploring Other Distance-Based Sampling Methods  #
#####################################################

# As usual, having the PowerPoint slides open as you work through this exercise
# will be helpful! As will the example from lab:

# Load Libraries #

library(tidyverse)

# POINT-CENTERED QUARTER ---------------------------------------------------####

# Read in the data. This is data for saguaros > 2m tall.
saguaro <- read_csv("data_raw/PCQ_Data.csv")

head(saguaro)

numerator <- 6 * 4
denomenator <-  