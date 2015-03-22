library(shiny)
cdo<-read.csv("CDO_Emissions.csv")


# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$cdoPlot <- renderPlot({
    
    
    # Render a barplot
    barplot(cdo[,input$region], 
            main="Carbon dioxide emissions per capita (tonnes)", col.main="deepskyblue4",
            ylab="tones",
            xlab="Year", ylim=c(0,12), 
            names.arg=rownames(cdo), 
            col="skyblue", border="deepskyblue4", col.axis="deepskyblue4", col.lab="deepskyblue4",fg="deepskyblue4")
    mtext(input$region, side=3,outer=TRUE,padj=3, cex=.80, font=2, col="deepskyblue4")
  })
  
  output$mean <- renderPrint({mean(cdo[,input$region])})
  output$range <- renderPrint({cdo[,input$region][10]-cdo[,input$region][1]})

    
})





