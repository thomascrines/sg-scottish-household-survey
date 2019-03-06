# Question 1: Neighbourhood Rating - data processing for charts

SHS_BC_Scotland_Neighbourhood <- reactive ({
  
  Filtered_Scotland_Neighbourhood <- UnfilteredNeighbourhood %>% filter(
                                      neighbourhoodRating == input$"NeighbourhoodRatingBC"
                                      & year == input$"DateCodeBCNeighbourhood"
                                      & area == "Scotland"
                                      & gender == "All"
                                      & urbanRuralClassification == "All"
                                      & simdQuintiles == "All"
                                      & typeOfTenure == "All"
                                      & ethnicity == "All"
                                      & householdType == "All"
                                      & walkingDistanceToNearestGreenspace == "All")
  
  Filtered_Scotland_Neighbourhood$percent <- round(Filtered_Scotland_Neighbourhood$percent, digits = 0)
  Filtered_Scotland_Neighbourhood$X95upperCI <- round(Filtered_Scotland_Neighbourhood$X95upperCI, digits = 1)
  Filtered_Scotland_Neighbourhood$X95lowerCI <- round(Filtered_Scotland_Neighbourhood$X95lowerCI, digits = 1)
  
  Filtered_Scotland_Neighbourhood
  })

SHS_BC_Neighbourhood <- reactive ({

  FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(neighbourhoodRating ==
                              input$"NeighbourhoodRatingBC"
                              & year == input$"DateCodeBCNeighbourhood"
                              & area != "Scotland"
                              & gender == "All"
                              & urbanRuralClassification == "All"
                              & simdQuintiles == "All"
                              & typeOfTenure == "All"
                              & householdType == "All"
                              & ethnicity == "All"
                              & walkingDistanceToNearestGreenspace == "All")
  
  FilteredNeighbourhood$percent <- round(FilteredNeighbourhood$percent, digits = 0)
  FilteredNeighbourhood$X95upperCI <- round(FilteredNeighbourhood$X95upperCI, digits = 1)
  FilteredNeighbourhood$X95lowerCI <- round(FilteredNeighbourhood$X95lowerCI, digits = 1)

  df <- data.frame(FilteredNeighbourhood$year
                   , FilteredNeighbourhood$neighbourhoodRating
                   , FilteredNeighbourhood$area
                   , FilteredNeighbourhood$percent
                   , FilteredNeighbourhood$X95upperCI
                   , FilteredNeighbourhood$X95lowerCI)

  SHS_BC_Neighbourhood <- rename(df, c("FilteredNeighbourhood.year" = "Year"
                         , "FilteredNeighbourhood.percent" = "Percent"
                         , "FilteredNeighbourhood.neighbourhoodRating" = "neighbourhoodRating"
                         , "FilteredNeighbourhood.area" = "Area"
                         , "FilteredNeighbourhood.ValueRounded" = "ValueRounded"
                         , "FilteredNeighbourhood.X95lowerCI" = "LowerConfidenceLimit"
                         , "FilteredNeighbourhood.X95upperCI" = "UpperConfidenceLimit"))

SHS_BC_Neighbourhood <- cbind(StatisticallySignificant = "None", SHS_BC_Neighbourhood)

levels(SHS_BC_Neighbourhood$StatisticallySignificant) <- c("None", "Significantly Higher", "Significantly Lower", "No Significant Difference")

SHS_BC_Neighbourhood[which(SHS_BC_Neighbourhood$LowerConfidenceLimit > SHS_BC_Scotland_Neighbourhood()$X95upperCI), "StatisticallySignificant"] <- "Significantly Higher"

SHS_BC_Neighbourhood[which(SHS_BC_Neighbourhood$UpperConfidenceLimit < SHS_BC_Scotland_Neighbourhood()$X95lowerCI), "StatisticallySignificant"] <- "Significantly Lower"

SHS_BC_Neighbourhood[which(SHS_BC_Neighbourhood$StatisticallySignificant == "None"), "StatisticallySignificant"] <- "No Significant Difference"

SHS_BC_Neighbourhood

})

