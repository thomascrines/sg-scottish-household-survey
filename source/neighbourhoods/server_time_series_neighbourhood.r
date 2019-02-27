# 'Source' definition connects to 'data_proc_time_series_neighbourhood'
source("source/neighbourhoods/data_proc_time_series_neighbourhood.r", local = TRUE)$value

# RENDER MAIN CHART

# Question 1: Neighbourhood Rating 

# Creates an 'output object' to pass to 'tab_time_series_neighbourhood' 
output$lineChartNeighbourhood <- renderPlotly({
  
# Sets up CI's to feed to ggplot 
dodge <- position_dodge(0.1)
LowerConfidenceLimit <- SHS_LC_Neighbourhood()$LowerConfidenceLimit
UpperConfidenceLimit <- SHS_LC_Neighbourhood()$UpperConfidenceLimit
  
# MAIN CHART SERVER LOGIC 1: creates the basic ggplot object to pass to plotly for Local Authorities alone 
  if(input$VariableSelectLCNeighbourhood == "Local Authorities") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
          aes(x=Year, y=Percent, colour=factor(LocalAuthority, 
# TO DO: Find a way to assign unique colours to each level of 'LocalAuthority
levels = c("Scotland", "Aberdeen City", "Aberdeenshire", "Angus", "Argyll and Bute", "City of Edinburgh",
           "Clackmannanshire", "Dumfries and Galloway", "Dundee City", "East Ayrshire",
           "East Dunbartonshire", "East Lothian", "East Renfrewshire", "Falkirk", "Fife", "Glasgow City",
           "Highland", "Inverclyde", "Midlothian", "Moray", "Na h-Eileanan Siar", "North Ayrshire",
           "North Lanarkshire", "Orkney Islands", "Perth and Kinross", "Renfrewshire", "Scottish Borders",
           "Shetland Islands", "South Ayrshire", "South Lanarkshire", "Stirling", "West Dunbartonshire",
           "West Lothian")), 
          linetype=LocalAuthority, 
          text = paste("Value: ", Percent, "%","\n", 
          "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
          "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
           LocalAuthority, ",", Year, "\n", Rating), 
          group=interaction(LocalAuthority, Rating)))
    
# Creates the basic ggplot object to pass to plotly for Local Authorities by other variables 
  } else if(input$VariableSelectLCNeighbourhood == "Gender") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
                aes(x=Year, y=Percent, colour=factor(Gender), linetype=Gender,
                    text = paste("Value: ", Percent, "%","\n", 
                    "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                    "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                    LocalAuthority, ",", Year, "\n", Rating), 
                    group=interaction(Gender, Rating)))
    
  } else if(input$VariableSelectLCNeighbourhood == "Urban Rural Classification") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
                aes(x=Year, y=Percent, colour=factor(UrbanRuralClassification), 
                    linetype=UrbanRuralClassification,
                    text = paste("Value: ", Percent, "%","\n", 
                    "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                    "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                     LocalAuthority, ",", Year, "\n", Rating), 
                     group=interaction(UrbanRuralClassification, Rating)))
    
  } else if(input$VariableSelectLCNeighbourhood == "SIMD Quintiles") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
                aes(x=Year, y=Percent, colour=factor(SIMDQuintiles), linetype=SIMDQuintiles,
                    text = paste("Value: ", Percent, "%","\n", 
                    "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                    "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                    LocalAuthority, ",", Year, "\n", Rating), 
                    group=interaction(SIMDQuintiles, Rating)))
    
  } else if(input$VariableSelectLCNeighbourhood == "Type of Tenure") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
                aes(x=Year, y=Percent, colour=factor(TypeOfTenure), linetype=TypeOfTenure,
                    text = paste("Value: ", Percent, "%","\n", 
                    "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                    "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                     LocalAuthority, ",", Year, "\n", Rating), 
                     group=interaction(TypeOfTenure, Rating)))
    
  } else if(input$VariableSelectLCNeighbourhood == "Household Type") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
                aes(x=Year, y=Percent, colour=factor(HouseholdType), linetype=HouseholdType,
                    text = paste("Value: ", Percent, "%","\n", 
                    "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                    "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                    LocalAuthority, ",", Year, "\n", Rating), 
                    group=interaction(HouseholdType, Rating)))
    
  } else if(input$VariableSelectLCNeighbourhood == "Ethnicity") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
                aes(x=Year, y=Percent, colour=factor(Ethnicity), linetype=Ethnicity,
                    text = paste("Value: ", Percent, "%","\n", 
                     "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                     "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                     LocalAuthority, ",", Year, "\n", Rating), 
                     group=interaction(Ethnicity, Rating)))
    
  } else if(input$VariableSelectLCNeighbourhood == "Walking distance to nearest greenspace") {
    
    p <- ggplot(data = SHS_LC_Neighbourhood(), 
                aes(x=Year, y=Percent, colour=factor(Walkingdistancetonearestgreenspace), 
                    linetype=Walkingdistancetonearestgreenspace,
                    text = paste("Value: ", Percent, "%","\n", 
                    "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                    "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                    LocalAuthority, ",", Year, "\n", Rating), 
                    group=interaction(Walkingdistancetonearestgreenspace, Rating)))
    
  }
    
