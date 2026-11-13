library(tidyr)
library(dplyr)
library(ggplot2)

data(iris)

iris_long <- iris %>%
  pivot_longer(
    cols = Sepal.Length:Petal.Width,
    names_to = "Measurement",
    values_to = "Value"
  )

print(head(iris_long))

ggplot(
  iris_long,
  aes(x = Species, y = Value, fill = Species)
) +
  geom_boxplot() +
  facet_wrap(~Measurement, scales = "free_y") +
  labs(
    title = "Iris Measurements by Species",
    x = "Species",
    y = "Measurement Value"
  ) +
  theme_minimal() +
  theme(legend.position = "none")