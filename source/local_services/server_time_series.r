source("source/local_services/data_proc_time_series.r", local = TRUE)$value

output$lineChart <- renderPlotly({
  
  dodge <- position_dodge(0.1)
  LowerConfidenceLimit <- SHS_LC()$LowerConfidenceLimit
  UpperConfidenceLimit <- SHS_LC()$UpperConfidenceLimit
  
  if(input$VariableSelectLC == "Local Authorities") {
    
    p <- ggplot(data = SHS_LC(), 
                aes(x=Year, y=Percent, colour=factor(LocalAuthority,
                                                     
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
                     LocalAuthority, ",", Year, "\n", 
                     Statement),
        group=interaction(LocalAuthority, Statement))) 
    
  } else if(input$VariableSelectLC == "Age") {
    
    p <- ggplot(data = SHS_LC(), 
                aes(x=Year, y=Percent, colour=Age, linetype=Age,
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                 "Age: ", Age, "\n",
                                 LocalAuthority, ",", Year, "\n", 
                                 Statement),
                    group=interaction(Age, Statement))) 
    
  } else if(input$VariableSelectLC == "Gender") {
    
    p <- ggplot(data = SHS_LC(), 
                aes(x=Year, y=Percent, colour=Gender, linetype=Gender, 
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                 "Gender: ", Gender, "\n",
                                 LocalAuthority, ",", Year, "\n", 
                                 Statement),
                    group=interaction(Gender, Statement))) 
    
  } else if(input$VariableSelectLC == "Urban Rural Classification") {
    
    p <- ggplot(data = SHS_LC(),
                aes(x=Year, y=Percent, colour=UrbanRuralClassification, linetype=UrbanRuralClassification, 
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                 "Urban Rural Classification: ", UrbanRuralClassification, "\n",
                                 LocalAuthority, ",", Year, "\n", 
                                 Statement),
                    group=interaction(UrbanRuralClassification, Statement)))
    
  } else if(input$VariableSelectLC == "SIMD Quintiles") {
    
    p <- ggplot(data = SHS_LC(),
                aes(x=Year, y=Percent, colour=SIMDQuintiles, linetype=SIMDQuintiles, 
                    text = paste("Value: ", Percent, "%","\n", 
                                 "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                 "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                 "SIMD Quintile: ", SIMDQuintiles, "\n",
                                 LocalAuthority, ",", Year, "\n", 
                                 Statement),
                    group=interaction(SIMDQuintiles, Statement))) 
    
  }
  
  if(input$ConfidenceIntervalsLC == TRUE) {
    
    p <- p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit), width=0.2, position=dodge)
    
  } else {
    
    p
    
  }
  
  if(input$zoomLevel_LC == "Full scale") {
    
    p <- p + ylim(0, 100)
    
  }
  
  else {
    p
  }
  
  p <- p + geom_line(position = dodge) +
    
    geom_point(position = dodge, alpha = 0) +
    
    scale_colour_manual(values=timeSeriesColours)+
    
    labs(x = "year",
         y = "percentage",
         title = input$LocalAuthorityServicesAndPerformanceLC)+
    
    theme(panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
          panel.background = element_rect(fill = "transparent"),
          legend.title = element_blank(),
          text = element_text(family = "Arial"))
  
  p <- ggplotly(tooltip = "text")
  
})

# Server logic for chart data download button 
output$DownloadLocalAuthorityServicesAndPerformanceLC <- downloadHandler( filename =  
                                                          'local_services_data.csv',
content = function(file) { write.csv(SHS_LC_Download(), file, row.names=FALSE) })

observeEvent(input$clearSelected, {updateSelectInput(session, "FeatureCodeLCMultiple", selected = "Scotland")})

shinyjs::onclick("openSaveButtonLC", shinyjs::toggle(id = "saveSectionLC", anim = TRUE))
shinyjs::onclick("ShowDataMeaningLC", shinyjs::toggle(id = "DataMeaningLC", anim = TRUE))
shinyjs::onclick("ShowZoomDetailsLC", shinyjs::toggle(id = "ZoomInstructionsLC", anim = TRUE))
shinyjs::onclick("ShowIsolateDataDetailsLC", shinyjs::toggle(id = "IsolateDataInstructionsLC", anim = TRUE))
shinyjs::onclick("ShowMissingDataDetailsLC", shinyjs::toggle(id = "MissingDataTextLC", anim = TRUE))
shinyjs::onclick("ShowConfidenceIntervalsDetailsLC", shinyjs::toggle(id = "ConfidenceIntervalsTextLC", anim = TRUE))
shinyjs::onclick("ShowStatisticallySignificantTextLC", shinyjs::toggle(id = "StatisticallySignificantTextLC", anim = TRUE))