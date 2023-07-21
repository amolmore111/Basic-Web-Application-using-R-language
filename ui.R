library(shiny)

# Define UI for application
ui <- fluidPage(
  titlePanel("Data Visualization App"),
  sidebarLayout(
    sidebarPanel(
      fileInput("fileInput", "Upload Dataset"),
      selectInput("xVariable", "Select X Variable", choices = NULL),
      selectInput("yVariable", "Select Y Variable", choices = NULL),
      selectInput("plotType", "Select Plot Type",
                  choices = c("Scatter Plot", "Bar Plot", "Line Plot"))
    ),
    mainPanel(
      plotOutput("dataPlot")
    )
  )
)