# Question 1: Neighbourhood Rating - data processing for download

SHS_BC_Neighbourhood_Download <- reactive({

FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(neighbourhoodRating == input$"NeighbourhoodRatingBC"
                                    & year == input$"DateCodeBCNeighbourhood"
                                    & area != "Scotland"
                                    & gender == "All"
                                    & urbanRuralClassification == "All"
                                    & simdQuintiles == "All"
                                    & typeOfTenure == "All"
                                    & householdType == "All"
                                    & ethnicity == "All"
                                    & walkingDistanceToNearestGreenspace == "All")

df <- data.frame(FilteredNeighbourhoodDownload$year
                 , FilteredNeighbourhoodDownload$neighbourhoodRating
                 , FilteredNeighbourhoodDownload$percent
                 , FilteredNeighbourhoodDownload$area
                 , FilteredNeighbourhoodDownload$X95upperCI
                 , FilteredNeighbourhoodDownload$X95lowerCI)

SHS_BC_Neighbourhood_Download <- rename(df, c("FilteredNeighbourhoodDownload.year" = "Year"
                   ,"FilteredNeighbourhoodDownload.neighbourhoodRating" = "NeighbourhoodRating"
                   , "FilteredNeighbourhoodDownload.percent" = "Percent"
                   , "FilteredNeighbourhoodDownload.area" = "Area"
                   , "FilteredNeighbourhoodDownload.X95upperCI" = "UpperConfidenceLimit"
                   , "FilteredNeighbourhoodDownload.X95lowerCI" = "LowerConfidenceLimit"))
  })

# Question 2: Community Belonging - data processing for chart

SHS_BC_Scotland_Commbel <- reactive ({

  Filtered_Scotland_Commbel <- UnfilteredCommbel %>% filter(communityBelonging == input$"BelongingBC"
                                            & year == input$"DateCodeBCCommbel"
                                            & area == "Scotland"
                                            & gender == "All"
                                            & urbanRuralClassification == "All"
                                            & simdQuintiles == "All"
                                            & typeOfTenure == "All"
                                            & householdType == "All"
                                            & ethnicity == "All"
                                            & walkingDistanceToNearestGreenspace == "All")
  
  Filtered_Scotland_Commbel$percent <- round(Filtered_Scotland_Commbel$percent, digits = 0)
  Filtered_Scotland_Commbel$X95upperCI <- round(Filtered_Scotland_Commbel$X95upperCI, digits = 1)
  Filtered_Scotland_Commbel$X95lowerCI <- round(Filtered_Scotland_Commbel$X95lowerCI, digits = 1)
  
  Filtered_Scotland_Commbel
  
})

