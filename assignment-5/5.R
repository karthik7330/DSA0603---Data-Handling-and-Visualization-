library(shiny)
library(ggplot2)

data(mtcars)

ui <- fluidPage(
  
  titlePanel("Interactive mtcars Data Dashboard"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "variable",
        "Select a Variable:",
        choices = names(mtcars),
        selected = "mpg"
      ),
      
      sliderInput(
        "bins",
        "Number of Histogram Bins:",
        min = 5,
        max = 50,
        value = 20
      ),
      
      checkboxInput(
        "density",
        "Show Density Curve",
        value = TRUE
      )
    ),
    
    mainPanel(
      
      h3("Histogram"),
      
      plotOutput("histogram"),
      
      h3("Statistical Summary"),
      
      verbatimTextOutput("summary")
    )
  )
)

server <- function(input, output) {
  
  output$histogram <- renderPlot({
    
    selected_data <- mtcars[[input$variable]]
    
    p <- ggplot(
      data.frame(Value = selected_data),
      aes(x = Value)
    ) +
      
      geom_histogram(
        aes(y = after_stat(density)),
        bins = input$bins,
        fill = "skyblue",
        colour = "black"
      ) +
      
      labs(
        title = paste("Histogram of", input$variable),
        x = input$variable,
        y = "Density"
      ) +
      
      theme_minimal()
    
    if (input$density) {
      
      p <- p +
        geom_density(
          colour = "red",
          linewidth = 1
        )
    }
    
    p
  })
  
  output$summary <- renderPrint({
    
    summary(mtcars[[input$variable]])
    
  })
  
}

shinyApp(ui = ui, server = server)