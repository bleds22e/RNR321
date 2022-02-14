# -----------------------------------------------------------------------------#
# Assignment 3
# Answer the question with comments OR
# Insert the appropriate code below each question or
# -----------------------------------------------------------------------------#

# Definitions (1 point each) ####

# IN YOUR OWN WORDS, define/describe the following. These don't need to be 
# technical descriptions but rather how you are thinking about them.

# 1. Reproducibility


# 2. Open science


# 3. R


# 4. RStudio


# Question ####

# 5. In 2-3 sentences, explain why data management is important for 
# reproducibility. (2 points)



# Code (1 point each) ####

# If you haven't already, run the following lines of code:
# install.packages("swirl")
# library(swirl)
# swirl()
# Select the "R Programming" option by typing 1 in the console and hitting enter
# Work your way through lessons 3, 6, and 7.
# When it asks if you want credit on Coursera, select no.

# 6. Multiply 8 x 5 and send the result to the console



# 7. Create the object x and have it contain the result of 8 x 5



# 8. Create the object y and have it contain the result of the square root of nine
# HINT: use the square root function.



# Create the object z and have it contain the result of x divided by y



# Raise z to the third power and send the result to the console



# What is the name of an R object that holds only one value? 
# Your answer: 


# What is the name of an R object that holds multiple values of the same type, such as a number? 
# Your answer: 


# Create the object num_vec that contains the values 1, 3, 5, 7



# Multiply three times each value in num_vec and send the result to the console



# Execute the line below to create the object heights ; Note, NA is the value
# used by R to identify missing data 

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 
             69, 63, 63, NA, 72, 65, 64, 70, 63, 65)


# Use the mean() function to calculate the mean value in height and send the result to the console



# This should yield an odd result caused by the NAs; 
# to resolve this, use the help function to learn about the 
# argument na.rm = TRUE that applies to many R functions

help(mean) # same as ?mean

# Below, issue a revised command to calculate the mean value in num_vec and 
# send the result to the console



# Execute the line below

heights_above_67 <- heights[heights > 67]

# What does this line do?
# Answer: 


# Execute the two lines below

length(heights)
length(heights_above_67)

# What do these lines tell us?
# Answer: 



# Create the object char.vec that contains the values A, C, D, C



# Issue the lines below

char.vec == 'C'
char.vec != 'C'

# What do these lines do?
# Answer: 


# ----------------------------------------------------------------------------------------------- # 
### Assignment, part B. Follow the instructions on the pdf provided on D2L for lab.
# ----------------------------------------------------------------------------------------------- #

# Code to import three datasets into R: 

plain  <- read.csv("https://cals.arizona.edu/~steidl/plain.csv", header=TRUE)
peanut <- read.csv("https://cals.arizona.edu/~steidl/peanut.csv", header=TRUE)
temp   <- read.csv("https://cals.arizona.edu/~steidl/TucsonTemp.csv", header=TRUE)

# Include code for problem 1 below




# Include code for problem 2 below




# Include code for problem 3 below




# ----------------------------------------------------------------------------------------------- #
### When you are finished, save this script, then upload the file to D2L
### Submit a revised version of this file via D2L. 
# ----------------------------------------------------------------------------------------------- #