SHS_BC_Commbel <- reactive ({

  FilteredCommbel <- UnfilteredCommbel %>% filter(communityBelonging == input$"BelongingBC"
                                          & year == input$"DateCodeBCCommbel"
                                          & area != "Scotland"
                                          & gender == "All"
                                          & urbanRuralClassification == "All"
                                          & simdQuintiles == "All"
                                          & typeOfTenure == "All"
                                          & householdType == "All"
                                          & ethnicity == "All"
                                          & walkingDistanceToNearestGreenspace == "All")

  FilteredCommbel$percent <- round(FilteredCommbel$percent, digits = 0)
  FilteredCommbel$X95upperCI <- round(FilteredCommbel$X95upperCI, digits = 1)
  FilteredCommbel$X95lowerCI <- round(FilteredCommbel$X95lowerCI, digits = 1)

  df <- data.frame(FilteredCommbel$year
                   , FilteredCommbel$communityBelonging
                   , FilteredCommbel$area
                   , FilteredCommbel$percent
                   , FilteredCommbel$X95lowerCI
                   , FilteredCommbel$X95upperCI)
  
  SHS_BC_Commbel <- rename(df, c("FilteredCommbel.year" = "Year"
                                       , "FilteredCommbel.percent" = "Percent"
                                       , "FilteredCommbel.communityBelonging" = "communityBelonging"
                                       , "FilteredCommbel.area" = "Area"
                                       , "FilteredCommbel.X95lowerCI" = "LowerConfidenceLimit"
                                       , "FilteredCommbel.X95upperCI" = "UpperConfidenceLimit"))
  
  SHS_BC_Commbel <- cbind(StatisticallySignificant = "None", SHS_BC_Commbel)
  
  levels(SHS_BC_Commbel$StatisticallySignificant) <- c("None", "Significantly Higher", "Significantly Lower", "No Significant Difference")

  SHS_BC_Commbel[which(SHS_BC_Commbel$LowerConfidenceLimit > SHS_BC_Scotland_Commbel()$X95upperCI), "StatisticallySignificant"] <- "Significantly Higher"
  
  SHS_BC_Commbel[which(SHS_BC_Commbel$UpperConfidenceLimit < SHS_BC_Scotland_Commbel()$X95lowerCI), "StatisticallySignificant"] <- "Significantly Lower"
  
  SHS_BC_Commbel[which(SHS_BC_Commbel$StatisticallySignificant == "None"), "StatisticallySignificant"] <- "No Significant Difference"
  
  SHS_BC_Commbel

})

# Question 2: Community Belonging - data processing for download

SHS_BC_Commbel_Download <- reactive({

  FilteredCommbelDownload <- UnfilteredCommbel %>% filter(communityBelonging ==
                                                            input$"BelongingBC"
                                                          & year == input$"DateCodeBCCommbel"
                                                          & area != "Scotland"
                                                          & gender == "All"
                                                          & urbanRuralClassification == "All"
                                                          & simdQuintiles == "All"
                                                          & typeOfTenure == "All"
                                                          & householdType == "All"
                                                          & ethnicity == "All"
                                                          & walkingDistanceToNearestGreenspace == "All")

  df <- data.frame(FilteredCommbelDownload$year
                   , FilteredCommbelDownload$communityBelonging
                   , FilteredCommbelDownload$percent
                   , FilteredCommbelDownload$area
                   , FilteredCommbelDownload$X95lowerCI
                   , FilteredCommbelDownload$X95upperCI)

  df <- rename(df, c("FilteredCommbelDownload.year" = "Year"
                     ,"FilteredCommbelDownload.communityBelonging" = "CommunityBelongingLevel"
                     , "FilteredCommbelDownload.percent" = "Percent"
                     , "FilteredCommbelDownload.area" = "GeographyCode"
                     , "FilteredCommbelDownload.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredCommbelDownload.X95upperCI" = "UpperConfidenceLimit"))
})

# Question 3: Area Improvement - data processing for chart

SHS_BC_Scotland_Arimp <- reactive ({

  Filtered_Scotland_Arimp <- UnfilteredArimp %>% filter(localNeighbourhoodImprovement == input$"ImprovementBC"
                                                  & year == input$"DateCodeBCArimp"
                                                  & area == "Scotland"
                                                  & gender == "All"
                                                  & urbanRuralClassification == "All"
                                                  & simdQuintiles == "All"
                                                  & typeOfTenure == "All"
                                                  & householdType == "All"
                                                  & ethnicity == "All"
                                                  & walkingDistanceToNearestGreenspace == "All")
  
  Filtered_Scotland_Arimp$percent <- round(Filtered_Scotland_Arimp$percent, digits = 0)
  Filtered_Scotland_Arimp$X95upperCI <- round(Filtered_Scotland_Arimp$X95upperCI, digits = 1)
  Filtered_Scotland_Arimp$X95lowerCI <- round(Filtered_Scotland_Arimp$X95lowerCI, digits = 1)
  
  Filtered_Scotland_Arimp
})

