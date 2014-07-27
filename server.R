require(shiny)
require(ggplot2)
options(warn=-1)

results_data <- data.frame(
  c("Send No Send", "Score > 0.5", "Active Users")
  ,c(1250,3000,5000)
  ,c(2.35,3.45,3.48)
  ,c(750,1600,2500)
  ,c(2.25,3.41,3.50)
)
colnames(results_data) <- c("ExperimentName", "TestCt", "AvgTestRev", "CtrlCt", "AvgCtrlRev")
results_data$AvgRevLift <- results_data$AvgTestRev - results_data$AvgCtrlRev
results_data$TotRevLift <- results_data$AvgRevLift * results_data$TestCt

do_ggplot<-function(strVarName)
{
  if(strVarName == "AvgRevLift") { ggplot(results_data, aes(x=ExperimentName, y=AvgRevLift)) + geom_bar(stat="identity") }
  else if(strVarName == "TotRevLift") { ggplot(results_data, aes(x=ExperimentName, y=TotRevLift)) + geom_bar(stat="identity") }
}

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({ do_ggplot(input$metric) })
})
