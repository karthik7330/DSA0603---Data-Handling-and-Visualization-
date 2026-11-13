library(ggplot2)
library(dplyr)

data(state)

state_data <- as.data.frame(state.x77)

state_data$State <- rownames(state_data)

top_states <- state_data %>%
  arrange(desc(Population)) %>%
  slice_head(n = 10)

p1 <- ggplot(
  top_states,
  aes(x = reorder(State, Population), y = Population)
) +
  geom_col(fill = "steelblue") +
  scale_y_log10() +
  coord_flip() +
  labs(
    title = "Population Using Bars - Log Scale",
    x = "State",
    y = "Population (Log Scale)"
  ) +
  theme_minimal()

p2 <- ggplot(
  top_states,
  aes(x = Population, y = reorder(State, Population))
) +
  geom_point(size = 3, colour = "red") +
  scale_x_log10() +
  labs(
    title = "Population Using Dots - Log Scale",
    x = "Population (Log Scale)",
    y = "State"
  ) +
  theme_minimal()

p1 + p2