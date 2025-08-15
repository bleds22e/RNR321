###########################################
# RNR 321 Ecological Surveys and Sampling #
#         Module 5: Assignment 1          #
#           Distance Sampling             #
###########################################

# RESOURCES #
# The slides and practice code are under Labs in Module 5 on D2L. 

# If you are interested in more information about `unmarked,` check these out:
# Information on unmarked: http://cran.r-project.org/web/packages/unmarked/index.html
# User's manual: https://cran.r-project.org/web/packages/unmarked/unmarked.pdf
# Using unmarked with distance data: https://cran.r-project.org/web/packages/unmarked/vignettes/distsamp.pdf

# LIBRARIES #

library(tidyverse)
library(unmarked)

# SAGUAROS -----------------------------------------------------------------####

# 1. Read in the saguaro data
saguaro <- 

# 2. Make a dataframe with transect length (i.e., survey effort)
transect_length <- 

# 3. Plot the distribution of detection distances


# 4. Set truncation distance to 20m to eliminate extreme observations
trunc <- 

# 5. Set 'cut points' for distance bins; for saguaros, let's do every 4 meters
distance_bins <- 

# 6. Use unmarked function 'formatDistData' to count the number of detections in 
# each distance bin for each transect. Ignore the warning message.
sag_data <- 

# 7. Assemble data into the format required by unmarked, called an 'unmarked frame'
UMF <- 

# 8. Check the distribution of detection distances to be used for analysis


## Fit Models for the Detection Function ##

# 9. Use the distsamp function to create 4 mdoels: one of half-normal (HN), hazard (HR),
# one for uniform (Unif), and one for negative exponential (Exp). (2pts)
HN   <- 
HR   <- 
Unif <- 
Exp  <- 
  

## Model Selection based on AIC ##

# 10. Assemble models into a list to compare their AIC values. Identify the top model
# from this list (HN or HR or Unif or Exp), which you'll use below.
models <- 

# 11. Which model should we use? Why?


## Density Estimate and Confidence Intervals ##

# 12. Use the backTransform function to calculate the density estimate.


# 13. Calculate the confidence intervals for the density estimate.


  
# OCOTILLOS ----------------------------------------------------------------####

# Now, let's do the same thing for ocotillos. 

# 14. Read in the ocotillo data and make a dataframe with the transect lengths.
# Remember to use read.csv this time (instead of read_csv)! (2pts)
ocotillo <- 

transect_length_oco <- 

# 15. Plot the distribution of detection distances


# 16. This time around, set the truncation distance to Set truncation distance 
# to 25m and set cut points at every 5 meters.
trunc_oco <- 
distance_bins_oco <- 

# 17. Use unmarked function 'formatDistData' to count the number of detection in 
# each distance bin for each transect. Ignore the warning message. Remember to 
# use the correct data and distance bins.
oco_data <- 

# 18. Assemble data into the format required by unmarked, called an 'unmarked frame.'
# Remember to refer to the correct data frames and values
UMF_oco <- 

## Fit Models for the Detection Function ##

# 19. Fit the four models to the ocotillo data. Again, be sure you're using the 
# correct dataframe. (2pts)
HN_oco <- 
HR_oco <- 
Unif_oco <- 
Exp_oco <- 


## Model Selection based on AIC ##

# 20. Assemble models into a list to compare their AIC values. 
models_oco <- 

# Let's go ahead and use the Half-Normal model.

# 21. Get the density estimate and confidence intervals for it.


# COMPARE ------------------------------------------------------------------####

# 22. Which has the higher density per hectare? Saguaros or ocotillos? 


#---------------------------------------------------------------------------####
# Submit this script with your answers to the assignment dropbox on D2L.
#---------------------------------------------------------------------------####