SHS_BC_Arimp <- reactive ({

  FilteredArimp <- UnfilteredArimp %>% filter(localNeighbourhoodImprovement == input$"ImprovementBC"
                                                  & year == input$"DateCodeBCArimp"
                                                  & area != "Scotland"
                                                  & gender == "All"
                                                  & urbanRuralClassification == "All"
                                                  & simdQuintiles == "All"
                                                  & typeOfTenure == "All"
                                                  & householdType == "All"
                                                  & ethnicity == "All"
                                                  & walkingDistanceToNearestGreenspace == "All")

  FilteredArimp$percent <- round(FilteredArimp$percent, digits = 0)
  FilteredArimp$X95upperCI <- round(FilteredArimp$X95upperCI, digits = 1)
  FilteredArimp$X95lowerCI <- round(FilteredArimp$X95lowerCI, digits = 1)

  df <- data.frame(FilteredArimp$year
                   , FilteredArimp$localNeighbourhoodImprovement
                   , FilteredArimp$area
                   , FilteredArimp$percent
                   , FilteredArimp$X95lowerCI
                   , FilteredArimp$X95upperCI)
  
  SHS_BC_Arimp <- rename(df, c("FilteredArimp.year" = "Year"
                                 , "FilteredArimp.percent" = "Percent"
                                 , "FilteredArimp.localNeighbourhoodImprovement" = "localNeighbourhoodImprovement"
                                 , "FilteredArimp.area" = "Area"
                                 , "FilteredArimp.X95lowerCI" = "LowerConfidenceLimit"
                                 , "FilteredArimp.X95upperCI" = "UpperConfidenceLimit"))

  SHS_BC_Arimp <- cbind(StatisticallySignificant = "None", SHS_BC_Arimp)
  
  levels(SHS_BC_Arimp$StatisticallySignificant) <- c("None", "Significantly Higher", "Significantly Lower", "No Significant Difference")

  SHS_BC_Arimp[which(SHS_BC_Arimp$LowerConfidenceLimit > SHS_BC_Scotland_Arimp()$X95upperCI), "StatisticallySignificant"] <- "Significantly Higher"
  
  SHS_BC_Arimp[which(SHS_BC_Arimp$UpperConfidenceLimit < SHS_BC_Scotland_Arimp()$X95lowerCI), "StatisticallySignificant"] <- "Significantly Lower"
  
  SHS_BC_Arimp[which(SHS_BC_Arimp$StatisticallySignificant == "None"), "StatisticallySignificant"] <- "No Significant Difference"
  
  SHS_BC_Arimp

})

# Question 3: Area Improvement - data processing for downloads

SHS_BC_Arimp_Download <- reactive({

  FilteredArimpDownload <- UnfilteredArimp %>% filter(localNeighbourhoodImprovement ==
                                                  input$"ImprovementBC"
                                                & year == input$"DateCodeBCNeighbourhood"
                                                & area != "Scotland"
                                                & gender == "All"
                                                & urbanRuralClassification == "All"
                                                & simdQuintiles == "All"
                                                & typeOfTenure == "All"
                                                & householdType == "All"
                                                & ethnicity == "All"
                                                & walkingDistanceToNearestGreenspace == "All")

  df <- data.frame(FilteredArimpDownload$year
                   , FilteredArimpDownload$localNeighbourhoodImprovement
                   , FilteredArimpDownload$percent
                   , FilteredArimpDownload$area
                   , FilteredArimpDownload$X95lowerCI
                   , FilteredArimpDownload$X95upperCI)

  df <- rename(df, c("FilteredArimpDownload.year" = "Year"
                     ,"FilteredArimpDownload.localNeighbourhoodImprovement" = "PerceptionOfLocalNeighbourhoodImprovement"
                     , "FilteredArimpDownload.percent" = "Percent"
                     , "FilteredArimpDownload.area" = "GeographyCode"
                     , "FilteredArimpDownload.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredArimpDownload.X95upperCI" = "UpperConfidenceLimit"))

})