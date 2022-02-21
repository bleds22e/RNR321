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
# Save it as an object called surveys.
surveys <- read_csv("data_raw/portal_data_joined.csv")


# 8. There are many different functions we can use to look at our dataset. 
# Choose your favorite to get an idea of all the columns in this dataset.

# any one of these is fine
head(surveys); glimspe(surveys); str(surveys); view(surveys)



# 9. IN YOUR OWN WORDS, explain what the select() function (from tidyverse) does.

# the select function allows us to specify which columns you want a df to contain

# 10. Use the select() function to create a dataframe that has only the following
# columns: year, plot_id, species_id, weight
select(surveys, year, plot_id, species_id, weight)


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



# 13. Write and execute a line of code that selects the 6-10th height values



# 14. Execute the line below

heights_above_67 <- heights[heights > 67]

# What does this line do?
# Answer: 


# 15. Execute the two lines below

length(heights)
length(heights_above_67)

# What do these lines tell us?
# Answer:



# 16. Create the object char_vec that contains the values A, C, D, C



# 17. Issue the lines below

char_vec == 'C'
char_vec != 'C'

# What do these lines do?
# Answer: 



# Data Frames -------------------------------------------------------------####

# Run the following line of code. This will download a csv file with some rodent
# data from the Portal Project into your RProject. 
# Learn more about the Portal Project here: https://portal.weecology.org/

# As written this code with download the data into a folder called "data_raw"
# If you named your folder something different, you will need to change the
# "destfile" argument to direct it to the correct folder.

download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

# Now read in the csv file using the following line of code.
surveys <- read.csv("data_raw/portal_data_joined.csv")

# 18. Look at the first 6 rows of data. You can either do this by using a 
# function or by using index subsetting (with the square brackets: [])



# 19. How many rows does this data frame have? How many columns?
# Rows:
# Columns:



# 20. Use a function to print the column names of surveys.



# 21. Create a histogram with the hindfoot lengths column



# 22. What does the following line of code do?
surveys[surveys$species_id == "DM", ]

# Answer: 



# 23. Explain what the following lines of code do (2 points).
weights_noNA <- surveys[!is.na(surveys$weight),]
weights_over200g <- weights_noNA[weights_noNA$weight >= 200, ]

# Answer #
# First line:
# Second line:


# ---------------------------------------------------------------------------- #
### When you are finished, save this script as "LastName_RNR321_Assignment4.R"
### Submit this file via D2L--just the script, not the entire project.
# ---------------------------------------------------------------------------- #
