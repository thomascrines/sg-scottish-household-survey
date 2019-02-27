# Question 1: Neighbourhood Rating - data processing for charts

SHS_LC_Neighbourhood <- reactive ({
  
  if(input$"VariableSelectLCNeighbourhood" == "Local Authorities") {
    
    FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area %in% c(input$"GeographyCodeLCMultipleNeighbourhood")
                                                                & neighbourhoodRating  == input$"NeighbourhoodRatingLC"
                                                                & gender == "All"
                                                                & urbanRuralClassification == "All"
                                                                & simdQuintiles == "All"
                                                                & typeOfTenure == "All"
                                                                & householdType == "All"
                                                                & ethnicity == "All"
                                                                & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredNeighbourhood$year
                     , FilteredNeighbourhood$percent
                     , FilteredNeighbourhood$neighbourhoodRating
                     , FilteredNeighbourhood$area
                     , FilteredNeighbourhood$X95upperCI
                     , FilteredNeighbourhood$X95lowerCI)
    
  } else if (input$"VariableSelectLCNeighbourhood" == "Gender") {

    FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                      & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                      & urbanRuralClassification == "All"
                                      & simdQuintiles == "All"
                                      & typeOfTenure == "All"
                                      & householdType == "All"
                                      & ethnicity == "All"
                                      & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredNeighbourhood$year
                     , FilteredNeighbourhood$neighbourhoodRating
                     , FilteredNeighbourhood$area
                     , FilteredNeighbourhood$percent
                     , FilteredNeighbourhood$X95upperCI
                     , FilteredNeighbourhood$X95lowerCI
                     , FilteredNeighbourhood$gender)

  } else if (input$"VariableSelectLCNeighbourhood" == "Urban Rural Classification") {

  FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                & gender == "All"
                                & simdQuintiles == "All"
                                & typeOfTenure == "All"
                                & householdType == "All"
                                & ethnicity == "All"
                                & walkingDistanceToNearestGreenspace == "All")

  df <- data.frame(FilteredNeighbourhood$year
                   , FilteredNeighbourhood$neighbourhoodRating
                   , FilteredNeighbourhood$area
                   , FilteredNeighbourhood$percent
                   , FilteredNeighbourhood$X95upperCI
                   , FilteredNeighbourhood$X95lowerCI
                   , FilteredNeighbourhood$urbanRuralClassification)

} else if (input$"VariableSelectLCNeighbourhood" == "SIMD Quintiles") {

  FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                              & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                              & gender == "All"
                              & urbanRuralClassification == "All"
                              & typeOfTenure == "All"
                              & householdType == "All"
                              & ethnicity == "All"
                              & walkingDistanceToNearestGreenspace == "All")

  df <- data.frame(FilteredNeighbourhood$year
                   , FilteredNeighbourhood$neighbourhoodRating
                   , FilteredNeighbourhood$area
                   , FilteredNeighbourhood$percent
                   , FilteredNeighbourhood$X95upperCI
                   , FilteredNeighbourhood$X95lowerCI
                   , FilteredNeighbourhood$simdQuintiles)

} else if (input$"VariableSelectLCNeighbourhood" == "Type of Tenure") {

  FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                & gender == "All"
                                & urbanRuralClassification == "All"
                                & simdQuintiles == "All"
                                & householdType == "All"
                                & ethnicity == "All"
                                & walkingDistanceToNearestGreenspace == "All")

  df <- data.frame(FilteredNeighbourhood$year
                   , FilteredNeighbourhood$neighbourhoodRating
                   , FilteredNeighbourhood$area
                   , FilteredNeighbourhood$percent
                   , FilteredNeighbourhood$X95upperCI
                   , FilteredNeighbourhood$X95lowerCI
                   , FilteredNeighbourhood$typeOfTenure)

} else if (input$"VariableSelectLCNeighbourhood" == "Household Type") {

  FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                              & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                              & gender == "All"
                              & urbanRuralClassification == "All"
                              & simdQuintiles == "All"
                              & typeOfTenure == "All"
                              & ethnicity == "All"
                              & walkingDistanceToNearestGreenspace == "All")

  df <- data.frame(FilteredNeighbourhood$year
                   , FilteredNeighbourhood$neighbourhoodRating
                   , FilteredNeighbourhood$area
                   , FilteredNeighbourhood$percent
                   , FilteredNeighbourhood$X95upperCI
                   , FilteredNeighbourhood$X95lowerCI
                   , FilteredNeighbourhood$householdType)

} else if (input$"VariableSelectLCNeighbourhood" == "Ethnicity") {

  FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                            & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                            & gender == "All"
                            & urbanRuralClassification == "All"
                            & simdQuintiles == "All"
                            & typeOfTenure == "All"
                            & householdType == "All"
                            & walkingDistanceToNearestGreenspace == "All")

  df <- data.frame(FilteredNeighbourhood$year
                   , FilteredNeighbourhood$neighbourhoodRating
                   , FilteredNeighbourhood$area
                   , FilteredNeighbourhood$percent
                   , FilteredNeighbourhood$X95upperCI
                   , FilteredNeighbourhood$X95lowerCI
                   , FilteredNeighbourhood$ethnicity)

} else if (input$"VariableSelectLCNeighbourhood" == "Walking distance to nearest greenspace") {

  FilteredNeighbourhood <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                          & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                          & gender == "All"
                          & urbanRuralClassification == "All"
                          & simdQuintiles == "All"
                          & typeOfTenure == "All"
                          & householdType == "All"
                          & ethnicity == "All")

  df <- data.frame(FilteredNeighbourhood$year
                   , FilteredNeighbourhood$neighbourhoodRating
                   , FilteredNeighbourhood$area
                   , FilteredNeighbourhood$percent
                   , FilteredNeighbourhood$X95upperCI
                   , FilteredNeighbourhood$X95lowerCI
                   , FilteredNeighbourhood$walkingDistanceToNearestGreenspace)
}
  
  df$FilteredNeighbourhood.percent <- round(df$FilteredNeighbourhood.percent, digits = 0)
  df$FilteredNeighbourhood.X95upperCI <- round(df$FilteredNeighbourhood.X95upperCI, digits = 1)
  df$FilteredNeighbourhood.X95lowerCI <- round(df$FilteredNeighbourhood.X95lowerCI, digits = 1)
  
  df <- rename(df, c("FilteredNeighbourhood.year" = "Year"
                     , "FilteredNeighbourhood.percent" = "Percent"
                     , "FilteredNeighbourhood.gender" = "Gender"
                     , "FilteredNeighbourhood.urbanRuralClassification" = "UrbanRuralClassification"
                     , "FilteredNeighbourhood.simdQuintiles" = "SIMDQuintiles"
                     , "FilteredNeighbourhood.typeOfTenure" = "TypeOfTenure"
                     , "FilteredNeighbourhood.householdType" = "HouseholdType"
                     , "FilteredNeighbourhood.ethnicity" = "Ethnicity" 
                     , "FilteredNeighbourhood.walkingDistanceToNearestGreenspace" = "Walkingdistancetonearestgreenspace"
                     , "FilteredNeighbourhood.neighbourhoodRating" = "Rating"
                     , "FilteredNeighbourhood.area" = "LocalAuthority"
                     , "FilteredNeighbourhood.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredNeighbourhood.X95upperCI" = "UpperConfidenceLimit"))
})

