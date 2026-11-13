library(ggplot2)
library(dichromat)
library(patchwork)

values <- data.frame(
  Category = c("Group A", "Group B", "Group C", "Group D"),
  Value = c(25, 40, 30, 50)
)

red_green <- c("red", "green", "darkred", "darkgreen")

okabe_ito <- c(
  "#E69F00",
  "#56B4E9",
  "#009E73",
  "#CC79A7"
)

p1 <- ggplot(
  values,
  aes(x = Category, y = Value, fill = Category)
) +
  geom_col() +
  scale_fill_manual(values = red_green) +
  labs(title = "Red-Green Palette") +
  theme_minimal() +
  theme(legend.position = "none")

p2 <- ggplot(
  values,
  aes(x = Category, y = Value, fill = Category)
) +
  geom_col() +
  scale_fill_manual(values = okabe_ito) +
  labs(title = "Okabe-Ito Palette") +
  theme_minimal() +
  theme(legend.position = "none")

p1 + p2

# Simulate deuteranopia
red_green_sim <- dichromat(red_green, type = "deutan")

okabe_ito_sim <- dichromat(okabe_ito, type = "deutan")

cat("Red-Green palette after deuteranopia simulation:\n")
print(red_green_sim)

cat("Okabe-Ito palette after deuteranopia simulation:\n")
print(okabe_ito_sim)

# Display simulated palettes
palette_data <- data.frame(
  Category = rep(c("Red-Green", "Okabe-Ito"), each = 4),
  Colour = c(red_green_sim, okabe_ito_sim),
  Group = rep(c("A", "B", "C", "D"), 2)
)

ggplot(
  palette_data,
  aes(x = Group, y = Category, fill = Colour)
) +
  geom_tile(colour = "black") +
  scale_fill_identity() +
  labs(title = "Deuteranopia Palette Simulation") +
  theme_minimal()