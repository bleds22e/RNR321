# -----------------------------------------------------------------------------#
# Assignment 3
# Answer the question with comments OR
# Insert the appropriate code below each question or
# -----------------------------------------------------------------------------#

# Definitions (1 point each) -----------------------------------------------####

# IN YOUR OWN WORDS, define/describe the following. These don't need to be 
# technical descriptions but rather how you are thinking about them.

# 1. Reproducibility


# 2. Open science


# 3. R


# 4. RStudio


# Short-Answer Question (2 points)------------------------------------------####

# 5. In 2-3 sentences, explain why data management is important for 
# reproducibility.



# Vectors (1 point each) ---------------------------------------------------####

# If you haven't already, run the following lines of code:
# install.packages("swirl")
# library(swirl)
# swirl()
# Select the "R Programming" option by typing 1 in the console and hitting enter
# Work your way through lessons 3, 6, and 7.
# When it asks if you want credit on Coursera, select no.

# 6. Multiply 8 x 5 and send the result to the console



# 7. Create the object x and have it contain the result of 8 x 5



# 8. Create the object y and have it contain the result of the square root of 9
# HINT: use the square root function.



# 9. Create the object num_vec that contains the values 1, 3, 5, 7



# 10. Run the line below to create the object heights. 
# Note: NA is the value used by R to identify missing data. 

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 
             69, 63, 63, NA, 72, 65, 64, 70, 63, 65)


# 11. Use the mean() function to calculate the mean value of height and send the 
# result to the console



# 12. This should yield an odd result caused by the NAs. 
# To resolve this, use the help function to learn about the 
# argument na.rm = TRUE that applies to many R functions

help(mean) # same as ?mean

# Issue a revised command to calculate the mean value in num_vec and 
# send the result to the console



# 13. Execute the line below

heights_above_67 <- heights[heights > 67]

# What does this line do?
# Answer: 


# 14. Execute the two lines below

length(heights)
length(heights_above_67)

# What do these lines tell us?
# Answer: 



# 15. Write and execute a line of code that selects the 5-10th height values



# 16. Create the object char_vec that contains the values A, C, D, C



# 17. Issue the lines below

char_vec == 'C'
char_vec != 'C'

# What do these lines do?
# Answer: 



# Data Frames -------------------------------------------------------------####


# ----------------------------------------------------------------------------------------------- #
### When you are finished, save this script, then upload the file to D2L
### Submit a revised version of this file via D2L. 
# ----------------------------------------------------------------------------------------------- #
