
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


shinyUI(pageWithSidebar(
  
  headerPanel("Ozone and Weather in New York City"),
  
  sidebarPanel(     
    selectInput('reg', 'Select the Type of Plot', c("Base Plot with Annotation", "Base Plot with Regression Line", "Multiple Base Plots 1", "Multiple Base Plots 2"))
),
  
  mainPanel( 
    plotOutput('plot')
  )
    )
)


