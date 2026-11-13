library(plotly)

data(ToothGrowth)

set.seed(123)

supplements <- unique(ToothGrowth$supp)

hop_data <- data.frame(
  Iteration = integer(),
  Supplement = character(),
  BootstrapMean = numeric()
)

for (i in 1:30) {
  
  for (s in supplements) {
    
    values <- ToothGrowth$len[
      ToothGrowth$supp == s
    ]
    
    bootstrap_sample <- sample(
      values,
      size = length(values),
      replace = TRUE
    )
    
    bootstrap_mean <- mean(bootstrap_sample)
    
    hop_data <- rbind(
      hop_data,
      data.frame(
        Iteration = i,
        Supplement = s,
        BootstrapMean = bootstrap_mean
      )
    )
  }
}

p <- plot_ly(
  data = hop_data,
  x = ~Supplement,
  y = ~BootstrapMean,
  frame = ~Iteration,
  color = ~Supplement,
  type = "scatter",
  mode = "markers",
  marker = list(size = 12),
  text = ~paste(
    "Iteration:", Iteration,
    "<br>Supplement:", Supplement,
    "<br>Bootstrap Mean:", round(BootstrapMean, 2)
  ),
  hoverinfo = "text"
) %>%
  layout(
    title = "HOP: Bootstrap Mean Tooth Length by Supplement",
    xaxis = list(title = "Supplement"),
    yaxis = list(title = "Bootstrap Mean Tooth Length")
  ) %>%
  animation_opts(
    frame = 500,
    transition = 200,
    redraw = TRUE
  ) %>%
  animation_slider(
    currentvalue = list(prefix = "Bootstrap Iteration: ")
  )

p