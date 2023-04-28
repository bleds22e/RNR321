library(tidyverse)

# CPUE Data Frame #----

df <- tibble::tibble(.rows = 6,
                     NumFish = c(281, 199, 168, 82, 127, 22),
                     Minutes = c(20, 15, 15, 10, 20, 5),
                     CPUE = c(14.05, 13.266667, 10.8666667, 8.2, 6.35, 4.4),
                     CumCatch = c(0, 281, 480, 643, 725, 852))

mod <- lm(CPUE ~ CumCatch, data = df)
summary(mod)
# slope  = -0.012

# PLOT #----
library(ggplot2)

ggplot(df, aes(x = CumCatch, y = CPUE)) +
  geom_smooth(method = "lm", se = FALSE) +
  geom_point() +
  labs(x = "Cumulative Catch", 
       y = "Catch per Unit Effort") +
  annotate("text", x = 200, y = 6, label = "italic(k) == -0.012", parse = TRUE, size = 8) +
  theme_classic() +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())
  
ggsave("../../RNR321/RNR321/output/CPUE_plot.png")


# Calculate Abundance #----

x_bar <- mean(df$CumCatch)
y_bar <- mean(df$CPUE)
k <- -0.012

N_hat <- x_bar + (y_bar/-k)


# QUIZ QUESTION 

df2 <- tibble::tibble(.rows = 5,
                     Beetles = c(342, 143, 202, 77, 78),
                     Traps = c(100, 50, 100, 50, 75))
df2 <- df2 %>% 
  dplyr::mutate(CPUE = Beetles/Traps)

df2$CumCatch <- 0
for (i in 2:nrow(df2)) {
  df2$CumCatch[i] <- df2$CumCatch[i-1] + df2$Traps[i-1] 
}  

df2_means <- df2 %>% 
  summarise(y_bar = mean(CPUE),
            x_bar = mean(CumCatch))

summary(lm(CPUE ~ CumCatch, data = df2))
# k = -0.008

# Calculate Abundance #----

x_bar <- mean(df2$CumCatch)
y_bar <- mean(df2$CPUE)
k <- -0.008

N_hat <- x_bar + (y_bar/-k)
