
<h1>Ozone and Weather in New York City.</h1>

This documentation is for a novice user who would wish to use the application.

This is a Siny App for plotting the Ozone and Weather in New York City. A Shiny app consists of two parts: a ui.R file 
describing the user interface and the server.R file wich contains the code that runs on the Shiny server, which returns the result or output to the user's browser window. Both the files are reproduced below:

<h3>ui.R</h3>

```{r echo=FALSE, result=hide}
library(shiny)
shinyUI(pageWithSidebar(
headerPanel("Ozone and Weather in New York City"),
sidebarPanel(
selectInput('reg', 'Select the Type of Plot', c("Base Plot with Annotation", "Base Plot with Regression Line", "Multiple 

Base Plots 1", "Multiple Base Plots 2"))
),
mainPanel(
plotOutput('plot')
)
)
)
```

<h3>server.R</h3>

```{r}

library(shiny)
library(ggplot2)
library(sp)
library(datasets)
library(lattice)
# options(shiny.cache=TRUE)
shinyServer(function(input, output) {
airquality <- transform(airquality, Month = factor(Month))
output$plot <- reactivePlot(function() {
selected_plot_type <- input$reg
#Build up the plot
if (selected_plot_type == "Base Plot with Annotation" ){
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month == 6), points(Wind, Ozone, col = "green"))
with(subset(airquality, Month == 7), points(Wind, Ozone, col = "orange"))
with(subset(airquality, Month == 8), points(Wind, Ozone, col = "red"))
with(subset(airquality, Month == 9), points(Wind, Ozone, col = "violet"))
legend("topright", pch = 1, col = c("blue", "green","orange", "red","violet"), legend = c("May", "June", "July", "August", 

"Sept"))
}
else if (selected_plot_type == "Base Plot with Regression Line" ){
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)
}
else if (selected_plot_type =="Multiple Base Plots 1" ){
par(mfrow = c(1, 2))
with(airquality, {
plot(Wind, Ozone, main = "Ozone and Wind")
plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})
}
else if (selected_plot_type == "Multiple Base Plots 2" ){
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
plot(Wind, Ozone, main = "Ozone and Wind")
plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
plot(Temp, Ozone, main = "Ozone and Temperature")
mtext("Ozone and Weather in New York City", outer = TRUE)
})
}
}, height=500)
})
```

<h3>The Application includes the Following Features</h3>

    Selection of input through a Combo Box to select the types of plots.    Some operation on the ui input in sever.R
    Reactive output displayed as a result of server calculations based on the above selection.
  
   
Hope you will find this app substantively different than the very simple applications built in the class. However, I have also uploaded another application to plot the map of India (you can change the code to plot the map of any country you select as input).