# Question 1: Neighbourhood Rating - data processing for download

SHS_LC_Neighbourhood_Download <- reactive ({

   if(input$"VariableSelectLCNeighbourhood" == "Local Authorities") {

FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area %in% c(input$"GeographyCodeLCMultipleNeighbourhood")
                                                                    & neighbourhoodRating  == input$"NeighbourhoodRatingLC"
                                                                    & gender == "All"
                                                                    & urbanRuralClassification == "All"
                                                                    & simdQuintiles == "All"
                                                                    & typeOfTenure == "All"
                                                                    & householdType == "All"
                                                                    & ethnicity == "All"
                                                                    & walkingDistanceToNearestGreenspace == "All")

df <- data.frame(FilteredNeighbourhoodDownload$year
                 , FilteredNeighbourhoodDownload$percent
                 , FilteredNeighbourhoodDownload$neighbourhoodRating
                 , FilteredNeighbourhoodDownload$area
                 , FilteredNeighbourhoodDownload$X95upperCI
                 , FilteredNeighbourhoodDownload$X95lowerCI)

  } else if (input$"VariableSelectLCNeighbourhood" == "Gender") {

    FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                                                        & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                                                        & urbanRuralClassification == "All"
                                                                        & simdQuintiles == "All"
                                                                        & typeOfTenure == "All"
                                                                        & householdType == "All"
                                                                        & ethnicity == "All"
                                                                        & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredNeighbourhoodDownload$year
                     , FilteredNeighbourhoodDownload$neighbourhoodRating
                     , FilteredNeighbourhoodDownload$area
                     , FilteredNeighbourhoodDownload$percent
                     , FilteredNeighbourhoodDownload$X95upperCI
                     , FilteredNeighbourhoodDownload$X95lowerCI
                     , FilteredNeighbourhoodDownload$gender)

  } else if (input$"VariableSelectLCNeighbourhood" == "Urban Rural Classification") {

    FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                                                        & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                                                        & gender == "All"
                                                                        & simdQuintiles == "All"
                                                                        & typeOfTenure == "All"
                                                                        & HouseholdType == "All"
                                                                        & ethnicity == "All"
                                                                        & walkingDistanceToNearestGreenspace == "All")
    
    df <- data.frame(FilteredNeighbourhoodDownload$year
                     , FilteredNeighbourhoodDownload$neighbourhoodRating
                     , FilteredNeighbourhoodDownload$area
                     , FilteredNeighbourhoodDownload$percent
                     , FilteredNeighbourhoodDownload$X95upperCI
                     , FilteredNeighbourhoodDownload$X95lowerCI
                     , FilteredNeighbourhoodDownload$urbanRuralClassification)

  } else if (input$"VariableSelectLCNeighbourhood" == "SIMD Quintiles") {

    FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                                                        & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                                                        & gender == "All"
                                                                        & urbanRuralClassification == "All"
                                                                        & typeOfTenure == "All"
                                                                        & householdType == "All"
                                                                        & ethnicity == "All"
                                                                        & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredNeighbourhoodDownload$year
                     , FilteredNeighbourhoodDownload$neighbourhoodRating
                     , FilteredNeighbourhoodDownload$area
                     , FilteredNeighbourhoodDownload$percent
                     , FilteredNeighbourhoodDownload$X95upperCI
                     , FilteredNeighbourhoodDownload$X95lowerCI
                     , FilteredNeighbourhoodDownload$simdQuintiles)
    
  } else if (input$"VariableSelectLCNeighbourhood" == "Type of Tenure") {

    FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                                                        & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                                                        & gender == "All"
                                                                        & urbanRuralClassification == "All"
                                                                        & simdQuintiles == "All"
                                                                        & householdType == "All"
                                                                        & ethnicity == "All"
                                                                        & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredNeighbourhoodDownload$year
                     , FilteredNeighbourhoodDownload$neighbourhoodRating
                     , FilteredNeighbourhoodDownload$area
                     , FilteredNeighbourhoodDownload$percent
                     , FilteredNeighbourhoodDownload$X95upperCI
                     , FilteredNeighbourhoodDownload$X95lowerCI
                     , FilteredNeighbourhoodDownload$typeOfTenure)

  } else if (input$"VariableSelectLCNeighbourhood" == "Household Type") {

    FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                                                        & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                                                        & gender == "All"
                                                                        & urbanRuralClassification == "All"
                                                                        & simdQuintiles == "All"
                                                                        & typeOfTenure == "All"
                                                                        & ethnicity == "All"
                                                                        & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredNeighbourhoodDownload$year
                     , FilteredNeighbourhoodDownload$neighbourhoodRating
                     , FilteredNeighbourhoodDownload$area
                     , FilteredNeighbourhoodDownload$percent
                     , FilteredNeighbourhoodDownload$X95upperCI
                     , FilteredNeighbourhoodDownload$X95lowerCI
                     , FilteredNeighbourhoodDownload$householdType)

  } else if (input$"VariableSelectLCNeighbourhood" == "Ethnicity") {

    FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                                                        & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                                                        & gender == "All"
                                                                        & urbanRuralClassification == "All"
                                                                        & simdQuintiles == "All"
                                                                        & typeOfTenure == "All"
                                                                        & householdType == "All"
                                                                        & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredNeighbourhoodDownload$year
                     , FilteredNeighbourhoodDownload$neighbourhoodRating
                     , FilteredNeighbourhoodDownload$area
                     , FilteredNeighbourhoodDownload$percent
                     , FilteredNeighbourhoodDownload$X95upperCI
                     , FilteredNeighbourhoodDownload$X95lowerCI
                     , FilteredNeighbourhoodDownload$ethnicity)

  } else if (input$"VariableSelectLCNeighbourhood" == "Walking distance to nearest greenspace") {

    FilteredNeighbourhoodDownload <- UnfilteredNeighbourhood %>% filter(area == input$"GeographyCodeLCSingleNeighbourhood"
                                                                        & neighbourhoodRating == input$"NeighbourhoodRatingLC"
                                                                        & gender == "All"
                                                                        & urbanRuralClassification == "All"
                                                                        & simdQuintiles == "All"
                                                                        & typeOfTenure == "All"
                                                                        & householdType == "All"
                                                                        & ethnicity == "All")

    df <- data.frame(FilteredNeighbourhoodDownload$year
                     , FilteredNeighbourhoodDownload$neighbourhoodRating
                     , FilteredNeighbourhoodDownload$area
                     , FilteredNeighbourhoodDownload$percent
                     , FilteredNeighbourhoodDownload$X95upperCI
                     , FilteredNeighbourhoodDownload$X95lowerCI
                     , FilteredNeighbourhoodDownload$walkingDistanceToNearestGreenspace)
  }

  df <- rename(df, c("FilteredNeighbourhoodDownload.year" = "Year"
                     , "FilteredNeighbourhoodDownload.percent" = "Percent"
                     , "FilteredNeighbourhoodDownload.gender" = "Gender"
                     , "FilteredNeighbourhoodDownload.urbanRuralClassification" = "UrbanRuralClassification"
                     , "FilteredNeighbourhoodDownload.simdQuintiles" = "SIMDQuintiles"
                     , "FilteredNeighbourhoodDownload.typeOfTenure" = "TypeOfTenure"
                     , "FilteredNeighbourhoodDownload.householdType" = "HouseholdType"
                     , "FilteredNeighbourhoodDownload.ethnicity" = "Ethnicity" 
                     , "FilteredNeighbourhoodDownload.walkingDistanceToNearestGreenspace" = "Walkingdistancetonearestgreenspace"
                     , "FilteredNeighbourhoodDownload.neighbourhoodRating" = "Rating"
                     , "FilteredNeighbourhoodDownload.area" = "LocalAuthority"
                     , "FilteredNeighbourhoodDownload.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredNeighbourhoodDownload.X95upperCI" = "UpperConfidenceLimit"))
})

