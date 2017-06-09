#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Séries"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    position = "right",
    
    sidebarPanel(
      selectInput("select", label = h4("Escolha a sua série"), 
                   choices = unique(series$series_name))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      actionButton("action", label = "Meu botão"),
       plotOutput("distPlot")
    )
  )
))
