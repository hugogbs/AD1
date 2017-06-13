#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tidyr)
library(readr)
library(plotly)

theme_set(theme_minimal())
series <- read_csv("series_from_imdb.csv")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$lineplot <- renderPlotly({
    plot_ly(data = series %>% filter(series_name %in% c(input$select)),
            x = ~as.factor(series_ep)) %>%
      add_trace(y = ~UserRating, color = ~series_name, name = "Nota", type = 'scatter', mode = 'lines') %>%
      layout(yaxis = list(title = 'Nota', hoverformat= '.2f'), 
             xaxis = list(title = 'Episódios'))
  })
  
  output$boxplot <- renderPlotly({
    plot_ly(data = series %>% filter(series_name %in% c(input$select)), x = ~series_name,
            y = ~UserRating, type = "box") %>%
      
      layout(
        xaxis = list(title = ""),
        yaxis = list(title = "Nota")
      )
    })
  
  output$boxplotSeason <- renderPlotly({
    plot_ly(data = series %>% filter(series_name %in% c(input$select)), x = ~season,
            y = ~UserRating, color = ~as.factor(season), type = "box") %>%
      layout(
        xaxis = list(title = "Temporada"),
        yaxis = list(title = "Nota")
      )
  })
  
})
