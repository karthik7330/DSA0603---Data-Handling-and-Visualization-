library(ggplot2)
library(viridis)
library(patchwork)

data(faithfuld)

p1 <- ggplot(
  faithfuld,
  aes(x = eruptions, y = waiting, fill = density)
) +
  geom_raster() +
  scale_fill_gradientn(
    colours = rainbow(10)
  ) +
  labs(
    title = "Rainbow Palette",
    x = "Eruptions",
    y = "Waiting",
    fill = "Density"
  ) +
  theme_minimal()

p2 <- ggplot(
  faithfuld,
  aes(x = eruptions, y = waiting, fill = density)
) +
  geom_raster() +
  scale_fill_viridis_c() +
  labs(
    title = "Viridis Palette",
    x = "Eruptions",
    y = "Waiting",
    fill = "Density"
  ) +
  theme_minimal()

p1 + p2