# Question 2: Community Belonging - data processing for chart

SHS_LC_Commbel <- reactive ({

  if(input$"VariableSelectLCCommbel" == "Local Authorities") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area %in% c(input$"GeographyCodeLCMultipleCommbel")
                                                      & communityBelonging  == input$"BelongingLC"
                                                      & gender == "All"
                                                      & urbanRuralClassification == "All"
                                                      & simdQuintiles == "All"
                                                      & typeOfTenure == "All"
                                                      & householdType == "All"
                                                      & ethnicity == "All"
                                                      & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI)

  } else if (input$"VariableSelectLCCommbel" == "Gender") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area == input$"GeographyCodeLCSingleCommbel"
                                            & communityBelonging == input$"BelongingLC"
                                            & urbanRuralClassification == "All"
                                            & simdQuintiles == "All"
                                            & typeOfTenure == "All"
                                            & householdType == "All"
                                            & ethnicity == "All"
                                            & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI
                     , FilteredCommbel$gender)

  } else if (input$"VariableSelectLCCommbel" == "Urban Rural Classification") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area == input$"GeographyCodeLCSingleCommbel"
                                          & communityBelonging == input$"BelongingLC"
                                          & gender == "All"
                                          & simdQuintiles == "All"
                                          & typeOfTenure == "All"
                                          & householdType == "All"
                                          & ethnicity == "All"
                                          & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI
                     , FilteredCommbel$urbanRuralClassification)

  } else if (input$"VariableSelectLCCommbel" == "SIMD Quintiles") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area == input$"GeographyCodeLCSingleCommbel"
                              & communityBelonging == input$"BelongingLC"
                              & gender == "All"
                              & urbanRuralClassification == "All"
                              & typeOfTenure == "All"
                              & householdType == "All"
                              & ethnicity == "All"
                              & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI
                     , FilteredCommbel$simdQuintiles)

  } else if (input$"VariableSelectLCCommbel" == "Type of Tenure") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area == input$"GeographyCodeLCSingleCommbel"
                                            & communityBelonging == input$"BelongingLC"
                                            & gender == "All"
                                            & urbanRuralClassification == "All"
                                            & simdQuintiles == "All"
                                            & householdType == "All"
                                            & ethnicity == "All"
                                            & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI
                     , FilteredCommbel$typeOfTenure)

  } else if (input$"VariableSelectLCCommbel" == "Household Type") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area == input$"GeographyCodeLCSingleCommbel"
                                              & communityBelonging == input$"BelongingLC"
                                              & gender == "All"
                                              & urbanRuralClassification == "All"
                                              & simdQuintiles == "All"
                                              & typeOfTenure == "All"
                                              & ethnicity == "All"
                                              & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI
                     , FilteredCommbel$householdType)

  } else if (input$"VariableSelectLCCommbel" == "Ethnicity") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area == input$"GeographyCodeLCSingleCommbel"
                                              & communityBelonging == input$"BelongingLC"
                                              & gender == "All"
                                              & urbanRuralClassification == "All"
                                              & simdQuintiles == "All"
                                              & typeOfTenure == "All"
                                              & householdType == "All"
                                              & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI
                     , FilteredCommbel$ethnicity)

  } else if (input$"VariableSelectLCCommbel" == "Walking distance to nearest greenspace") {

    FilteredCommbel <- UnfilteredCommbel %>% filter(area == input$"GeographyCodeLCSingleCommbel"
                                                  & communityBelonging == input$"BelongingLC"
                                                  & gender == "All"
                                                  & urbanRuralClassification == "All"
                                                  & simdQuintiles == "All"
                                                  & typeOfTenure == "All"
                                                  & householdType == "All"
                                                  & ethnicity == "All")

    df <- data.frame(FilteredCommbel$year
                     , FilteredCommbel$communityBelonging
                     , FilteredCommbel$area
                     , FilteredCommbel$percent
                     , FilteredCommbel$X95lowerCI
                     , FilteredCommbel$X95upperCI
                     , FilteredCommbel$walkingDistanceToNearestGreenspace)
  }
  
  df$FilteredCommbel.percent <- round(df$FilteredCommbel.percent, digits = 0)
  df$FilteredCommbel.X95upperCI <- round(df$FilteredCommbel.X95upperCI, digits = 1)
  df$FilteredCommbel.X95lowerCI <- round(df$FilteredCommbel.X95lowerCI, digits = 1)

  df <- rename(df, c("FilteredCommbel.year" = "Year"
                     , "FilteredCommbel.gender" = "Gender"
                     , "FilteredCommbel.urbanRuralClassification" = "UrbanRuralClassification"
                     , "FilteredCommbel.simdQuintiles" = "SIMDQuintiles"
                     , "FilteredCommbel.typeOfTenure" = "TypeOfTenure"
                     , "FilteredCommbel.householdType" = "HouseholdType"
                     , "FilteredCommbel.ethnicity" = "Ethnicity"
                     , "FilteredCommbel.walkingDistanceToNearestGreenspace" =
                       "Walkingdistancetonearestgreenspace"
                     , "FilteredCommbel.communityBelonging" = "Belonging"
                     , "FilteredCommbel.area" = "LocalAuthority"
                     , "FilteredCommbel.percent" = "Percent"
                     , "FilteredCommbel.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredCommbel.X95upperCI" = "UpperConfidenceLimit"))
})

