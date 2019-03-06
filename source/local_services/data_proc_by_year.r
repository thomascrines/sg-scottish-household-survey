SHS_BC_Scotland <- reactive ({
  
  Filtered_Scotland <- Unfiltered %>% filter(age == "All"
                                    & servicesperformance == input$"LocalAuthorityServicesAndPerformanceBC"
                                    & gender == "All"
                                    & area == "Scotland"
                                    & urbanrural == "All" 
                                    & simd == "All"
                                    & year == input$"DateCodeBC")
  
  Filtered_Scotland$percent <- round(Filtered_Scotland$percent, digits = 0)
  Filtered_Scotland$X95upperCI <- round(Filtered_Scotland$X95upperCI, digits = 1)
  Filtered_Scotland$X95lowerCI <- round(Filtered_Scotland$X95lowerCI, digits = 1)
  
  Filtered_Scotland
})

SHS_BC <- reactive ({
  
  Filtered <- Unfiltered %>% filter(age == "All"
                                    & servicesperformance == input$"LocalAuthorityServicesAndPerformanceBC"
                                    & gender == "All"
                                    & area != "Scotland"
                                    & urbanrural == "All" 
                                    & simd == "All"
                                    & year == input$"DateCodeBC")
  
  Filtered$percent <- round(Filtered$percent, digits = 0)
  Filtered$X95upperCI <- round(Filtered$X95upperCI, digits = 1)
  Filtered$X95lowerCI <- round(Filtered$X95lowerCI, digits = 1)
  
  df <- data.frame(Filtered$year
                   , Filtered$servicesperformance
                   , Filtered$percent
                   , Filtered$X95upperCI
                   , Filtered$X95lowerCI
                   , Filtered$area
  )
  
  SHS_BC <- rename(df, c("Filtered.year" = "Year"
                         , "Filtered.age" = "Age"
                         , "Filtered.gender" = "Gender"
                         , "Filtered.percent" = "Percent"
                         , "Filtered.simd" = "SIMDQuintiles"
                         , "Filtered.urbanrural" = "UrbanRuralClassification"
                         , "Filtered.servicesperformance" = "Statement"
                         , "Filtered.area" = "Area"
                         , "Filtered.X95upperCI" = "UpperConfidenceLimit"
                         , "Filtered.X95lowerCI" = "LowerConfidenceLimit"))
  
  SHS_BC <- cbind(StatisticallySignificant = "None", SHS_BC)
  
  levels(SHS_BC$StatisticallySignificant) <-c("None", "Significantly Higher", "Significantly Lower", "No Significant Difference")
  
  SHS_BC[which(SHS_BC$LowerConfidenceLimit > SHS_BC_Scotland()$X95upperCI), "StatisticallySignificant"] <- "Significantly Higher"
  
  SHS_BC[which(SHS_BC$UpperConfidenceLimit < SHS_BC_Scotland()$X95lowerCI), "StatisticallySignificant"] <- "Significantly Lower"
  
  SHS_BC[which(SHS_BC$StatisticallySignificant == "None"), "StatisticallySignificant"] <- "No Significant Difference"
  
  SHS_BC
})

# Reactive query 3: defines a mirror data object for the chart data download button 
SHS_BC_Download <- reactive({
  
  FilteredDownload <- Unfiltered %>% filter(age == "All"
    & servicesperformance == input$"LocalAuthorityServicesAndPerformanceBC"
    & gender == "All"
    & area != "Scotland"
    & urbanrural == "All" 
    & simd == "All"
    & year == input$"DateCodeBC")
  
  df <- data.frame(FilteredDownload$year
                   , FilteredDownload$servicesperformance
                   , FilteredDownload$percent
                   , FilteredDownload$X95upperCI
                   , FilteredDownload$X95lowerCI
                   , FilteredDownload$area)
  
  df <- rename(df, c("FilteredDownload.year" = "Year"
                     ,"FilteredDownload.servicesperformance" = "Statement"
                     , "FilteredDownload.percent" = "Value"
                     , "FilteredDownload.X95upperCI" = "UpperConfidenceLimit"
                     , "FilteredDownload.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredDownload.area" = "LocalAuthority"))
  
  
  
})