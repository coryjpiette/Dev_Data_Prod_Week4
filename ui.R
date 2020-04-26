# Gentlemen: The following interactive table will allow you to determine a diamond's price based on carat size, cut, color, and clarity.

library(shiny)
library(ggplot2)

# load data
data("diamonds")

# Define the application's UI
shinyUI(fluidPage(titlePanel("Diamond Price Based on Carat Size, Cut, Color, and Clarity"),
        
# Variable input sidebar
sidebarLayout(sidebarPanel(h4("Choose Diamond Factors"),
        selectInput("cut", "Cut", (sort(unique(diamonds$cut), decreasing = T))),
        selectInput("color", "Color", (sort(unique(diamonds$color)))),
        selectInput("clarity", "Clarity", (sort(unique(diamonds$clarity), decreasing = T))),
        sliderInput("lm", "Carat",
                min = min(diamonds$carat), max = max(diamonds$carat),
                value = max(diamonds$carat) / 2, step = 0.1),
                h4("Predicted Price"), verbatimTextOutput("predict"), width = 4),
                
# Relationship between carat size and price
mainPanel("Price/Carat Relationship", plotOutput("distPlot"))
        )))