# Question 2: Community Belonging - data processing for download

SHS_LC_Commbel_Download <- reactive ({

  if(input$"VariableSelectLCCommbel" == "Local Authorities") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area %in%
                                                    c(input$"GeographyCodeLCMultipleCommbel")
                                                    & communityBelonging  == input$"BelongingLC"
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

  } else if (input$"VariableSelectLCCommbel" == "Gender") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area ==
                                      input$"GeographyCodeLCSingleCommbel"
                                      & communityBelonging == input$"BelongingLC"
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
                     , FilteredCommbelDownload$X95upperCI
                     , FilteredCommbelDownload$gender)

  } else if (input$"VariableSelectLCCommbel" == "Urban Rural Classification") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area ==
                                                    input$"GeographyCodeLCSingleCommbel"
                                                    & communityBelonging == input$"BelongingLC"
                                                    & gender == "All"
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
                     , FilteredCommbelDownload$X95upperCI
                     , FilteredCommbelDownload$urbanRuralClassification)

  } else if (input$"VariableSelectLCCommbel" == "SIMD Quintiles") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area ==
                                                    input$"GeographyCodeLCSingleCommbel"
                                                    & communityBelonging == input$"BelongingLC"
                                                    & gender == "All"
                                                    & urbanRuralClassification == "All"
                                                    & typeOfTenure == "All"
                                                    & householdType == "All"
                                                    & ethnicity == "All"
                                                    & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbelDownload$year
                     , FilteredCommbelDownload$communityBelonging
                     , FilteredCommbelDownload$percent
                     , FilteredCommbelDownload$area
                     , FilteredCommbelDownload$X95lowerCI
                     , FilteredCommbelDownload$X95upperCI
                     , FilteredCommbelDownload$simdQuintiles)

  } else if (input$"VariableSelectLCCommbel" == "Type of Tenure") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area ==
                                                    input$"GeographyCodeLCSingleCommbel"
                                                    & communityBelonging == input$"BelongingLC"
                                                    & gender == "All"
                                                    & urbanRuralClassification == "All"
                                                    & simdQuintiles == "All"
                                                    & householdType == "All"
                                                    & ethnicity == "All"
                                                    & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbelDownload$year
                     , FilteredCommbelDownload$communityBelonging
                     , FilteredCommbelDownload$percent
                     , FilteredCommbelDownload$area
                     , FilteredCommbelDownload$X95lowerCI
                     , FilteredCommbelDownload$X95upperCI
                     , FilteredCommbelDownload$typeOfTenure)

  } else if (input$"VariableSelectLCCommbel" == "Household Type") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area ==
                                                    input$"GeographyCodeLCSingleCommbel"
                                                    & communityBelonging == input$"BelongingLC"
                                                    & gender == "All"
                                                    & urbanRuralClassification == "All"
                                                    & simdQuintiles == "All"
                                                    & typeOfTenure == "All"
                                                    & ethnicity == "All"
                                                    & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbelDownload$year
                     , FilteredCommbelDownload$communityBelonging
                     , FilteredCommbelDownload$percent
                     , FilteredCommbelDownload$area
                     , FilteredCommbelDownload$X95lowerCI
                     , FilteredCommbelDownload$X95upperCI
                     , FilteredCommbelDownload$householdType)

  } else if (input$"VariableSelectLCCommbel" == "Ethnicity") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area ==
                                                    input$"GeographyCodeLCSingleCommbel"
                                                    & communityBelonging == input$"BelongingLC"
                                                    & gender == "All"
                                                    & urbanRuralClassification == "All"
                                                    & simdQuintiles == "All"
                                                    & typeOfTenure == "All"
                                                    & householdType == "All"
                                                    & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredCommbelDownload$year
                     , FilteredCommbelDownload$communityBelonging
                     , FilteredCommbelDownload$percent
                     , FilteredCommbelDownload$area
                     , FilteredCommbelDownload$X95lowerCI
                     , FilteredCommbelDownload$X95upperCI
                     , FilteredCommbelDownload$ethnicity)

  } else if (input$"VariableSelectLCCommbel" == "Walking distance to nearest greenspace") {

    FilteredCommbelDownload <- UnfilteredCommbel %>% filter(area ==
                                                    input$"GeographyCodeLCSingleCommbel"
                                                    & communityBelonging == input$"BelongingLC"
                                                    & gender == "All"
                                                    & urbanRuralClassification == "All"
                                                    & simdQuintiles == "All"
                                                    & typeOfTenure == "All"
                                                    & householdType == "All"
                                                    & ethnicity == "All")

    df <- data.frame(FilteredCommbelDownload$year
                     , FilteredCommbelDownload$communityBelonging
                     , FilteredCommbelDownload$percent
                     , FilteredCommbelDownload$area
                     , FilteredCommbelDownload$X95lowerCI
                     , FilteredCommbelDownload$X95upperCI
                     , FilteredCommbelDownload$walkingDistanceToNearestGreenspace)
  }

  df <- rename(df, c("FilteredCommbelDownload.year" = "Year"
                     , "FilteredCommbelDownload.gender" = "Gender"
                     , "FilteredCommbelDownload.urbanRuralClassification" = "UrbanRuralClassification"
                     , "FilteredCommbelDownload.simdQuintiles" = "SIMDQuintiles"
                     , "FilteredCommbelDownload.typeOfTenure" = "TypeOfTenure"
                     , "FilteredCommbelDownload.householdType" = "HouseholdType"
                     , "FilteredCommbelDownload.ethnicity" = "Ethnicity"
                     , "FilteredCommbelDownload.walkingDistanceToNearestGreenspace" =
                       "WalkingDistanceToNearestGreenspace"
                     , "FilteredCommbelDownload.communityBelonging" = "CommunityBelongingLevel"
                     , "FilteredCommbelDownload.area" = "LocalAuthority"
                     , "FilteredCommbelDownload.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredCommbelDownload.X95upperCI" = "UpperConfidenceLimit"
                     , "FilteredCommbelDownload.percent" = "Percent"))
})

