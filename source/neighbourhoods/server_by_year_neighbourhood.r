# 'Source' definition connects to 'data_proc_by_year_neighbourhood' 
source("source/neighbourhoods/data_proc_by_year_neighbourhood.r", local = TRUE)

#-------------------------------------- RENDER CHARTS ----------------------------------------------------

# Creates output objects to pass to 'tab_by_year_neighbourhood'

# Question 1: Neighbourhood Rating

# Note rearranged functions for the experimental chart download in question 1 only
barChartNeighbourhood <- function(){

LowerConfidenceLimit <- SHS_BC_Neighbourhood()$LowerConfidenceLimit
UpperConfidenceLimit <- SHS_BC_Neighbourhood()$UpperConfidenceLimit

if (input$"OrderBCNeighbourhood" == "Alphabetical") {

  LocalAuthority <- SHS_BC_Neighbourhood()$Area

} else if (input$"OrderBCNeighbourhood" == "Ascending") {

  LocalAuthority <- reorder(SHS_BC_Neighbourhood()$Area,
                            SHS_BC_Neighbourhood()$Percent)

} else if (input$"OrderBCNeighbourhood" == "Descending") {

  LocalAuthority <- reorder(SHS_BC_Neighbourhood()$Area,
                            -SHS_BC_Neighbourhood()$Percent)

}

# Creates the core ggplot object to pass to plotly
p <- ggplot(data=SHS_BC_Neighbourhood(), aes(x=LocalAuthority
                                             , y=Percent
                                             , fill=StatisticallySignificant
                                             ))+

        geom_bar(stat = "identity", aes(text = paste("Value: ", Percent, "%","\n",
                                                     "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n",
                                                     "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                                     LocalAuthority, ",", Year)))+

          scale_fill_manual(values = byYearColours) +

            theme(axis.text.x = element_text(angle=90),
            legend.title = element_blank(),
            panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
            panel.background = element_rect(fill = "transparent"),
            text = element_text(family = "Arial"))+

              labs(x = "local authority",
              y = "percentage")

# Zoom control
if(input$zoomLevel_BCNeighbourhood == "Full scale") {
  p <- p + ylim(0, 100)

}

  else {
    p
  }

# Conditional controls to display CI's and Scottish average
if(input$"ConfidenceIntervalsBCNeighbourhood" == TRUE & input$"ScottishAverageBCNeighbourhood" == TRUE) {
  
  p + geom_rect(xmin=0
                , xmax=100
                , ymin=SHS_BC_Scotland_Neighbourhood()$X95upperCI
                , ymax=SHS_BC_Scotland_Neighbourhood()$X95lowerCI
                , fill = "#008080"
                , alpha = 0.3) +
    
    geom_hline(aes(yintercept = SHS_BC_Scotland_Neighbourhood()$percent
                   , text = paste("Scottish Average: ", SHS_BC_Scotland_Neighbourhood()$percent, "%","\n"
                                  , "Upper Confidence Limit: ", SHS_BC_Scotland_Neighbourhood()$X95upperCI,"%", "\n"
                                  , "Lower Confidence Limit: ", SHS_BC_Scotland_Neighbourhood()$X95lowerCI, "%", "\n"))) +
    
    geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit
                      , text = paste("Value: ", Percent, "%","\n"
                                     , "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n"
                                     , "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n"
                                     , LocalAuthority, ",", Year)))
  
  } else if (input$"ConfidenceIntervalsBCNeighbourhood" == TRUE & input$"ScottishAverageBCNeighbourhood" == FALSE) {
    
    p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit
                          , text = paste("Value: ", Percent, "%","\n"
                                         , "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n"
                                         , "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                         LocalAuthority, ",", Year)))
    
    } else if (input$"ConfidenceIntervalsBCNeighbourhood" == FALSE & input$"ScottishAverageBCNeighbourhood" == TRUE) {
      
      p + geom_rect(xmin=0
                    , xmax=100
                    , ymin=SHS_BC_Scotland_Neighbourhood()$X95upperCI
                    , ymax=SHS_BC_Scotland_Neighbourhood()$X95lowerCI
                    , fill = "#008080"
                    , alpha = 0.3) +

        geom_hline(aes(yintercept = SHS_BC_Scotland_Neighbourhood()$percent
                       , text = paste("Scottish Average: ", SHS_BC_Scotland_Neighbourhood()$percent, "%","\n"
                                      , "Upper Confidence Limit: ", SHS_BC_Scotland_Neighbourhood()$X95upperCI,"%", "\n"
                                      , "Lower Confidence Limit: ", SHS_BC_Scotland_Neighbourhood()$X95lowerCI, "%", "\n")))

} else {
  
  p

}

# Tidies the ggplot object to avoid duplication of labels
 p <- ggplotly(tooltip = "text")

}

# Renders chart
output$neighbourhoodBarChart <- renderPlotly({
  barChartNeighbourhood()
  })

# Server logic for chart data download button
output$DownloadNeighbourhood <- downloadHandler( filename =  'neighbourhood_rating_data.csv',
content = function(file) { write.csv(SHS_BC_Neighbourhood_Download(), file, row.names=FALSE) })

# Server logic for experimental chart download buttons
# 1: Working Scot PHO method:
#see line 488:https://github.com/Health-SocialCare-Scotland/ScotPHO-profile-tool/blob/master/server.R

# output$DownloadNeighbourhoodChart<- downloadHandler(
#                                    filename = 'chart.png',
#                                    content = function(file){
# ggsave(file, plot = barChartNeighbourhood(), device = "png", height=15, width=15, limitsize=FALSE)
#                                     }
#)

# 2: Alternative method
# output$saveButtonBC <- downloadHandler(
#                                    filename = function(){paste(input$"userFileNameBC", '.png', sep = '')},
#                                    content = function(file){
# ggsave(file, plot = barChartNeighbourhood(), device = "png", height =15, width=15, limitsize=FALSE)})




# Question 2: Community Belonging
output$barChartCommbel <- renderPlotly({

  LowerConfidenceLimit <- SHS_BC_Commbel()$LowerConfidenceLimit
  UpperConfidenceLimit <- SHS_BC_Commbel()$UpperConfidenceLimit

  if (input$"OrderBCCommbel" == "Alphabetical") {

    LocalAuthority <- SHS_BC_Commbel()$Area

  } else if (input$"OrderBCCommbel" == "Ascending") {

    LocalAuthority <- reorder(SHS_BC_Commbel()$Area, SHS_BC_Commbel()$Percent)

  } else if (input$"OrderBCCommbel" == "Descending") {

    LocalAuthority <- reorder(SHS_BC_Commbel()$Area, -SHS_BC_Commbel()$Percent)

  }

# Creates the core ggplot object to pass to plotly
  p <- ggplot(data=SHS_BC_Commbel(), aes(x=LocalAuthority, y=Percent, fill= StatisticallySignificant))+

    geom_bar(stat="identity", aes(text = paste("Value: ", Percent, "%","\n",
                                  "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n",
                                  "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                  LocalAuthority, ",", Year)))+

      scale_fill_manual(values = byYearColours)+

        theme(axis.text.x = element_text(angle=90),
          legend.title = element_blank(),
          panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
          panel.background = element_rect(fill = "transparent"),
          text = element_text(family = "Arial"))+

            labs(x = "local authority", y = "percentage")

# Zoom control
  if(input$zoomLevel_BCCommbel == "Full scale") {
    p <- p + ylim(0, 100)

  }

  else {
    p
  }

# Conditional controls to display CI's and Scottish average
  if(input$"ConfidenceIntervalsBCCommbel" == TRUE & input$"ScottishAverageBCCommbel" == TRUE) {
  p + geom_rect(xmin=0
                , xmax=100
                , ymin=SHS_BC_Scotland_Commbel()$X95upperCI
                , ymax=SHS_BC_Scotland_Commbel()$X95lowerCI
                , fill = "#008080"
                , alpha = 0.3) +
    
    geom_hline(aes(yintercept = SHS_BC_Scotland_Commbel()$percent
                   , text = paste("Scottish Average: ", SHS_BC_Scotland_Commbel()$percent, "%","\n"
                                  , "Upper Confidence Limit: ", SHS_BC_Scotland_Commbel()$X95upperCI,"%", "\n"
                                  , "Lower Confidence Limit: ", SHS_BC_Scotland_Commbel()$X95lowerCI, "%", "\n"))) +
    
    geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit
                      , text = paste("Value: ", Percent, "%","\n"
                                     , "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n"
                                     , "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n"
                                     , LocalAuthority, ",", Year)))
  
} else if (input$"ConfidenceIntervalsBCCommbel" == TRUE & input$"ScottishAverageBCCommbel" == FALSE) {
  
  p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit
                        , text = paste("Value: ", Percent, "%","\n"
                                       , "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n"
                                       , "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                       LocalAuthority, ",", Year)))
  
} else if (input$"ConfidenceIntervalsBCCommbel" == FALSE & input$"ScottishAverageBCCommbel" == TRUE) {
  
  p + geom_rect(xmin=0
                , xmax=100
                , ymin=SHS_BC_Scotland_Commbel()$X95upperCI
                , ymax=SHS_BC_Scotland_Commbel()$X95lowerCI
                , fill = "#008080"
                , alpha = 0.3) +
    
    geom_hline(aes(yintercept = SHS_BC_Scotland_Commbel()$percent
                   , text = paste("Scottish Average: ", SHS_BC_Scotland_Commbel()$percent, "%","\n"
                                  , "Upper Confidence Limit: ", SHS_BC_Scotland_Commbel()$X95upperCI,"%", "\n"
                                  , "Lower Confidence Limit: ", SHS_BC_Scotland_Commbel()$X95lowerCI, "%", "\n")))
  
} else {
  
  p
  
}

  # Tidies the ggplot object to avoid duplication of labels
  p <- ggplotly(tooltip = "text")

})

# Server logic for chart data download button
output$DownloadCommbel <- downloadHandler( filename = 'community_belonging_data.csv',
  content = function(file) { write.csv(SHS_BC_Commbel_Download(), file, row.names=FALSE) })


# Question 3: Area Improvement

output$barChartArimp <- renderPlotly({

  LowerConfidenceLimit <- SHS_BC_Arimp()$LowerConfidenceLimit
  UpperConfidenceLimit <- SHS_BC_Arimp()$UpperConfidenceLimit

  if (input$"OrderBCArimp" == "Alphabetical") {

    LocalAuthority <- SHS_BC_Arimp()$Area

  } else if (input$"OrderBCArimp" == "Ascending") {

    LocalAuthority <- reorder(SHS_BC_Arimp()$Area, SHS_BC_Arimp()$Percent)

  } else if (input$"OrderBCArimp" == "Descending") {

    LocalAuthority <- reorder(SHS_BC_Arimp()$Area, -SHS_BC_Arimp()$Percent)

  }

# Creates the core ggplot object to pass to plotly
  p <- ggplot(data=SHS_BC_Arimp(), aes(x=LocalAuthority, y=Percent, fill= StatisticallySignificant))+

    geom_bar(stat="identity", aes(text = paste("Value: ", Percent, "%","\n",
                                       "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n",
                                       "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                       LocalAuthority, ",", Year)))+

    scale_fill_manual(values = byYearColours)+

    theme(axis.text.x = element_text(angle=90),
          legend.title = element_blank(),
          panel.grid.major.y = element_line(colour = "#b8b8ba", size = 0.3),
          panel.background = element_rect(fill = "transparent"),
          text = element_text(family = "Arial"))+

    labs(x = "local authority", y = "percentage")


# Zoom control
  if(input$zoomLevel_BCArimp == "Full scale") {
    p <- p + ylim(0, 100)

  }

  else {
    p
  }

  # Conditional controls to display CI's and Scottish average
  if(input$"ConfidenceIntervalsBCArimp" == TRUE & input$"ScottishAverageBCArimp" == TRUE) {
    p + geom_rect(xmin=0
                  , xmax=100
                  , ymin=SHS_BC_Scotland_Arimp()$X95upperCI
                  , ymax=SHS_BC_Scotland_Arimp()$X95lowerCI
                  , fill = "#008080"
                  , alpha = 0.3) +
      
      geom_hline(aes(yintercept = SHS_BC_Scotland_Arimp()$percent
                     , text = paste("Scottish Average: ", SHS_BC_Scotland_Arimp()$percent, "%","\n"
                                    , "Upper Confidence Limit: ", SHS_BC_Scotland_Arimp()$X95upperCI,"%", "\n"
                                    , "Lower Confidence Limit: ", SHS_BC_Scotland_Arimp()$X95lowerCI, "%", "\n"))) +
      
      geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit
                        , text = paste("Value: ", Percent, "%","\n"
                                       , "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n"
                                       , "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n"
                                       , LocalAuthority, ",", Year)))
    
  } else if (input$"ConfidenceIntervalsBCArimp" == TRUE & input$"ScottishAverageBCArimp" == FALSE) {
    
    p + geom_errorbar(aes(ymin=LowerConfidenceLimit, ymax=UpperConfidenceLimit
                          , text = paste("Value: ", Percent, "%","\n"
                                         , "Upper Confidence Limit: ", UpperConfidenceLimit,"%", "\n"
                                         , "Lower Confidence Limit: ", LowerConfidenceLimit, "%", "\n",
                                         LocalAuthority, ",", Year)))
    
  } else if (input$"ConfidenceIntervalsBCArimp" == FALSE & input$"ScottishAverageBCArimp" == TRUE) {
    
    p + geom_rect(xmin=0
                  , xmax=100
                  , ymin=SHS_BC_Scotland_Arimp()$X95upperCI
                  , ymax=SHS_BC_Scotland_Arimp()$X95lowerCI
                  , fill = "#008080"
                  , alpha = 0.3) +
      
      geom_hline(aes(yintercept = SHS_BC_Scotland_Arimp()$percent
                     , text = paste("Scottish Average: ", SHS_BC_Scotland_Arimp()$percent, "%","\n"
                                    , "Upper Confidence Limit: ", SHS_BC_Scotland_Arimp()$X95upperCI,"%", "\n"
                                    , "Lower Confidence Limit: ", SHS_BC_Scotland_Arimp()$X95lowerCI, "%", "\n")))
    
  } else {
    
    p
    
  }
  
  # Tidies the ggplot object to avoid duplication of labels
  p <- ggplotly(tooltip = "text")

})

# Server logic for chart data download button
output$DownloadArimp <- downloadHandler( filename =  'neighbourhood_improvement_data.csv',
 content = function(file) { write.csv(SHS_BC_Arimp_Download(), file, row.names=FALSE) })

#-------------------------------------- RENDER MAPS -------------------------------------------------------

# Renders the map object to pass to 'tab_by_year_neighbourhood'

# Question 1: Neighbourhood Rating

output$mapNeighbourhood <- renderLeaflet({

# Joins shape data to the reactive query ('lad16nm' contains the set of LA names)
mapDataNeighbourhood <- merge(scotLocAuthNeighbourhood,
                                SHS_BC_Neighbourhood(),
                                by.x = "lad16nm",
                                by.y = "Area")

# Sets up a colour pallete and labels for the map object
  factpalNeighbourhood=colorFactor(palette = byYearColoursMap, domain =
       SHS_BC_Neighbourhood()$StatisticallySignificant)


  labelsNeighbourhood <- sprintf("<p>Value: %g&#37;<br/>
                                Upper Confidence Limit: %g&#37;<br/>
                                Lower Confidence Limit: %g&#37;<br/>
                                %s, %s<br/>
                                </p>",
                                mapDataNeighbourhood$Percent,
                                mapDataNeighbourhood$UpperConfidenceLimit,
                                mapDataNeighbourhood$LowerConfidenceLimit,
                                mapDataNeighbourhood$lad16nm,
                                mapDataNeighbourhood$Year) %>%

                  lapply(htmltools::HTML)

# Creates the basic map object and adds necessary layers ('%>%' is leaflet's equivalent of '+' in ggplot)
  leaflet(mapDataNeighbourhood) %>%

    setView(lng = -3.5, lat = 56.817, zoom = 4.5) %>%

      addPolygons(color = "#000000",
            weight = 0.4,
            smoothFactor = 0.5,
            opacity = 1,
            fillOpacity = 1,
            stroke = TRUE,
            fillColor = ~factpalNeighbourhood(StatisticallySignificant),
            highlightOptions = highlightOptions(color = "#000000", weight = 1, bringToFront = TRUE),
            label = labelsNeighbourhood,
            labelOptions = labelOptions(style = list("font-weight" = "normal", padding = "3px 8px"),
                                        textsize = "12px", direction = "auto")) %>%

        addLegend(pal=factpalNeighbourhood,
          values= ~StatisticallySignificant,
          title = NULL,
          opacity = 1)

    })





# Question 2: Community Belonging

output$mapCommbel <- renderLeaflet({

  # Joins shape data to the reactive query ('lad16nm' contains the set of LA names)
  mapDataCommbel <- merge(scotLocAuthCommbel,
                                SHS_BC_Commbel(),
                                by.x = "lad16nm",
                                by.y = "Area")

  # Sets up a colour pallete and labels for the map object
  factpalCommbel=colorFactor(palette = byYearColoursMap, domain =
                                     SHS_BC_Commbel()$StatisticallySignificant)

  labelsCommbel <- sprintf("<p>Value: %g&#37;<br/>
                                Upper Confidence Limit: %g&#37;<br/>
                                Lower Confidence Limit: %g&#37;<br/>
                                %s, %s<br/>
                                </p>",
                                 mapDataCommbel$Percent,
                                 mapDataCommbel$UpperConfidenceLimit,
                                 mapDataCommbel$UpperConfidenceLimit,
                                 mapDataCommbel$lad16nm,
                                 mapDataCommbel$Year) %>%

    lapply(htmltools::HTML)

  # Creates the basic map object and adds necessary layers ('%>%' is leaflet's equivalent of '+' in ggplot)
  leaflet(mapDataCommbel) %>%

    setView(lng = -3.5, lat = 56.817, zoom = 4.5) %>%

    addPolygons(color = "#000000",
                weight = 0.4,
                smoothFactor = 0.5,
                opacity = 1,
                fillOpacity = 1,
                fillColor = ~factpalCommbel(StatisticallySignificant),
                highlightOptions = highlightOptions(color = "#000000", weight = 1, bringToFront = TRUE),
                label = labelsCommbel,
                labelOptions = labelOptions(style = list("font-weight" = "normal", padding = "3px 8px"),
                                            textsize = "12px", direction = "auto")) %>%

    addLegend(pal=factpalCommbel,
              values= ~StatisticallySignificant,
              title = NULL,
              opacity = 1)

})

# Question 3: Area Improvement

output$mapArimp <- renderLeaflet({

  # Joins shape data to the reactive query ('lad16nm' contains the set of LA names)
  mapDataArimp <- merge(scotLocAuthArimp,
                          SHS_BC_Arimp(),
                          by.x = "lad16nm",
                          by.y = "Area")

  # Sets up a colour pallete and labels for the map object
  factpalArimp=colorFactor(palette = byYearColoursMap, domain =
                               SHS_BC_Arimp()$StatisticallySignificant)

  labelsArimp <- sprintf("<p>Value: %g&#37;<br/>
                           Upper Confidence Limit: %g&#37;<br/>
                           Lower Confidence Limit: %g&#37;<br/>
                           %s, %s<br/>
                           </p>",
                           mapDataArimp$Percent,
                           mapDataArimp$UpperConfidenceLimit,
                           mapDataArimp$LowerConfidenceLimit,
                           mapDataArimp$lad16nm,
                           mapDataArimp$Year) %>%

    lapply(htmltools::HTML)

  # Creates the basic map object and adds necessary layers ('%>%' is leaflet's equivalent of '+' in ggplot)
  leaflet(mapDataArimp) %>%

    setView(lng = -3.5, lat = 56.817, zoom = 4.5) %>%

    addPolygons(color = "#000000",
                weight = 0.4,
                smoothFactor = 0.5,
                opacity = 1,
                fillOpacity = 1,
                fillColor = ~factpalArimp(StatisticallySignificant),
                highlightOptions = highlightOptions(color = "#000000", weight = 1, bringToFront = TRUE),
                label = labelsArimp,
                labelOptions = labelOptions(style = list("font-weight" = "normal", padding = "3px 8px"),
                                            textsize = "12px", direction = "auto")) %>%

    addLegend(pal=factpalArimp,
              values= ~StatisticallySignificant,
              title = NULL,
              opacity = 1)

})

#------------------------------------ CHART AND MAP HEADER BARS ------------------------------------------

# Neighbourhood Rating:

output$byYearTitleNeighbourhood <- renderUI({HTML(input$NeighbourhoodRatingBC)})
output$byYearSubtitleNeighbourhood <- renderUI({paste("
  Colour range shows statistically significant difference from the Scottish average ("
,SHS_BC_Scotland_Neighbourhood()[which(SHS_BC_Scotland_Neighbourhood()$FilteredNeighbourhood.Measurement==
                               "Percent"), "FilteredNeighbourhood.Value"], "%)", collapse = " ")})


output$byYearTitleMapNeighbourhood <- renderUI({HTML(input$NeighbourhoodRatingBC)})
output$byYearSubtitleMapNeighbourhood <- renderUI({paste("
  Colour range shows statistically significant difference from the Scottish average ("
,SHS_BC_Scotland_Neighbourhood()[which(SHS_BC_Scotland_Neighbourhood()$FilteredNeighbourhood.Measurement==
                               "Percent"), "FilteredNeighbourhood.Value"], "%)", collapse = " ")})

# Community Belonging:

output$byYearTitleCommbel <- renderUI({HTML(input$BelongingBC)})
output$byYearSubtitleCommbel <- renderUI({paste("
  Colour range shows statistically significant difference from the Scottish average ("
,SHS_BC_Scotland_Commbel()[which(SHS_BC_Scotland_Commbel()$FilteredCommbel.Measurement==
                                "Percent"), "FilteredCommbel.Value"], "%)", collapse = " ")})


output$byYearTitleMapCommbel <- renderUI({HTML(input$BelongingBC)})
output$byYearSubtitleMapCommbel <- renderUI({paste("
 Colour range shows statistically significant difference from the Scottish average ("
,SHS_BC_Scotland_Commbel()[which(SHS_BC_Scotland_Commbel()$FilteredCommbel.Measurement==
                                  "Percent"), "FilteredCommbel.Value"], "%)", collapse = " ")})

# Area Improvement:

output$byYearTitleArimp <- renderUI({HTML(input$ImprovementBC)})
output$byYearSubtitleArimp <- renderUI({paste("
Colour range shows statistically significant difference from the Scottish average ("
,SHS_BC_Scotland_Arimp()[which(SHS_BC_Scotland_Arimp()$FilteredArimp.Measurement==
                                 "Percent"), "FilteredArimp.Value"], "%)", collapse = " ")})


output$byYearTitleMapArimp <- renderUI({HTML(input$ImprovementBC)})
output$byYearSubtitleMapArimp <- renderUI({paste("
Colour range shows statistically significant difference from the Scottish average ("
   ,SHS_BC_Scotland_Arimp()[which(SHS_BC_Scotland_Arimp()$FilteredArimp.Measurement==
                                    "Percent"), "FilteredArimp.Value"], "%)", collapse = " ")})


#----------------------------------------- HELP SECTION --------------------------------------------------

# Calls shinyjs to perform the animations for the help buttons 

shinyjs::onclick("openSaveButtonBCNeighbourhood", shinyjs::toggle(id = "saveSectionBCNeighbourhood", 
                                                                  anim = TRUE))

shinyjs::onclick("ShowDataMeaningBCNeighbourhood", shinyjs::toggle(id = "DataMeaningBCNeighbourhood", 
                                                                   anim = TRUE))

shinyjs::onclick("ShowZoomDetailsBCNeighbourhood", shinyjs::toggle(id = 
                  "ZoomInstructionsBCNeighbourhood", anim = TRUE))

shinyjs::onclick("ShowIsolateDataDetailsBCNeighbourhood", shinyjs::toggle(id = 
                  "IsolateDataInstructionsBCNeighbourhood", anim = TRUE))

shinyjs::onclick("ShowMissingDataDetailsBCNeighbourhood", shinyjs::toggle(id = 
                  "MissingDataTextBCNeighbourhood", anim = TRUE))

shinyjs::onclick("ShowConfidenceIntervalsDetailsBCNeighbourhood", shinyjs::toggle(id = 
                    "ConfidenceIntervalsTextBCNeighbourhood", anim = TRUE))

shinyjs::onclick("ShowStatisticallySignificantTextBCNeighbourhood", shinyjs::toggle(id = 
                    "StatisticallySignificantTextBCNeighbourhood", anim = TRUE))
