# Information on unmarked: http://cran.r-project.org/web/packages/unmarked/index.html
# User's manual: https://cran.r-project.org/web/packages/unmarked/unmarked.pdf
# Using unmarked with distance data: https://cran.r-project.org/web/packages/unmarked/vignettes/distsamp.pdf


# --------   Load unmarked   --------- #

library(unmarked)            # If unmarked loads, then skip the next command
# install.packages("unmarked") # After installing, rerun the library() command above
# update.packages(ask = FALSE)


# ========   Read distance data for saguaros < 2 m into a dataframe   ======== #

  saguaro <- read.csv("http://cals.arizona.edu/~steidl/saguaro2019.csv?attredirects=0")
  saguaro <- saguaro[ which(saguaro$group != 'CS, EG, MS' & 
                        saguaro$group != 'TF, CL, AE' & 
                        saguaro$group != 'TF, CV, CA'), ]
  
  str(saguaro)    # View the structure of the dataframe
                  # Variables are group [ID], transect length, and distance to plant
  head(saguaro)   # First few observations

# Store the length of each transect surveyed (i.e., survey effort)

  tl <- aggregate(length ~ group, saguaro, median)
  tl

# Plot the distribution of detection distances

  hist(saguaro$distance, xlab="distance (m)", main="Saguaros < 2m", cex.lab=0.8, cex.axis=0.8) 

# Set trunaction distance to eliminate extreme observations

  trunc <- 20

# Set 'cut points' for distance bins; for saguaros, every 4 meters

  db <- seq(0, trunc, by = 4) 

# Use unmarked function 'formatDistData' to count the number of detections in each distance bin
# for each transect -- ignore the warning message

  sag.data <- formatDistData(saguaro, distCol="distance", transectNameCol="group", dist.breaks=db)
  sag.data

# Assemble data into the format required by unmarked, called an 'unmarked frame'

  UMF <- unmarkedFrameDS(y=as.matrix(sag.data), survey="line", tlength = tl$length, 
         dist.breaks=db, unitsIn="m")
  UMF

# Check the distribution of detection distances to be used for analysis

  hist(UMF, xlab="distance (m)", main="Saguaros < 2m", cex.lab=0.8, cex.axis=0.8) 


# --------   Fit models for the detection function using function distsamp   --------- #

  HN   <- distsamp(~1 ~1, UMF, keyfun="halfnorm", output="density", unitsOut="ha")
  HR   <- distsamp(~1 ~1, UMF, keyfun="hazard",   output="density", unitsOut="ha")
  Unif <- distsamp(~1 ~1, UMF, keyfun="uniform",  output="density", unitsOut="ha")
  Exp  <- distsamp(~1 ~1, UMF, keyfun="exp",      output="density", unitsOut="ha")
  

# --------   Model Selection based on AIC   --------- #

# Assemble models into a list to compare their AIC values
# Identify the top model from this list (HN or HR or Unif or Exp), which you'll need to use below
  
  models <- fitList('Half Normal' = HN, 
                    'Hazard Rate' = HR,
                    'Uniform'     = Unif,
                    'Exponential' = Exp)
  modSel(models)


# --------   Goodness of fit test   --------- #

  (gof <- parboot(HN, nsim=100))
  plot(gof)

  # The fit isn't great, but we'll proceed

  
# --------   Density estimate   --------- #

  backTransform(HN, type="state") # Density estimate (no./ha) 
  exp(confint(HN, type="state"))  # CI for density


### An illustration (*** no need for you to repeat this part ***) of the 
### the distance data with the Hazard rate function

  hr.shape <- exp(coef(HR, type="det"))
  hr.scale <- exp(coef(HR, type="scale"))
  hist(UMF, xlab="distance (m)", main="Ocotillos", cex.lab=0.8, cex.axis=0.8) 
  par(new=TRUE)
  plot(function(x) gxhaz(x, shape=hr.shape, scale=hr.scale), 0, trunc, xaxt='n', yaxt='n', 
       ann = FALSE, col = "blue", lwd=2)
  
  
### ==========   Read distance data for ocotillos into a dataframe   ========== ###
  
  ocotillo <- read.csv("http://cals.arizona.edu/~steidl/ocotillo2019.csv?attredirects=0")
  ocotillo <- ocotillo[ which(ocotillo$group != 'CS, EG, MS' & 
                              ocotillo$group != 'TF, CL, AE' & 
                              ocotillo$group != 'TF, CV, CA'), ]

# Structure of the data frame and the first few observations

  str(ocotillo)
  head(ocotillo)

# Store the length of each transect (i.e., survey effort)

  tl <- aggregate(length ~ group, ocotillo, median)

# Plot the distribution of detection distances

  hist(ocotillo$distance, xlab="distance (m)", main="Ocotillos", cex.lab=0.8, cex.axis=0.8) 

### Use 25 m as the truncation point and 5 m distance bins
### Complete the remainder using the saguaro analysis as a template
### You need change only a few things to make it work 

### Use 25 m as the truncation point and 5 m distance bins
### Complete the remainder using the saguaro analysis as a template

  trunc <- 25
  db <- seq(0, trunc, by = 5)    # establish 5-m cut points for distance bins

# Use unmarked function 'formatDistData' to count the number of detection distances 
# in each distance bin for each transect  

  data <- formatDistData(ocotillo, distCol="distance", transectNameCol="group", dist.breaks=db)
  data

# Assemble data into the format required by unmarked, called an 'unmarked frame'

  UMF <- unmarkedFrameDS(y=as.matrix(data), survey="line", tlength = tl$length, 
         dist.breaks=db, unitsIn="m")
  UMF   

# Check the distribution of detection distances used for analysis

  hist(UMF, xlab="distance (m)", main="Ocotillos", cex.lab=0.8, cex.axis=0.8) 

  HN   <- distsamp(~1 ~1, UMF, keyfun="halfnorm", output="density", unitsOut="ha")
  HR   <- distsamp(~1 ~1, UMF, keyfun="hazard",   output="density", unitsOut="ha")
  Unif <- distsamp(~1 ~1, UMF, keyfun="uniform",  output="density", unitsOut="ha")
  Exp  <- distsamp(~1 ~1, UMF, keyfun="exp",      output="density", unitsOut="ha")

# Assemble models into a list to compare their AIC values

  models <- fitList('Half Normal' = HN, 
                    'Hazard Rate' = HR,
                    'Uniform'     = Unif,
                    'Exponential' = Exp)
  modSel(models)


