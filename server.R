library(shiny)
library(datasets)
library(dplyr)
# Filter the dataset 
diamonds <- diamonds[1:7]

shinyServer(function(input, output) {
  
  # Show the diamonds that correspond to the filters
  output$table <- renderDataTable({
    carat_seq <- seq(from = input$carat[1], to = input$carat[2], by = 0.1)
    price_seq <- seq(from = input$price[1], to = input$price[2], by = 1)
    data <- filter(diamonds, carat %in% carat_seq, price %in% price_seq, cut %in% input$cut, color %in% input$color, clarity %in% input$clarity)
    data <- arrange(data, price)

  }, options = list(lengthMenu = c(5, 10, 20), pageLength = 5))
})