# Main chart CI controls 
  if(input$ConfidenceIntervalsLCNeighbourhood == TRUE) {
  p <- p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit), width=0.2, 
                         position=dodge)
  } else {
    p
  }

# Main chart zoom controls 
  if(input$zoomLevel_LCNeighbourhood == "Full scale") {
    p <- p + ylim(0, 100)
  }
  else {
    p
  }
  
# MAIN CHART SERVER LOGIC 2

# Adds the 'geom', 'labs' and 'theme'layers to the basic ggplot object 
  p <- p + geom_line(position = dodge)+
    
    geom_point(position = dodge, alpha=0)+
    
    scale_color_manual(values = timeSeriesColours)+
    
    labs(x = "year",
         y = "percentage",
         title = input$NeighbourhoodRatingLC)+
    
    theme(panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
          panel.background = element_rect(fill = "transparent"),
          legend.title = element_blank(),
          text = element_text(family = "Arial"))
  
  # Tidies the ggplot object to avoid duplication of labels
  p <- ggplotly(tooltip = "text")
  
})

# Code to clear multiple Local Authority selector box 
observeEvent(input$clearSelectedNeighbourhood, {updateSelectInput(session, 
              "GeographyCodeLCMultipleNeighbourhood", selected = "Scotland")})

# Server logic for chart data download button 
output$DownloadNeighbourhoodLC <- downloadHandler( filename =  'neighbourhood_rating_data.csv',
  content = function(file) { write.csv(SHS_LC_Neighbourhood_Download(), file, row.names=FALSE) })


# Question 2: Community Belonging 

