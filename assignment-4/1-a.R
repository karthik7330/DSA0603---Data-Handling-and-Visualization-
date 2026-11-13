library(ggplot2)
library(patchwork)

sales <- data.frame(
  Year = c("2023", "2024"),
  Sales = c(95, 100)
)

p1 <- ggplot(sales, aes(x = Year, y = Sales)) +
  geom_col(fill = "steelblue") +
  coord_cartesian(ylim = c(90, 101)) +
  labs(
    title = "Bar Chart with Truncated Y-Axis",
    x = "Year",
    y = "Sales"
  ) +
  theme_minimal()

p2 <- ggplot(sales, aes(x = Year, y = Sales)) +
  geom_col(fill = "orange") +
  scale_y_continuous(limits = c(0, 110)) +
  labs(
    title = "Bar Chart with Zero-Based Y-Axis",
    x = "Year",
    y = "Sales"
  ) +
  theme_minimal()

p1 + p2