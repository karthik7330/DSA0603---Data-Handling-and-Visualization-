library(ggplot2)
library(dplyr)

data(ToothGrowth)

summary_data <- ToothGrowth %>%
  group_by(supp, dose) %>%
  summarise(
    Mean = mean(len),
    SD = sd(len),
    N = n(),
    SE = SD / sqrt(N),
    Lower = Mean - qt(0.975, df = N - 1) * SE,
    Upper = Mean + qt(0.975, df = N - 1) * SE,
    .groups = "drop"
  )

print(summary_data)

ggplot(
  summary_data,
  aes(x = factor(dose), y = Mean, colour = supp, group = supp)
) +
  geom_point(size = 3) +
  geom_errorbar(
    aes(ymin = Lower, ymax = Upper),
    width = 0.15,
    linewidth = 0.8
  ) +
  geom_line() +
  labs(
    title = "Mean Tooth Length with 95% Confidence Intervals",
    x = "Dose",
    y = "Mean Tooth Length",
    colour = "Supplement"
  ) +
  theme_minimal()