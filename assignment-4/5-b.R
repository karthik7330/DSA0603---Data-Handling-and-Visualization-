library(ggplot2)

data(iris)

species_colours <- c(
  "Setosa" = "#0072B2",
  "Versicolor" = "#E69F00",
  "Virginica" = "#009E73"
)

species_shapes <- c(
  "Setosa" = 16,
  "Versicolor" = 17,
  "Virginica" = 15
)

ggplot(
  iris,
  aes(
    x = Petal.Length,
    y = Petal.Width,
    colour = Species,
    shape = Species
  )
) +
  geom_point(size = 3, alpha = 0.8) +
  scale_colour_manual(values = species_colours) +
  scale_shape_manual(values = species_shapes) +
  annotate(
    "text",
    x = 1.5,
    y = 0.25,
    label = "Setosa",
    colour = "#0072B2",
    fontface = "bold",
    size = 4
  ) +
  annotate(
    "text",
    x = 4.3,
    y = 1.3,
    label = "Versicolor",
    colour = "#E69F00",
    fontface = "bold",
    size = 4
  ) +
  annotate(
    "text",
    x = 5.5,
    y = 2.1,
    label = "Virginica",
    colour = "#009E73",
    fontface = "bold",
    size = 4
  ) +
  labs(
    title = "Accessible Iris Scatterplot",
    x = "Petal Length",
    y = "Petal Width"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(
      face = "bold",
      size = 17
    ),
    axis.title = element_text(
      face = "bold",
      size = 14
    ),
    legend.position = "none"
  )