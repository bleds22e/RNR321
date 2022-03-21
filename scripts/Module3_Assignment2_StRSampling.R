# -----------------------------------------------------------------------------#
# Module 3, Assignment 2
# Stratified Random Sampling -- Grasshoppers!
#
# Answer the question with comments OR
# Insert the appropriate code below each question
# -----------------------------------------------------------------------------#

# Load the tidyverse #

library(tidyverse)

# Optimal Allocation of Sample Units #-----------------------------------------#

# Let's say we have a population (sampling frame) with 1000 sample units. We can
# sample 100 of those units. There are 3 sampling strata, all with different 
# characteristics. How do we decide how many sampling units to sample from each
# stratum?

# 1. Create an object, N, with the total number of possible sample units.

  
# Stratum A has 200 sampling units, Stratum B has 500 sampling units, and 
# Stratum C has 300 sampling units. 

# 2. Add the correct values to the lines of code below and run each line.
N_A <-
N_B <- 
N_C <- 

# Due to a pilot study done last year, we also know the variation (standard dev.) 
# for each stratum.
sd_A <- 9
sd_B <- 4
sd_C <- 7

# We also have an estimate of the time-cost (hours) it takes to survey each unit.
cost_A <- 1.5
cost_B <- 2
cost_C <- 4

# Use the optimal allocation equation to calculate how many sample units each 
# stratum should have. Let's do this incrementally.

# 3. Start by calculating Ni * si / square root of ci for each stratum. 
opt_allo_A <- 
opt_allo_B <- 
opt_allo_C <- 

# 4. Calculate the denominator of the equation by adding all of them together.
opt_allo_total <- 
  
  
# 5. Calculate how many sampling units we should optimally sample in each stratum.
# Name these objects n_A, n_B, and n_C. Use the round() function to round to 
# the nearest whole number.


# 6. If we did not have the pilot study telling us about the variation of the 
# populations in each strata, we could have allocated very differently:
# n_A = 24, n_B = 53, and n_C = 23. Why is this?



# Stratified Random Sampling Calculations #------------------------------------#

## Getting the Data ##

# Hooray! We have gone out and sampled the number of grasshoppers per sample unit, 
# allocating our sample units optimally (including variation in population).

# Now we want to calculate our population parameters:
# mean grasshoppers per sampling unit (y bar)
# total grasshoppers in the population (tau hat)

# Download the "grasshoppers.csv" file from D2L.
# Place it in your "data_raw" folder in your Module 3 RProject.
# Read in the grasshoppers CSV file using the read_csv() function, and 
# call it grasshoppers


# Explore the dataset.


# 7. Run the following line of code. 
# (Hint: do these numbers match your values from question X? If not, you 
# probably want to revisit your calculations up in the previous section!)
grasshoppers %>% 
  group_by(stratum) %>% 
  count(stratum)
# What is it telling us? 


# 8. For now, the easiest way to do our calculations will be to have three different
# data frames, one for each stratum. Use the filter function and create the
# following three dataframes:
stratumA <- 
stratumB <- 
stratumC <- 


## Calculations ##

# NOTE: Open up your script for Module 3, Assignment 1--it's about to come in 
# handy! So will the lecture slides from lectures 14 and 15.


## Calculations for the means of each stratum ##

# 9. Use the code from there to calculate the following for EACH stratum
# (these are all for the mean number of grasshoppers per sample unit; 8 points 
# total, 2 each):
# a. sample mean per stratum (y_bar)

# b. sample variance per stratum (var)

# c. variance of the estimate of the mean per stratum (var_y_bar)

# d. standard error per stratum (SE_y_bar) (Remember the finite population correction factor!)



## Calculations for the totals of each stratum ##

# 12. Calculate the following for EACH stratum (these are all related to the 
# total number of grasshoppers in each stratum)(6 points total, 2 each):
# a. total abundance per stratum (tau_hat)

# b. variance of abundance per stratum (var_tau_hat)

# c. standard error of abundance per stratum (SE_tau_hat)



## Calculation the OVERALL population mean and population total ##

# 13. Calculate the non-weighted overall population mean.


# 14. Calculate the weighted overall population mean.


# 15. How do the two means differ? Why?

