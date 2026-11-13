library(ggplot2)
library(plotly)

data(economics)

p <- plot_ly(
  data = economics,
  x = ~date,
  y = ~unemploy,
  type = "scatter",
  mode = "lines",
  line = list(color = "blue")
) %>%
  layout(
    title = "US Unemployment Over Time",
    xaxis = list(
      title = "Year",
      rangeslider = list(visible = TRUE)
    ),
    yaxis = list(
      title = "Number of Unemployed People"
    )
  )

p