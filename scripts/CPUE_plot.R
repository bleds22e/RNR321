# CPUE Data Frame #----

df <- tibble::tibble(.rows = 6,
                     CPUE = c(14.05, 13.266667, 10.8666667, 8.2, 6.35, 4.4),
                     CumCatch = c(0, 199, 362, 444, 571, 593))

mod <- lm(CPUE ~ CumCatch, data = df)
summary(mod)
# slope  = -0.016

# PLOT #----
library(ggplot2)

ggplot(df, aes(x = CumCatch, y = CPUE)) +
  geom_smooth(method = "lm", se = FALSE) +
  geom_point() +
  labs(x = "Cumulative Catch", 
       y = "Catch per Unit Effort") +
  annotate("text", x = 200, y = 6, label = "italic(k) == -0.016", parse = TRUE, size = 8) +
  theme_classic() +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())
  
ggsave("../../RNR321/RNR321/output/CPUE_plot.png")


# Calculate Abundance #----

x_bar <- mean(df$CumCatch)
y_bar <- mean(df$CPUE)
k <- -0.016

N_hat <- x_bar + (y_bar/-k)
