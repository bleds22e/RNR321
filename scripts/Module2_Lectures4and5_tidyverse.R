#------------------------------------------------------------------------------#
# Introduction to the `tidyverse`
# Data wrangling and cleaning with `dplyr`, `tidyr`, etc.
# EKB; Feb 2022
#------------------------------------------------------------------------------#

# What is the `tidyverse`? -------------------------------------------------####

# The `tidyverse` is an umbrella package, or a collection of packages!
# All packages included in the tidyverse share the same underlying structure,
# grammar, and data structures. They are designed to work seemlessly together.

# Everything we have worked with until now has been part of base R, or functions
# and language that come already installed with R. The tidyverse works a bit 
# differently but is actually more intuitive!

# To learn more about the packages in the tidyverse, check out these links.
# List of packages and what they do: https://www.tidyverse.org/packages/
# RStudio Cheatsheets: https://www.rstudio.com/resources/cheatsheets/
#   - specifically, the `dplyr` and `tidyr` cheatsheets, but there are many more!
# Data Carpentry lesson: https://datacarpentry.org/R-ecology-lesson/03-dplyr.html
# Effectively using the tidyverse: https://r4ds.had.co.nz/index.html

# Load `tidyverse` and Data-------------------------------------------------####

# LOAD PACKAGES #
# First we need to install the tidyverse if we haven't yet.
# Then we use the library() function to load it into R so we can use it.

# install.packages("tidyverse")
library(tidyverse)

# DATA #
# We will be using the teaching version of some data from my dissertation.
# Learn more about the Portal Project here: https://portal.weecology.org/
# PS - this is the same dataset at the end of Assignment 3.

# If you have already worked through most of Assignment 3, you likely already 
# have this file downloaded into your data_raw folder.

# If not, that's ok! It is in the Lectures submodule in Module 2 on D2L. 
# Download the file to your computer, navigate to your Module 2 RProject, and
# copy the file into