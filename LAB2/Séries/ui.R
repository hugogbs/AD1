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
  dashboardHeader(title = "Séries"),
  dashboardSidebar(
    selectInput("select", label = h5("Escolha a sua série:"), 
                choices = unique(series$series_name)),
    sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                      label = "Search...")
  ),
  dashboardBody(
    fluidRow(
      box(plotOutput("lineplot", width = "100%"), title = "Desempenho da série", status = "primary", solidHeader = TRUE,
          width = 6, collapsible = TRUE),
      box(plotOutput("boxplot", width = "100%"), title = "Sumário da(s) temporada(s)", status = "primary", solidHeader = TRUE,
          width = 6, collapsible = TRUE),
      box(plotOutput("smoothplot", width = "100%"), title = "Comportamento da série", status = "primary", solidHeader = TRUE,
          width = 6, collapsible = TRUE)
  ))
)
# 
# # Define UI for application that draws a histogram
# shinyUI(fluidPage(
#   
#   # Application title
#   titlePanel("Séries"),
#   
#   # Sidebar with a slider input for number of bins 
#   sidebarLayout(
#     position = "right",
#     
#     
#     sidebarPanel(
#       selectInput("select", label = h4("Escolha a sua série"), 
#                    choices = unique(series$series_name))
#     ),
#     
#     # Show a plot of the generated distribution
#     mainPanel(
#        plotOutput("distPlot")
#     )
#   )
# ))
