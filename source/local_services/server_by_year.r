source("source/local_services/data_proc_by_year.r", local = TRUE)

output$barChart <- renderPlotly({
  
  LowerConfidenceLimit <- SHS_BC()$LowerConfidenceLimit
  UpperConfidenceLimit <- SHS_BC()$UpperConfidenceLimit
  
  if (input$"OrderBC" == "Alphabetical") {
    
    LocalAuthority <- SHS_BC()$Area
    
  } else if (input$"OrderBC" == "Ascending") {
    
    LocalAuthority <- reorder(SHS_BC()$Area, SHS_BC()$Percent)
    
  } else if (input$"OrderBC" == "Descending") {
    
    LocalAuthority <- reorder(SHS_BC()$Area, -SHS_BC()$Percent)
    
  }
  
  p <- ggplot(data=SHS_BC(), aes(x=LocalAuthority, y=Percent, fill=StatisticallySignificant)) +
    
    geom_bar(stat="identity", aes(text = paste("Value: ", Percent, "%","\n", 
                                           "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
                                           "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
                                           LocalAuthority, ",", Year))) + 
    
    scale_fill_manual(values = byYearColours) +
    
    theme(axis.text.x = element_text(angle=90),
          legend.title = element_blank(),
          panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
          panel.background = element_rect(fill = "transparent"),
          text = element_text(family = "Arial")) +
    
    labs(x = "local authority", 
         y = "percentage")
  
  if(input$zoomLevel_BC == "Full scale") {
    p <- p + ylim(0, 100)
  }
  
  else {
    p
  }
  
  
  if(input$"ConfidenceIntervalsBC" == TRUE & input$"ScottishAverageBC" == TRUE) {
    
    p + geom_rect(xmin=0, xmax=100
                , ymin=SHS_BC_Scotland()$X95upperCI
                , ymax=SHS_BC_Scotland()$X95lowerCI
                , fill = "#008080"
                , alpha = 0.3) + 
      
      geom_hline(aes(yintercept = SHS_BC_Scotland()$percent,
                     text = paste("Scottish Average: ", SHS_BC_Scotland()$percent, "%","\n", 
                                  "Upper Confidence Limit: ", SHS_BC_Scotland()$X95upperCI,"%", "\n", 
                                  "Lower Confidence Limit: ", SHS_BC_Scotland()$X95lowerCI, "%", "\n"))) +
      
      geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit, 
      text = paste("Value: ", Percent, "%","\n", 
      "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
      "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
      LocalAuthority, ",", Year))) 

    
    
  } else if (input$"ConfidenceIntervalsBC" == TRUE & input$"ScottishAverageBC" == FALSE) {
    
    p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit, 
    text = paste("Value: ", Percent, "%","\n", 
    "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n", 
    "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n", 
    LocalAuthority, ",", Year)))

  } else if (input$"ConfidenceIntervalsBC" == FALSE & input$"ScottishAverageBC" == TRUE) {
    
    p + geom_rect(xmin=0, xmax=100
                  , ymin= SHS_BC_Scotland()$X95lowerCI
                  , ymax= SHS_BC_Scotland()$X95upperCI
                  , fill = "#008080"
                  , alpha = 0.1) +
    
      geom_hline(aes(yintercept = SHS_BC_Scotland()$percent,
                     text = paste("Scottish Average: ", SHS_BC_Scotland()$percent, "%","\n", 
                                  "Upper Confidence Limit: ", SHS_BC_Scotland()$X95upperCI,"%", "\n", 
                                  "Lower Confidence Limit: ", SHS_BC_Scotland()$X95lowerCI, "%", "\n")))
    
  } else {
    p
  }
  
# Tidies the ggplot object to avoid duplication of labels 
 p <- ggplotly(tooltip = "text") 
  
})

# Server logic for chart data download button 
output$DownloadLocalAuthorityServicesAndPerformance <- downloadHandler( filename =  
                                                                        'local_services_data.csv',
content = function(file) { write.csv(SHS_BC_Download(), file, row.names=FALSE) })



output$map <- renderLeaflet({
  
  mapData <- merge(scotLocAuth,
                   SHS_BC(),
                   by.x = "lad16nm",
                   by.y = "Area")
  
  factpal=colorFactor(palette = byYearColoursMap, domain=SHS_BC()$StatisticallySignificant)
  
  labels <- sprintf("<p>Value: %g&#37;<br/>
                    Upper Confidence Limit: %g&#37;<br/>
                    Lower Confidence Limit: %g&#37;<br/>
                    %s, %s<br/>
                    </p>",
                    mapData$Percent, 
                    mapData$UpperConfidenceLimit,
                    mapData$LowerConfidenceLimit,
                    mapData$lad16nm,
                    mapData$Year
                    ) %>% lapply(htmltools::HTML)
  
  leaflet(mapData) %>% 
    
    setView(lng = -3.5, lat = 56.817, zoom = 4.5) %>% 
    
    addPolygons(color = "#000000",
                weight = 0.4,
                smoothFactor = 0.5,
                opacity = 1,
                fillOpacity = 1,
                fillColor = ~factpal(StatisticallySignificant),
                highlightOptions = highlightOptions(color = "#000000", weight = 1, bringToFront = TRUE),
                label = labels,
                labelOptions = labelOptions(style = list("font-weight" = "normal", padding = "3px 8px"), 
                                            textsize = "12px", direction = "auto")) %>%
    
    addLegend(pal=factpal,
              values= ~StatisticallySignificant,
              title = NULL,
              opacity = 1)
})

output$byYearTitle <- renderUI({HTML(input$LocalAuthorityServicesAndPerformanceBC)})
output$byYearSubtitle <- renderUI({paste("Colour range shows statistically significant difference from the Scottish average (",SHS_BC_Scotland()$percent, "%)", collapse = " ")})
output$byYearTitleMap <- renderUI({HTML(input$LocalAuthorityServicesAndPerformanceBC)})
output$byYearSubtitleMap <- renderUI({paste("Colour range shows statistically significant difference from the Scottish average (",SHS_BC_Scotland()$percent, "%)", collapse = " ")})

shinyjs::onclick("openSaveButtonBC", shinyjs::toggle(id = "saveSectionBC", anim = TRUE))
shinyjs::onclick("ShowDataMeaningBC", shinyjs::toggle(id = "DataMeaningBC", anim = TRUE))
shinyjs::onclick("ShowZoomDetailsBC", shinyjs::toggle(id = "ZoomInstructionsBC", anim = TRUE))
shinyjs::onclick("ShowIsolateDataDetailsBC", shinyjs::toggle(id = "IsolateDataInstructionsBC", anim = TRUE))
shinyjs::onclick("ShowMissingDataDetailsBC", shinyjs::toggle(id = "MissingDataTextBC", anim = TRUE))
shinyjs::onclick("ShowConfidenceIntervalsDetailsBC", shinyjs::toggle(id = "ConfidenceIntervalsTextBC", anim = TRUE))
shinyjs::onclick("ShowStatisticallySignificantTextBC", shinyjs::toggle(id = "StatisticallySignificantTextBC", anim = TRUE))