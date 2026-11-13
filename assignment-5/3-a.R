library(plotly)
library(ggplot2)

data(diamonds)

p <- plot_ly(
  data = diamonds,
  x = ~cut,
  y = ~price,
  color = ~cut,
  type = "box",
  boxpoints = "outliers"
) %>%
  layout(
    title = "Interactive Boxplot of Diamond Price by Cut",
    xaxis = list(title = "Diamond Cut"),
    yaxis = list(
      title = "Diamond Price (Log Scale)",
      type = "log"
    )
  )

p