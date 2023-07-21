library(shiny)

# Define server logic
server <- function(input, output, session) {
  # Read the uploaded dataset
  dataset <- reactive({
    req(input$fileInput)
    read.csv(input$fileInput$datapath, header = TRUE)
  })
  
  # Update variable choices based on the dataset
  observeEvent(dataset(), {
    updateSelectInput(session, "xVariable", choices = colnames(dataset()))
    updateSelectInput(session, "yVariable", choices = colnames(dataset()))
  })
  
  # Generate and render the plot
  output$dataPlot <- renderPlot({
    req(input$xVariable, input$yVariable)
    
    if (input$plotType == "Scatter Plot") {
      plot(dataset()[[input$xVariable]], dataset()[[input$yVariable]],
           xlab = input$xVariable, ylab = input$yVariable, pch = 19)
    } else if (input$plotType == "Bar Plot") {
      barplot(dataset()[[input$yVariable]], names.arg = dataset()[[input$xVariable]],
              xlab = input$xVariable, ylab = input$yVariable)
    } else if (input$plotType == "Line Plot") {
      plot(dataset()[[input$xVariable]], dataset()[[input$yVariable]],
           type = "l", xlab = input$xVariable, ylab = input$yVariable)
    }
  })
}