# Question 3: Area Improvement - data processing for charts

SHS_LC_Arimp <- reactive ({

  if(input$"VariableSelectLCArimp" == "Local Authorities") {

    FilteredArimp <- UnfilteredArimp %>% filter(area %in%
                                  c(input$"GeographyCodeLCMultipleArimp")
                                  & localNeighbourhoodImprovement  == input$"ImprovementLC"
                                  & gender == "All"
                                  & urbanRuralClassification == "All"
                                  & simdQuintiles == "All"
                                  & typeOfTenure == "All"
                                  & householdType == "All"
                                  & ethnicity == "All"
                                  & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI)

  } else if (input$"VariableSelectLCArimp" == "Gender") {

    FilteredArimp <- UnfilteredArimp %>% filter(area == input$"GeographyCodeLCSingleArimp"
                                        & localNeighbourhoodImprovement == input$"ImprovementLC"
                                        & urbanRuralClassification == "All"
                                        & simdQuintiles == "All"
                                        & typeOfTenure == "All"
                                        & householdType == "All"
                                        & ethnicity == "All"
                                        & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI
                     , FilteredArimp$gender)

  } else if (input$"VariableSelectLCArimp" == "Urban Rural Classification") {

    FilteredArimp <- UnfilteredArimp %>% filter(area == input$"GeographyCodeLCSingleArimp"
                                      & localNeighbourhoodImprovement == input$"ImprovementLC"
                                      & gender == "All"
                                      & simdQuintiles == "All"
                                      & typeOfTenure == "All"
                                      & householdType == "All"
                                      & ethnicity == "All"
                                      & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI
                     , FilteredArimp$urbanRuralClassification)

  } else if (input$"VariableSelectLCArimp" == "SIMD Quintiles") {

    FilteredArimp <- UnfilteredArimp %>% filter(area == input$"GeographyCodeLCSingleArimp"
                                        & localNeighbourhoodImprovement == input$"ImprovementLC"
                                        & gender == "All"
                                        & urbanRuralClassification == "All"
                                        & typeOfTenure == "All"
                                        & householdType == "All"
                                        & ethnicity == "All"
                                        & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI
                     , FilteredArimp$simdQuintiles)

  } else if (input$"VariableSelectLCArimp" == "Type of Tenure") {

    FilteredArimp <- UnfilteredArimp %>% filter(area == input$"GeographyCodeLCSingleArimp"
                                & localNeighbourhoodImprovement == input$"ImprovementLC"
                                & gender == "All"
                                & urbanRuralClassification == "All"
                                & simdQuintiles == "All"
                                & householdType == "All"
                                & ethnicity == "All"
                                & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI
                     , FilteredArimp$typeOfTenure)

  } else if (input$"VariableSelectLCArimp" == "Household Type") {

    FilteredArimp <- UnfilteredArimp %>% filter(area == input$"GeographyCodeLCSingleArimp"
                                       & localNeighbourhoodImprovement == input$"ImprovementLC"
                                       & gender == "All"
                                       & urbanRuralClassification == "All"
                                       & simdQuintiles == "All"
                                       & typeOfTenure == "All"
                                       & ethnicity == "All"
                                       & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI
                     , FilteredArimp$householdType)

  } else if (input$"VariableSelectLCArimp" == "Ethnicity") {

    FilteredArimp <- UnfilteredArimp %>% filter(area == input$"GeographyCodeLCSingleArimp"
                                      & localNeighbourhoodImprovement == input$"ImprovementLC"
                                      & gender == "All"
                                      & urbanRuralClassification == "All"
                                      & simdQuintiles == "All"
                                      & typeOfTenure == "All"
                                      & householdType == "All"
                                      & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI
                     , FilteredArimp$ethnicity)

  } else if (input$"VariableSelectLCArimp" == "Walking distance to nearest greenspace") {

    FilteredArimp <- UnfilteredArimp %>% filter(area == input$"GeographyCodeLCSingleArimp"
                                        & localNeighbourhoodImprovement == input$"ImprovementLC"
                                        & gender == "All"
                                        & urbanRuralClassification == "All"
                                        & simdQuintiles == "All"
                                        & typeOfTenure == "All"
                                        & householdType == "All"
                                        & ethnicity == "All")

    df <- data.frame(FilteredArimp$year
                     , FilteredArimp$localNeighbourhoodImprovement
                     , FilteredArimp$area
                     , FilteredArimp$percent
                     , FilteredArimp$X95lowerCI
                     , FilteredArimp$X95upperCI
                     , FilteredArimp$walkingDistanceToNearestGreenspace)
  }
  
  df$FilteredArimp.percent <- round(df$FilteredArimp.percent, digits = 0)
  df$FilteredArimp.X95upperCI <- round(df$FilteredArimp.X95upperCI, digits = 1)
  df$FilteredArimp.X95lowerCI <- round(df$FilteredArimp.X95lowerCI, digits = 1)

  df <- rename(df, c("FilteredArimp.year" = "Year"
                     , "FilteredArimp.gender" = "Gender"
                     , "FilteredArimp.urbanRuralClassification" = "UrbanRuralClassification"
                     , "FilteredArimp.simdQuintiles" = "SIMDQuintiles"
                     , "FilteredArimp.typeOfTenure" = "TypeOfTenure"
                     , "FilteredArimp.householdType" = "HouseholdType"
                     , "FilteredArimp.ethnicity" = "Ethnicity"
                     , "FilteredArimp.walkingDistanceToNearestGreenspace" ="Walkingdistancetonearestgreenspace"
                     , "FilteredArimp.localNeighbourhoodImprovement" = "Improvement"
                     , "FilteredArimp.area" = "LocalAuthority"
                     , "FilteredArimp.percent" = "Percent"
                     , "FilteredArimp.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredArimp.X95upperCI" = "UpperConfidenceLimit"))
})

