library(ggplot2)
library(dplyr)
library(patchwork)

data(mpg)

# Add manufacturer information
mpg_data <- mpg %>%
  mutate(
    manufacturer = factor(manufacturer),
    drv = factor(drv),
    cyl = factor(cyl)
  )

# Multiple visual encodings
p1 <- ggplot(
  mpg_data,
  aes(
    x = displ,
    y = hwy,
    colour = manufacturer,
    shape = drv,
    size = cyl
  )
) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Multiple Visual Encodings",
    x = "Engine Displacement",
    y = "Highway Mileage",
    colour = "Manufacturer",
    shape = "Drive Type",
    size = "Cylinders"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Faceted redesign
p2 <- ggplot(
  mpg_data,
  aes(x = displ, y = hwy, colour = drv)
) +
  geom_point(size = 2, alpha = 0.7) +
  facet_wrap(~cyl) +
  labs(
    title = "Faceted Visualization by Cylinders",
    x = "Engine Displacement",
    y = "Highway Mileage",
    colour = "Drive Type"
  ) +
  theme_minimal()

p1

p2