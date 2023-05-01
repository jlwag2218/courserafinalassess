library(shiny)
library(tidyverse)

adult <- read_csv("adult.csv")
# Convert column names to lowercase for convenience 
names(adult) <- tolower(names(adult))

shinyServer(function(input, output) {
  
  df_country <- reactive({
    adult %>% filter(native_country == input$country)
  })
  
  output$p1 <- renderPlot({
    if (input$graph_type == "Histogram") {
      # Histogram
      ggplot(df_country(), aes_string(x = input$continuous_variable)) +
        geom_histogram() +
        labs(y = "Number of people", title = paste("Trend of", input$continuous_variable)) +
        facet_wrap(~adult$PREDICTION)
    }
    else {
      # Boxplot
      ggplot(df_country(), aes_string(y = input$continuous_variable)) +
        geom_boxplot() +
        coord_flip() +
        labs(y = "Number of people", title = paste("Trend of", input$continuous_variable)) +
        facet_wrap(~adult$PREDICTION)
    }
})
})
