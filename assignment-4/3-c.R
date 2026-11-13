library(ggplot2)
library(patchwork)

data(faithful)

p1 <- ggplot(
  faithful,
  aes(x = eruptions, y = waiting)
) +
  geom_bin2d(bins = 25) +
  scale_fill_viridis_c() +
  labs(
    title = "2D Histogram of Faithful Dataset",
    x = "Eruption Duration",
    y = "Waiting Time",
    fill = "Count"
  ) +
  theme_minimal()

p2 <- ggplot(
  faithful,
  aes(x = eruptions, y = waiting)
) +
  geom_point(alpha = 0.3) +
  geom_density_2d(
    colour = "red",
    linewidth = 0.8
  ) +
  labs(
    title = "Scatterplot with Contour Lines",
    x = "Eruption Duration",
    y = "Waiting Time"
  ) +
  theme_minimal()

p1 + p2