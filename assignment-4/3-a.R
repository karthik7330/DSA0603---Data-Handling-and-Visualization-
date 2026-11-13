library(ggplot2)
library(patchwork)

data(diamonds)

p1 <- ggplot(
  diamonds,
  aes(x = carat, y = price)
) +
  geom_point() +
  labs(
    title = "Default Scatterplot",
    x = "Carat",
    y = "Price"
  ) +
  theme_minimal()

p2 <- ggplot(
  diamonds,
  aes(x = carat, y = price)
) +
  geom_point(
    size = 0.5,
    alpha = 0.1,
    colour = "blue"
  ) +
  labs(
    title = "Small Transparent Points",
    x = "Carat",
    y = "Price"
  ) +
  theme_minimal()

p1 + p2