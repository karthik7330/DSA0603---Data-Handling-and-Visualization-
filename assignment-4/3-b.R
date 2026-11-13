library(ggplot2)
library(patchwork)

data(mpg)

p1 <- ggplot(
  mpg,
  aes(x = factor(cyl), y = hwy)
) +
  geom_point() +
  labs(
    title = "Plain Scatterplot",
    x = "Number of Cylinders",
    y = "Highway Mileage"
  ) +
  theme_minimal()

p2 <- ggplot(
  mpg,
  aes(x = factor(cyl), y = hwy)
) +
  geom_jitter(
    width = 0.2,
    height = 0.2,
    colour = "blue",
    alpha = 0.7
  ) +
  labs(
    title = "Jittered Scatterplot",
    x = "Number of Cylinders",
    y = "Highway Mileage"
  ) +
  theme_minimal()

p1 + p2