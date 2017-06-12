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
  output$lineplot <- renderPlot({
    ggplot(
      data = series %>% filter(series_name %in% c(input$select)),
      aes(x = series_ep, y = UserRating, color = as.factor(season))) +
    geom_line()
  })
  
  output$boxplot <- renderPlot({
    ggplot(
      data = series %>% filter(series_name %in% c(input$select)),
      aes(x = as.factor(season), y = UserRating, color = as.factor(season))) +
    geom_boxplot()
    })
  
  output$smoothplot <- renderPlot({
    ggplot(
    data = series %>% filter(series_name %in% c(input$select)),
    aes(x = series_ep, y = UserRating, color = as.factor(season))) +
    geom_smooth()
  })
  output$menu <- renderMenu({
    sidebarMenu(
      menuItem("Menu item", icon = icon("calendar"))
    )
  })
  
})

