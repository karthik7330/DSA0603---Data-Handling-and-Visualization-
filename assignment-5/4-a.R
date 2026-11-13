library(plotly)
library(gapminder)
library(dplyr)

data(gapminder)

p <- plot_ly(
  data = gapminder,
  x = ~gdpPercap,
  y = ~lifeExp,
  size = ~pop,
  color = ~continent,
  frame = ~year,
  text = ~paste(
    "Country:", country,
    "<br>Continent:", continent,
    "<br>Year:", year,
    "<br>GDP per Capita:", round(gdpPercap, 2),
    "<br>Life Expectancy:", round(lifeExp, 2),
    "<br>Population:", pop
  ),
  hoverinfo = "text",
  type = "scatter",
  mode = "markers"
) %>%
  layout(
    title = "Animated Gapminder Bubble Chart",
    xaxis = list(
      title = "GDP per Capita",
      type = "log"
    ),
    yaxis = list(
      title = "Life Expectancy"
    )
  ) %>%
  animation_opts(
    frame = 500,
    transition = 300,
    redraw = FALSE
  ) %>%
  animation_slider(
    currentvalue = list(prefix = "Year: ")
  )

p