output$lineChartCommbel <- renderPlotly({
  
  #Sets up CI's to feed to ggplot 
  dodge <- position_dodge(0.1)
  LowerConfidenceLimit <- SHS_LC_Commbel()$LowerConfidenceLimit
  UpperConfidenceLimit <- SHS_LC_Commbel()$UpperConfidenceLimit
  
# MAIN CHART SERVER LOGIC 1: creates the basic ggplot object to pass to plotly for Local Authorities alone 
  if(input$VariableSelectLCCommbel == "Local Authorities") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(LocalAuthority, 
# TO DO: Find a way to assign unique colours to each level of 'LocalAuthority
levels = c("Scotland", "Aberdeen City", "Aberdeenshire", "Angus", "Argyll and Bute", "City of Edinburgh",
          "Clackmannanshire", "Dumfries and Galloway", "Dundee City", "East Ayrshire",
          "East Dunbartonshire", "East Lothian", "East Renfrewshire", "Falkirk", "Fife", "Glasgow City",
          "Highland", "Inverclyde", "Midlothian", "Moray", "Na h-Eileanan Siar", "North Ayrshire",
          "North Lanarkshire", "Orkney Islands", "Perth and Kinross", "Renfrewshire", "Scottish Borders",
          "Shetland Islands", "South Ayrshire", "South Lanarkshire", "Stirling", "West Dunbartonshire",
          "West Lothian")), 
                    linetype=LocalAuthority, 
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(LocalAuthority, Belonging))) 
    
    # Creates the basic ggplot object to pass to plotly for Local Authorities by other variables 
  } else if(input$VariableSelectLCCommbel == "Gender") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(Gender), linetype=Gender,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(Gender, Belonging)))
    
  } else if(input$VariableSelectLCCommbel == "Urban Rural Classification") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(UrbanRuralClassification), 
                    linetype=UrbanRuralClassification,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(UrbanRuralClassification, Belonging)))
    
  } else if(input$VariableSelectLCCommbel == "SIMD Quintiles") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(SIMDQuintiles), linetype=SIMDQuintiles,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(SIMDQuintiles, Belonging)))
    
  } else if(input$VariableSelectLCCommbel == "Type of Tenure") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(TypeOfTenure), linetype=TypeOfTenure,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(TypeOfTenure, Belonging)))
    
  } else if(input$VariableSelectLCCommbel == "Household Type") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(HouseholdType), linetype=HouseholdType,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(HouseholdType, Belonging)))
    
  } else if(input$VariableSelectLCCommbel == "Ethnicity") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(Ethnicity), linetype=Ethnicity,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(Ethnicity, Belonging)))
    
  } else if(input$VariableSelectLCCommbel == "Walking distance to nearest greenspace") {
    
    p <- ggplot(data = SHS_LC_Commbel(), 
                aes(x=Year, y=Percent, colour=factor(Walkingdistancetonearestgreenspace), 
                    linetype=Walkingdistancetonearestgreenspace,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Belonging), 
                    group=interaction(Walkingdistancetonearestgreenspace, Belonging)))
    
  }
  
  # Main chart CI controls 
  if(input$ConfidenceIntervalsLCCommbel == TRUE) {
    
    p <- p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit), 
                           width=0.2, position=dodge)
    
  } else {
    
    p
    
  }
  
  # Main chart zoom controls 
  if(input$zoomLevel_LCCommbel == "Full scale") {
    
    p <- p + ylim(0, 100)
    
  }
  
  else {
    p
  }
  
  # MAIN CHART SERVER LOGIC 2
  
  # Adds the 'geom', 'labs' and 'theme'layers to the basic ggplot object
  
  p <- p + geom_line(position = dodge)+
    
    geom_point(position = dodge, alpha=0)+
    
    scale_color_manual(values = timeSeriesColours)+
    
    labs(x = "year",
         y = "percentage",
         title = input$BelongingLC)+
    
    theme(panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
          panel.background = element_rect(fill = "transparent"),
          legend.title = element_blank(),
          text = element_text(family = "Arial"))
  
  # Tidies the ggplot object to avoid duplication of labels
  p <- ggplotly(tooltip = "text")
  
})

observeEvent(input$clearSelectedCommbel, {updateSelectInput(session, "GeographyCodeLCMultipleCommbel", 
                                                                  selected = "Scotland")})

# Server logic for chart data download button 
output$DownloadCommbelLC <- downloadHandler( filename =  'community_belonging_data.csv',
  content = function(file) { write.csv(SHS_LC_Commbel_Download(), file, row.names=FALSE) })

# Question 3: Neighbourhood Improvement