# Question 3: Area Improvement - data processing for download

SHS_LC_Arimp_Download <- reactive ({

  if(input$"VariableSelectLCArimp" == "Local Authorities") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area %in%
                                  c(input$"GeographyCodeLCMultipleArimp")
                                  & localNeighbourhoodImprovement  == input$"ImprovementLC"
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

  } else if (input$"VariableSelectLCArimp" == "Gender") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area ==
                                      input$"GeographyCodeLCSingleArimp"
                                      & localNeighbourhoodImprovement == input$"ImprovementLC"
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
                     , FilteredArimpDownload$X95upperCI
                     , FilteredArimpDownload$gender)

  } else if (input$"VariableSelectLCArimp" == "Urban Rural Classification") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area ==
                                    input$"GeographyCodeLCSingleArimp"
                                    & localNeighbourhoodImprovement == input$"ImprovementLC"
                                    & gender == "All"
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
                     , FilteredArimpDownload$X95upperCI
                     , FilteredArimpDownload$urbanRuralClassification)

  } else if (input$"VariableSelectLCArimp" == "SIMD Quintiles") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area ==
                                      input$"GeographyCodeLCSingleArimp"
                                      & localNeighbourhoodImprovement == input$"ImprovementLC"
                                      & gender == "All"
                                      & urbanRuralClassification == "All"
                                      & typeOfTenure == "All"
                                      & householdType == "All"
                                      & ethnicity == "All"
                                      & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimpDownload$year
                     , FilteredArimpDownload$localNeighbourhoodImprovement
                     , FilteredArimpDownload$percent
                     , FilteredArimpDownload$area
                     , FilteredArimpDownload$X95lowerCI
                     , FilteredArimpDownload$X95upperCI
                     , FilteredArimpDownload$simdQuintiles)

  } else if (input$"VariableSelectLCArimp" == "Type of Tenure") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area ==
                                          input$"GeographyCodeLCSingleArimp"
                                          & localNeighbourhoodImprovement == input$"ImprovementLC"
                                          & gender == "All"
                                          & urbanRuralClassification == "All"
                                          & simdQuintiles == "All"
                                          & householdType == "All"
                                          & ethnicity == "All"
                                          & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimpDownload$year
                     , FilteredArimpDownload$localNeighbourhoodImprovement
                     , FilteredArimpDownload$percent
                     , FilteredArimpDownload$area
                     , FilteredArimpDownload$X95lowerCI
                     , FilteredArimpDownload$X95upperCI
                     , FilteredArimpDownload$typeOfTenure)

  } else if (input$"VariableSelectLCArimp" == "Household Type") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area ==
                                    input$"GeographyCodeLCSingleArimp"
                                    & localNeighbourhoodImprovement == input$"ImprovementLC"
                                    & gender == "All"
                                    & urbanRuralClassification == "All"
                                    & simdQuintiles == "All"
                                    & typeOfTenure == "All"
                                    & ethnicity == "All"
                                    & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimpDownload$year
                     , FilteredArimpDownload$localNeighbourhoodImprovement
                     , FilteredArimpDownload$percent
                     , FilteredArimpDownload$area
                     , FilteredArimpDownload$X95lowerCI
                     , FilteredArimpDownload$X95upperCI
                     , FilteredArimpDownload$householdType)

  } else if (input$"VariableSelectLCArimp" == "Ethnicity") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area ==
                            input$"GeographyCodeLCSingleArimp"
                            & localNeighbourhoodImprovement == input$"ImprovementLC"
                            & gender == "All"
                            & urbanRuralClassification == "All"
                            & simdQuintiles == "All"
                            & typeOfTenure == "All"
                            & householdType == "All"
                            & walkingDistanceToNearestGreenspace == "All")

    df <- data.frame(FilteredArimpDownload$year
                     , FilteredArimpDownload$localNeighbourhoodImprovement
                     , FilteredArimpDownload$percent
                     , FilteredArimpDownload$area
                     , FilteredArimpDownload$X95lowerCI
                     , FilteredArimpDownload$X95upperCI
                     , FilteredArimpDownload$ethnicity)

  } else if (input$"VariableSelectLCArimp" == "Walking distance to nearest greenspace") {

    FilteredArimpDownload <- UnfilteredArimp %>% filter(area ==
                                    input$"GeographyCodeLCSingleArimp"
                                    & localNeighbourhoodImprovement == input$"ImprovementLC"
                                    & gender == "All"
                                    & urbanRuralClassification == "All"
                                    & simdQuintiles == "All"
                                    & typeOfTenure == "All"
                                    & householdType == "All"
                                    & ethnicity == "All")

    df <- data.frame(FilteredArimpDownload$year
                     , FilteredArimpDownload$localNeighbourhoodImprovement
                     , FilteredArimpDownload$percent
                     , FilteredArimpDownload$area
                     , FilteredArimpDownload$X95lowerCI
                     , FilteredArimpDownload$X95upperCI
                     , FilteredArimpDownload$walkingDistanceToNearestGreenspace)
  }

  df <- rename(df, c("FilteredArimpDownload.year" = "Year"
                     , "FilteredArimpDownload.gender" = "Gender"
                     , "FilteredArimpDownload.urbanRuralClassification" = "UrbanRuralClassification"
                     , "FilteredArimpDownload.simdQuintiles" = "SIMDQuintiles"
                     , "FilteredArimpDownload.typeOfTenure" = "TypeOfTenure"
                     , "FilteredArimpDownload.householdType" = "HouseholdType"
                     , "FilteredArimpDownload.ethnicity" = "Ethnicity"
                     , "FilteredArimpDownload.walkingDistanceToNearestGreenspace" = "WalkingDistanceToNearestGreenspace"
                     , "FilteredArimpDownload.localNeighbourhoodImprovement" = "PerceptionOfLocalNeighbourhoodImprovement"
                     , "FilteredArimpDownload.area" = "LocalAuthority"
                     , "FilteredArimpDownload.X95lowerCI" = "LowerConfidenceLimit"
                     , "FilteredArimpDownload.X95upperCI" = "UpperConfidenceLimit"
                     , "FilteredArimpDownload.percent" = "Percent"))
  })