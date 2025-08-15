set.seed(16) # some seeds converge elsewhere -- not sure why
  
x <- rnorm(10000, 25, 5)
z <- sample(x, 10)
sds <- sd(z)
ses <- sd(z)/sqrt(length(z))

for (i in 2:25) 
  { z   <- c(z, sample(x, 10))
    sds <- c(sds, sd(z))
    ses <- c(ses, sd(z)/sqrt(length(z)))
  }

plot(seq(10, 250, 10), sds, xlim=c(-5, 255), ylim=c(3.5, 6.5), type='b', cex.lab=1.5, cex.axis=1.5, 
     xlab='n', ylab='Std. Deviation', col='darkblue')
abline(h=sd(x), col='gray50', lwd=1, lty=2)

plot(seq(10, 250, 10), ses, xlim=c(-5, 255), type='b', cex.lab=1.5, cex.axis=1.5, 
     xlab='n', ylab='Std. Error of y-bar', col='darkblue')
