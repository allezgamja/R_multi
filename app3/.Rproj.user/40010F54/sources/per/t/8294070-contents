library(shiny)
shinyUI(fluidPage(
  titlePanel("Sliders"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("aaa", "선택하세요",
                  min=0, max=1000, value=500)
    ),
    mainPanel(
      h1("테스트"),
      tableOutput("values")   #테이블 구조로 내보내기
      # textOutput("values")  #단순히 텍스트
    )
  )
))

