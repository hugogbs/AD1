#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  
  dashboardSidebar(
    selectInput("select", label = h5("Escolha a sua série:"), 
                choices = unique(series$series_name), multiple = T)
  ),
  
  dashboardBody(
    
    fluidRow(
      box(width = 12,
          title = "Como está a minha série?", status = "primary", solidHeader = TRUE,
          collapsible = TRUE,
          "Você sabe como anda o desempenho da sua série predileta?", br(), 
          "Pra você, qual é a melhor temporada da sua série do coração? Será que o restante dos expectadores concorda com você?", br(),
          "Aqui você pode obter as respostas para essas e muitas outras perguntas. Divirta-se!!!"
      ),
      
      box(plotlyOutput("lineplot", width = "100%"), title = "Desempenho da série", status = "primary", solidHeader = TRUE,
          width = 12, collapsible = TRUE),
      box(plotlyOutput("boxplot", width = "100%"), title = "Sumário geral da série", status = "primary", solidHeader = TRUE,
          width = 4, collapsible = TRUE),
      box(plotlyOutput("boxplotSeason", width = "100%"), title = "Comportamento da série por temporada", status = "primary", solidHeader = TRUE,
          width = 8, collapsible = TRUE)
  ))
)
