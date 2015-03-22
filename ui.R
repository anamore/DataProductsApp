library(shiny)
cdo<-read.csv("CDO_Emissions.csv")


# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Carbon dioxide emissions per capita"),
    hr(),
    hr(),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      sidebarPanel(
        h4('What this app is about:'),
        helpText("The environmental effects of carbon dioxide are of significant interest. Carbon dioxide (CO2) makes 
                 up the largest share of the greenhouse gases contributing to global warming and climate change."),
        helpText("The addition of man-made greenhouse gases to the Atmosphere disturbs the earth's radiative balance. 
                 This is leading to an increase in the earth's surface temperature and to related effects on climate, 
                 sea level rise and world agriculture. Emissions of CO2  are from burning oil, coal and gas for 
                 energy use, burning wood and waste materials, and from industrial processes such as cement production."),
        helpText("This app display CO2 emissions in four groups of countries: countries with very high, high, medium and low
                 human development (as measured by United Nations)"),
        hr(),
        h4('How to use this app:'),
        helpText("Select a region in the select box. The barplot will display emissions per year. 
                 Below, average emissions and variation since 1980 to 2010 will be calculated") 
      ),
      
      mainPanel(
        selectInput("region", "Countries with...", 
                    choices=colnames(cdo)),
        hr(),
        plotOutput("cdoPlot"),
        hr(),
        h4('Average emissions (in tons) since 1980 to 2010'),
        verbatimTextOutput("mean"),
        h4('Variation of emissions (in tons) since 1980 to 2010'),
        verbatimTextOutput("range"), 
        helpText("Data from World Bank (2013). World Development Indicators 2013")
      ),
      
      
    )
  )
)