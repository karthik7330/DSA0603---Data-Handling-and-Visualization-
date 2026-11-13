library(ggplot2)
library(dplyr)
library(maps)

data(USArrests)

arrests <- USArrests

arrests$State <- tolower(rownames(arrests))

map_data <- map_data("state")

map_data <- merge(
  map_data,
  arrests,
  by.x = "region",
  by.y = "State"
)

p1 <- ggplot(
  map_data,
  aes(x = long, y = lat, group = group, fill = Murder)
) +
  geom_polygon(colour = "white", linewidth = 0.2) +
  coord_map() +
  scale_fill_viridis_c() +
  labs(
    title = "US Murder Rate - Viridis Palette",
    fill = "Murder Rate"
  ) +
  theme_void()

p2 <- ggplot(
  map_data,
  aes(x = long, y = lat, group = group, fill = Murder)
) +
  geom_polygon(colour = "white", linewidth = 0.2) +
  coord_map() +
  scale_fill_gradientn(colours = rainbow(10)) +
  labs(
    title = "US Murder Rate - Rainbow Palette",
    fill = "Murder Rate"
  ) +
  theme_void()

p1 + p2