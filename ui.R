library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Experiment Results"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    selectInput("metric", "Choose a Metric:", 
                choices = c("AvgRevLift","TotRevLift"))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))