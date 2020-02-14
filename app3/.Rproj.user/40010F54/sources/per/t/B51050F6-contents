
library(shiny)
shinyServer(function(input, output){
  sliderValues <- reactive({      #reactive:상호작용. 바 움직일 때마다 수행된다.
    data.frame(
      Parameter="BBB",
      Value = as.character(input$aaa)
    ) 
    
  })
  output$values <- renderTable({
    sliderValues()
  })
  # output$values <- renderPrint({
  #  sliderValues()
  # })
})


