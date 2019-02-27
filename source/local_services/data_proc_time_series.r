# Data processing for charts

SHS_LC <- reactive ({
  
  if(input$"VariableSelectLC" == "Local Authorities") {
    
    Filtered <- Unfiltered %>% filter(area %in% c(input$"FeatureCodeLCMultiple")
                                      & servicesperformance == input$"LocalAuthorityServicesAndPerformanceLC"
                                      & age == "All"
                                      & gender == "All"
                                      & urbanrural == "All"
                                      & simd == "All")
    
    df <- data.frame(Filtered$year
                     , Filtered$servicesperformance
                     , Filtered$percent
                     , Filtered$X95upperCI
                     , Filtered$X95lowerCI
                     , Filtered$area)
    
  } else if (input$"VariableSelectLC" == "Age") {
    
    Filtered <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                      & servicesperformance == input$"LocalAuthorityServicesAndPerformanceLC"
                                      & gender == "All"
                                      & urbanrural == "All"
                                      & simd == "All")
    
    df <- data.frame(Filtered$year
                     , Filtered$servicesperformance
                     , Filtered$percent
                     , Filtered$X95upperCI
                     , Filtered$X95lowerCI
                     , Filtered$area
                     , Filtered$age)
    
  } else if (input$"VariableSelectLC" == "Gender") {
    
    Filtered <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                      & servicesperformance == input$"LocalAuthorityServicesAndPerformanceLC"
                                      & age == "All"
                                      & urbanrural == "All"
                                      & simd == "All")
    
    df <- data.frame(Filtered$year
                     , Filtered$servicesperformance
                     , Filtered$percent
                     , Filtered$X95upperCI
                     , Filtered$X95lowerCI
                     , Filtered$area
                     , Filtered$gender)
    
  } else if (input$"VariableSelectLC" == "Urban Rural Classification") {
    
    Filtered <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                      & servicesperformance == input$"LocalAuthorityServicesAndPerformanceLC"
                                      & gender == "All"
                                      & age == "All"
                                      & simd == "All")
    
    df <- data.frame(Filtered$year
                     , Filtered$servicesperformance
                     , Filtered$percent
                     , Filtered$X95upperCI
                     , Filtered$X95lowerCI
                     , Filtered$area
                     , Filtered$urbanrural)
    
  } else if (input$"VariableSelectLC" == "SIMD Quintiles") {
    
    Filtered <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                      & servicesperformance == input$"LocalAuthorityServicesAndPerformanceLC"
                                      & gender == "All"
                                      & urbanrural == "All"
                                      & age == "All")
    
    df <- data.frame(Filtered$year
                     , Filtered$servicesperformance
                     , Filtered$percent
                     , Filtered$X95upperCI
                     , Filtered$X95lowerCI
                     , Filtered$area
                     , Filtered$simd)
  }
  
  df$Filtered.percent <- round(df$Filtered.percent, digits = 0)
  df$Filtered.X95upperCI <- round(df$Filtered.X95upperCI, digits = 1)
  df$Filtered.X95lowerCI <- round(df$Filtered.X95lowerCI, digits = 1)
  
  df <- rename(df, c("Filtered.year" = "Year"
                     , "Filtered.age" = "Age"
                     , "Filtered.gender" = "Gender"
                     , "Filtered.percent" = "Percent"
                     , "Filtered.simd" = "SIMDQuintiles"
                     , "Filtered.urbanrural" = "UrbanRuralClassification"
                     , "Filtered.servicesperformance" = "Statement"
                     , "Filtered.area" = "LocalAuthority"
                     , "Filtered.X95lowerCI" = "LowerConfidenceLimit"
                     , "Filtered.X95upperCI" = "UpperConfidenceLimit"))
  
})

# Data processing for downloads

SHS_LC_Download <- reactive({
  
  if(input$"VariableSelectLC" == "Local Authorities") {
    
    FilteredDownload <- Unfiltered %>% filter(area %in% c(input$"FeatureCodeLCMultiple")
                                              & servicesperformance == input$"LocalAuthorityServicesAndPerformanceLC"
                                              & age == "All"
                                              & gender == "All"
                                              & urbanrural == "All"
                                              & simd == "All")
    
    df <- data.frame(FilteredDownload$year
                     , FilteredDownload$servicesperformance
                     , FilteredDownload$area
                     , FilteredDownload$percent
                     , FilteredDownload$X95upperCI
                     , FilteredDownload$X95lowerCI)

  } else if (input$"VariableSelectLC" == "Age") {
    
    FilteredDownload <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                              & servicesperformance == 
                                                input$"LocalAuthorityServicesAndPerformanceLC"
                                              & gender == "All"
                                              & urbanrural == "All"
                                              & simd == "All")
    
    df <- data.frame(FilteredDownload$year
                     , FilteredDownload$servicesperformance
                     , FilteredDownload$area
                     , FilteredDownload$percent
                     , FilteredDownload$X95upperCI
                     , FilteredDownload$X95lowerCI
                     , FilteredDownload$age)
    
  } else if (input$"VariableSelectLC" == "Gender") {
    
    FilteredDownload <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                              & servicesperformance == 
                                                input$"LocalAuthorityServicesAndPerformanceLC"
                                              & age == "All"
                                              & urbanrural == "All"
                                              & simd == "All")
    
    df <- data.frame(FilteredDownload$year
                     , FilteredDownload$servicesperformance
                     , FilteredDownload$area
                     , FilteredDownload$percent
                     , FilteredDownload$X95upperCI
                     , FilteredDownload$X95lowerCI
                     , FilteredDownload$gender)
    
  } else if (input$"VariableSelectLC" == "Urban Rural Classification") {
    
    FilteredDownload <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                              & servicesperformance == 
                                                input$"LocalAuthorityServicesAndPerformanceLC"
                                              & gender == "All"
                                              & age == "All"
                                              & simd == "All")
    
    df <- data.frame(FilteredDownload$year
                     , FilteredDownload$servicesperformance
                     , FilteredDownload$area
                     , FilteredDownload$percent
                     , FilteredDownload$X95upperCI
                     , FilteredDownload$X95lowerCI
                     , FilteredDownload$urbanrural)
    
  } else if (input$"VariableSelectLC" == "SIMD Quintiles") {
    
    FilteredDownload <- Unfiltered %>% filter(area == input$"FeatureCodeLCSingle"
                                              & servicesperformance == 
                                                input$"LocalAuthorityServicesAndPerformanceLC"
                                              & gender == "All"
                                              & urbanrural == "All"
                                              & age == "All")
    
    df <- data.frame(FilteredDownload$year
                     , FilteredDownload$servicesperformance
                     , FilteredDownload$area
                     , FilteredDownload$percent
                     , FilteredDownload$X95upperCI
                     , FilteredDownload$X95lowerCI
                     , FilteredDownload$simd)
  }

  df <- rename(df, c("FilteredDownload.year" = "Year"
                     , "FilteredDownload.age" = "Age"
                     , "FilteredDownload.gender" = "Gender"
                     , "FilteredDownload.simd" = "SIMDQuintiles"
                     , "FilteredDownload.urbanrural" = "UrbanRuralClassification"
                     , "FilteredDownload.servicesperformance" = "Statement"
                     , "FilteredDownload.area" = "LocalAuthority"
                     , "FilteredDownload.percent" = "Value"
                     , "FilteredDownload.X95upperCI" = "UpperConfidenceLimit"
                     , "FilteredDownload.X95lowerCI" = "LowerConfidenceLimit"))
})
