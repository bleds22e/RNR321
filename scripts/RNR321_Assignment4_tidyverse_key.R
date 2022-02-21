# -----------------------------------------------------------------------------#
# Assignment 4
# Answer the question with comments OR
# Insert the appropriate code below each question or
# -----------------------------------------------------------------------------#

# Definitions (1 point each) -----------------------------------------------####

# IN YOUR OWN WORDS, define/describe the following. These don't need to be 
# technical descriptions but rather how you are thinking about them. Feel free
# to Google the answers if you are feeling unsure!

# 1. RProject


# 2. R package


# 3. `tidyverse`


# 4. the pipe (AKA %>%)



# Code (1 point each unless otherwise noted) -------------------------------####

## For this assignment, we will again be using the "portal_data_joined.csv" file

## Before we start, be absolutely sure that you are working in your Module 2
## RProject!

# 6. Load the `tidyverse` package into R/RStudio
library(tidyverse)


# 7. Read in the "portal_data_joined.csv" file using the read_csv() function.
# Assign this to an object called "rat_dat" (short for "rat data").
rat_dat <- read_csv("data_raw/portal_data_joined.csv")


# 8. There are many different functions we can use to look at our dataset. 
# Choose your favorite to get an idea of all the columns in rat_dat.

# any one of these is fine
head(rat_dat); glimpse(rat_dat); str(rat_dat); view(rat_dat)

# 9. IN YOUR OWN WORDS, explain what the select() function (from tidyverse) does.

# the select function allows us to specify which columns you want a df to contain

# 10. Use the select() function to create a dataframe that has only the following
# columns: year, plot_id, species_id, weight. 
select(rat_dat, year, plot_id, species_id, weight)


# 11. This time, use the select function to create a dataframe with all of the 
# original columns EXCEPT record_id and taxa. 
select(surveys, -record_id, -taxa) # preferred answer
select(surveys, month:species, plot_type) # fine answer
# listing out all of the columns except record_id and taxa is also acceptable but
# probably warrents a comments that they should try to be more efficient with 
# their code by using one of the answers above


# 12. IN YOUR OWN WORDS, explain what the filter() function does.

# the filter function allows us to specify which rows we want to include in the
# dataframe based on specific conditions

# 13. Create a dataframe from rat_dat that only includes observations from 
# the year 2000 and later. 
filter(rat_dat, year >= 2000)


# 14. Create a dataframe that only includes observations where the genus of the 
# rodent is Dipodomys (these are kangaroo rats!). Assign this dataframe to an
# object called krat_dat.
krat_dat <- filter(rat_dat, genus == 'Dipodomys')


# 15. Execute the line of code below. 

rat_dat %>% 
  filter(taxa == 'Rodent') %>% 
  select(year, plot_id, species_id, plot_type)

# Describe what this code is doing.

# this code takes the dataframe rat_dat, filters for only rows for which the 
# value in the 'taxa' column is equivalent to "Rodent" and then selects only 
# the columns year, plot_id, species_id, and plot_type

# 16. IN YOUR OWN WORDS, explain what the mutate() function does.

# the mutate() function helps us create new columns from existing columns and
# applying a mathematical function or other functions 

# 17. The hindfoot_length column in currently in mm. Create a new column named 
# hindfoot_length_cm where the hindfood measurement is now in centimeters.
# Hint: divide by 10!
mutate(rat_dat, hindfoot_length_cm = hindfoot_length / 10)


# 18. IN YOUR OWN WORDS, explain what the group_by() function does.
# the group_by() function splits the df up into sections by categorical data


# 19. Use the group_by() and summarize() functions together to calculate the
# mean hindfoot_lenght (mm) for each species_id in rat_dat. Remember to use %>%, 
# and remember to exclude NAs from the mean calculation (2 points)
rat_dat %>% 
  group_by(species_id) %>% 
  summarize(mean_hf_length = mean(hindfoot_length, na.rm = TRUE))
# if they use filter(!is.na(hindfoot_length)) instead of na.rm = TRUE, that's fine


# 20. That's still a lot of non-numeric values! (NaN means "not a number," which)
# means we tried to do a calculation on NA values. The reason we have so many of
# these values is because a lot of the species_ids at the top of the dataframe
# are not rodents, so we don't measure their hindfeet. Add in a line to code
# from question 19 to choose only observations of rodents. You might still get
# a few NaN values (long story...), but you should have far fewer!
# Hint #1: Check out the code from question 15. That might be helpful!
# Hint #2: Think carefully about the order in which you add the new line.
rat_dat %>% 
  filter(taxa == 'Rodent') %>% 
  group_by(species_id) %>% 
  summarize(mean_hf_length = mean(hindfoot_length, na.rm = TRUE))

# 21. Copy and paste the code you wrote for question 20 into the answer space 
# for this question. Add a line of code to the code you wrote for question 20 
# which arranges the results from smallest mean hindfoot length to largest.
rat_dat %>% 
  filter(taxa == 'Rodent') %>% 
  group_by(species_id) %>% 
  summarize(mean_hf_length = mean(hindfoot_length, na.rm = TRUE)) %>% 
  arrange(mean_hf_length)


# 22. Write some code to calculate the mean, minimum, maximum, median, and
# standard deviation for the weight of EACH kangaroo rat species_id. Do this only
# for observations from the year 2000 and later. Assign the output to an object 
# called krat_summary_stats. Print out the dataframe afterwards (3 points)
# Hint: use the krat_dat dataframe that we created (and saved) earlier.
krat_summary_stats <- krat_dat %>% 
  filter(year >= 2000, !is.na(weight)) %>% 
  group_by(species_id) %>% 
  # fine if they do na.rm = TRUE for each one instead of filering out the NAs
  summarise(mean = mean(weight), 
            std_dev = sd(weight),
            median = median(weight),
            minimum = min(weight),
            maximum = max(weight))
krat_summary_stats 

# correct object name (krat_summary_stats) - 0.25 points
# correct dataframe (krat_data) - 0.5 points
# filtering by the correct years - 0.5 points
# group_by function with correct column - 0.5 points
# summarize function, each one of the calculations is 0.2 points (x5)
# printing out the dataframe at the end = 0.25 points
# take off 1 point if they don't use the pipe

# ---------------------------------------------------------------------------- #
### When you are finished, save this script as "LastName_RNR321_Assignment4.R"
### Submit this file via D2L--just the script, not the entire project.
# ---------------------------------------------------------------------------- #