output$lineChartArimp <- renderPlotly({
  
  #Sets up CI's to feed to ggplot 
  dodge <- position_dodge(0.1)
  LowerConfidenceLimit <- SHS_LC_Arimp()$LowerConfidenceLimit
  UpperConfidenceLimit <- SHS_LC_Arimp()$UpperConfidenceLimit
  
# MAIN CHART SERVER LOGIC 1: creates the basic ggplot object to pass to plotly for Local Authorities alone 
if(input$VariableSelectLCArimp == "Local Authorities") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(LocalAuthority, 
# TO DO: Find a way to assign unique colours to each level of 'LocalAuthority
levels = c("Scotland", "Aberdeen City", "Aberdeenshire", "Angus", "Argyll and Bute", "City of Edinburgh",
          "Clackmannanshire", "Dumfries and Galloway", "Dundee City", "East Ayrshire",
          "East Dunbartonshire", "East Lothian", "East Renfrewshire", "Falkirk", "Fife", "Glasgow City",
          "Highland", "Inverclyde", "Midlothian", "Moray", "Na h-Eileanan Siar", "North Ayrshire",
          "North Lanarkshire", "Orkney Islands", "Perth and Kinross", "Renfrewshire", "Scottish Borders",
          "Shetland Islands", "South Ayrshire", "South Lanarkshire", "Stirling", "West Dunbartonshire",
          "West Lothian")), 
                    linetype=LocalAuthority, 
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(LocalAuthority, Improvement ))) 
    
    # Creates the basic ggplot object to pass to plotly for Local Authorities by other variables 
  } else if(input$VariableSelectLCArimp == "Gender") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(Gender), linetype=Gender,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(Gender, Improvement )))
    
  } else if(input$VariableSelectLCArimp == "Urban Rural Classification") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(UrbanRuralClassification), 
                    linetype=UrbanRuralClassification,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(UrbanRuralClassification, Improvement )))
    
  } else if(input$VariableSelectLCArimp == "SIMD Quintiles") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(SIMDQuintiles), linetype=SIMDQuintiles,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(SIMDQuintiles, Improvement )))
    
  } else if(input$VariableSelectLCArimp == "Type of Tenure") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(TypeOfTenure), linetype=TypeOfTenure,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(TypeOfTenure, Improvement )))
    
  } else if(input$VariableSelectLCArimp == "Household Type") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(HouseholdType), linetype=HouseholdType,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(HouseholdType, Improvement )))
    
  } else if(input$VariableSelectLCArimp == "Ethnicity") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(Ethnicity), linetype=Ethnicity,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(Ethnicity, Improvement )))
    
  } else if(input$VariableSelectLCArimp == "Walking distance to nearest greenspace") {
    
    p <- ggplot(data = SHS_LC_Arimp(), 
                aes(x=Year, y=Percent, colour=factor(Walkingdistancetonearestgreenspace), 
                    linetype=Walkingdistancetonearestgreenspace,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                 LocalAuthority, ",", Year, "\n", Improvement ), 
                    group=interaction(Walkingdistancetonearestgreenspace, Improvement )))
    
  }
  
  # Main chart CI controls 
  if(input$ConfidenceIntervalsLCArimp == TRUE) {
    
    p <- p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit), 
                           width=0.2, position=dodge)
    
  } else {
    
    p
    
  }
  
  # Main chart zoom controls 
  if(input$zoomLevel_LCArimp == "Full scale") {
    
    p <- p + ylim(0, 100)
    
  }
  
  else {
    p
  }
  
  # MAIN CHART SERVER LOGIC 2
  
  # Adds the 'geom', 'labs' and 'theme'layers to the basic ggplot object 
  p <- p + geom_line(position = dodge)+
    
    geom_point(position = dodge, alpha=0)+
    
    scale_color_manual(values = timeSeriesColours)+
    
    labs(x = "year",
         y = "percentage",
         title = input$ImprovementLC)+
    
    theme(panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
          panel.background = element_rect(fill = "transparent"),
          legend.title = element_blank(),
          text = element_text(family = "Arial"))
  
  
  # Tidies the ggplot object to avoid duplication of labels
  p <- ggplotly(tooltip = "text")
  
})

observeEvent(input$clearSelectedArimp, {updateSelectInput(session, "GeographyCodeLCMultipleArimp", 
                                                                  selected = "Scotland")})

# Server logic for chart data download button 
output$DownloadArimpLC <- downloadHandler( filename =  'neighbourhood_improvement_data.csv',
  content = function(file) { write.csv(SHS_LC_Arimp_Download(), file, row.names=FALSE) })

#----------------------------------------- HELP TEXT ------------------------------------------------
shinyjs::onclick("openSaveButtonLCNeighbourhood", shinyjs::toggle(id = "saveSectionLCNeighbourhood", 
                                                                  anim = TRUE))
shinyjs::onclick("ShowDataMeaningLCNeighbourhood", shinyjs::toggle(id = "DataMeaningLCNeighbourhood", 
                                                                   anim = TRUE))
shinyjs::onclick("ShowZoomDetailsLCNeighbourhood", shinyjs::toggle(id = "ZoomInstructionsLCNeighbourhood", 
                 anim = TRUE))
shinyjs::onclick("ShowIsolateDataDetailsLCNeighbourhood", shinyjs::toggle(id = 
                  "IsolateDataInstructionsLCNeighbourhood",anim = TRUE))
shinyjs::onclick("ShowMissingDataDetailsLCNeighbourhood", shinyjs::toggle(id = 
                "MissingDataTextLCNeighbourhood", anim = TRUE))
shinyjs::onclick("ShowConfidenceIntervalsDetailsLCNeighbourhood", shinyjs::toggle(id = 
                "ConfidenceIntervalsTextLCNeighbourhood", anim = TRUE))
shinyjs::onclick("ShowStatisticallySignificantTextLCNeighbourhood", shinyjs::toggle(id = 
                "StatisticallySignificantTextLCNeighbourhood", anim = TRUE))
