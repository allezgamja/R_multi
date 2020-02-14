library(shiny)

shinyUI(fluidPage(
  titlePanel("제목 패널"),
  sidebarPanel("측면 패널"),     #입력
  mainPanel(                     #출력
    h3("iris 요약통계량 결과"),
    verbatimTextOutput("summary")
    #verbatim: 원본이랑 아주 똑~~같이 
    #textOutput("summary"): 그냥 텍스트 아웃풋
  )
))

# server의 output$summary와 이름이 일치해야 한다.