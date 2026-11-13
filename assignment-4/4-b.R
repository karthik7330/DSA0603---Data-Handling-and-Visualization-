library(ggplot2)

data(mtcars)

set.seed(123)

mpg_values <- mtcars$mpg

bootstrap_means <- numeric(2000)

for (i in 1:2000) {
  sample_values <- sample(
    mpg_values,
    size = length(mpg_values),
    replace = TRUE
  )
  
  bootstrap_means[i] <- mean(sample_values)
}

confidence_interval <- quantile(
  bootstrap_means,
  probs = c(0.025, 0.975)
)

cat("Bootstrap Mean:", mean(bootstrap_means), "\n")

cat("95% Confidence Interval:\n")

print(confidence_interval)

bootstrap_data <- data.frame(
  Mean = bootstrap_means
)

ggplot(bootstrap_data, aes(x = Mean)) +
  geom_histogram(
    bins = 35,
    fill = "skyblue",
    colour = "black"
  ) +
  geom_vline(
    xintercept = confidence_interval,
    colour = "red",
    linetype = "dashed",
    linewidth = 1
  ) +
  geom_vline(
    xintercept = mean(mpg_values),
    colour = "blue",
    linewidth = 1
  ) +
  labs(
    title = "Bootstrap Distribution of MPG Mean",
    x = "Bootstrap Mean MPG",
    y = "Frequency"
  ) +
  theme_minimal()