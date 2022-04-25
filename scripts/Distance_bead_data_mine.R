library(tidyverse)
library(unmarked) # Load unmarked

# Read distance sampling data for clear glass beads
# Be sure to use read.csv this time!!

beads <- read.csv("data_raw/bead_data_2021.csv")

str(beads)    # View the structure of the dataframe
head(beads)   # First few observations

# Store the length of each transect surveyed (i.e., survey effort)

transect_length <- beads %>% 
  group_by(group) %>% 
  summarise(length = mean(length))

# Plot the distribution of detection distances

hist(beads$distance)

# Based on the histogram, I'll suggest we truncate at 5 m

# Set truncation distance to eliminate extreme observations
trunc <- 5

# Set 'cut points' for distance bins; every 1 meter
distance_bins <- seq(0, trunc, by = 1) 

data <- formatDistData(beads, 
                       distCol = "distance", 
                       transectNameCol = "group", 
                       dist.breaks = distance_bins)
data

# Assemble data into the format required by unmarked, called an 'unmarked frame'
UMF <- unmarkedFrameDS(y = as.matrix(data), 
                       survey = "line", 
                       tlength = transect_length$length, 
                       dist.breaks = distance_bins, 
                       unitsIn = "m")
UMF

# Check the distribution of detection distances to be used for analysis

hist(UMF) 

HN   <- distsamp(~1 ~1, UMF, keyfun = "halfnorm", 
                 output = "density", unitsOut = "ha")
HR   <- distsamp(~1 ~1, UMF, keyfun = "hazard",
                 output = "density", unitsOut = "ha")
Unif <- distsamp(~1 ~1, UMF, keyfun = "uniform",
                 output = "density", unitsOut = "ha")
Exp  <- distsamp(~1 ~1, UMF, keyfun = "exp", 
                 output = "density", unitsOut = "ha")

# Model Selection

models <- fitList('Half Normal' = HN, 
                  'Hazard Rate' = HR,
                  'Uniform'     = Unif,
                  'Exponential' = Exp)
modSel(models)

### An illustration (*** no need for you to repeat this part ***) of the 
### the distance data with the Hazard rate function

hr.shape <- exp(coef(HR, type="det"))
hr.scale <- exp(coef(HR, type="scale"))
hist(UMF, xlab="distance (m)", main="Ocotillos", cex.lab=0.8, cex.axis=0.8) 
par(new=TRUE)
plot(function(x) gxhaz(x, shape=hr.shape, scale=hr.scale), 0, trunc, xaxt='n', yaxt='n', 
     ann = FALSE, col = "blue", lwd=2)

# --------   Density estimate   --------- #

# handy function to get out density and confidence intervals
backTransform(HN, type = "state") # Density estimate (no./m) 
exp(confint(HN, type = "state"))  # CI for density

# D-hat = 1528 / m
# Survey area = 12 x 45 m 
area <- 12 * 45 # 540 m^2

# One hectare = 100 m x 100 m
ha <- 100 * 100 # 10,000 m^2
area/ha * 1505

