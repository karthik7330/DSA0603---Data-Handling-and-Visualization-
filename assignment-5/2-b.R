library(ggplot2)
library(plotly)

data(mpg)

p <- ggplot(
  mpg,
  aes(
    x = displ,
    y = hwy,
    text = paste(
      "Manufacturer:", manufacturer,
      "<br>Model:", model,
      "<br>Engine Displacement:", displ,
      "<br>Highway Mileage:", hwy
    )
  )
) +
  geom_point(
    aes(colour = class),
    size = 3
  ) +
  labs(
    title = "Engine Displacement vs Highway Mileage",
    x = "Engine Displacement",
    y = "Highway Mileage",
    colour = "Vehicle Class"
  ) +
  theme_minimal()

ggplotly(p, tooltip = "text")