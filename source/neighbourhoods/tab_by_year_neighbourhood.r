# 'Source' definition connects to 'UI'
tab_by_year_neighbourhoods <- tabPanel("Neighbourhoods by Year", value="neighbourhoodsByYearTab",
                                       
# MASTER QUESTION SELECTOR

# Selects an individual question from the 'Neighbourhoods' theme 
  selectInput("QuestionBCNeighbourhoodTheme",
                  "Topic:",
                  choices=c("Neighbourhood Rating", "Community Belonging", "Area Improvement")),


# INDIVIDUAL QUESTION CONTROLS AND DISPLAYS

# Creates the relevant sidebar controls and output on selection from "QuestionBCNeighbourhoodTheme" above 

# Question 1: Neighbourhood Rating

conditionalPanel(condition = "input.QuestionBCNeighbourhoodTheme == 'Neighbourhood Rating'",

  sidebarPanel(

# Explanatory text for selected question 
      tags$div(class="header", checked=NA,
             tags$p(),
             tags$p(strong("Respondent's rating of their neighbourhood as a place to live:")),
             tags$p()
             ),
  
      selectInput("DateCodeBCNeighbourhood",
                  "Year:",
                  choices=sort(DateCodeNeighbourhood, decreasing = TRUE)),
                    
      selectInput("NeighbourhoodRatingBC",
                  "Neighbourhood rating:",
                  choices= list("Very good", "Fairly good", "No opinion", "Fairly poor", "Very poor")),  
                    
        # Additional bar chart controls displayed only on condition 
        conditionalPanel(condition = "input.byYearTabNeighbourhood == 'Bar Chart'",
                       
           # CI, Scottish average, ordering and zoom selectors 
           checkboxInput("ConfidenceIntervalsBCNeighbourhood",
                         "Show Confidence Intervals",
                         value = TRUE,
                         width = NULL),
  
           checkboxInput("ScottishAverageBCNeighbourhood",
                         "Show Scottish Average",
                         value = FALSE,
                         width = NULL),
           
           selectInput("OrderBCNeighbourhood",
                       "Sort",
                       choices <- c("Alphabetical", "Ascending", "Descending")),
           
           radioButtons("zoomLevel_BCNeighbourhood",
                        "Y-axis zoom level: ",
                        selected = "Full scale",
                        choices = c("Full scale", "Zoom to data")),
           
           # Chart data download button  
           downloadButton("DownloadNeighbourhood", "Download Data", style=
                            "color: #fff; background-color: #008080")
           
# Experimental chart download buttons
# 1: Working Scot PHO method: 
    # downloadButton("DownloadNeighbourhoodChart", "Download Chart", style=
    #                       "color: #fff; background-color: #008080"),

# 2: Alternative method  
    # actionButton("openSaveButtonBC", "Save Chart",style=
    #              "color: #fff; background-color: #008080"),
    
    # shinyjs::hidden(fluidRow(id="saveSectionBC", 
    #              textInput("userFileNameBC", "Type a file name:", ""),
                  
    # actionButton("saveButtonBC", "Save",
    #             style="color: #fff; background-color: #008080")))

    )
  ),

# Main panel displays the selected chart or map 

mainPanel(tabsetPanel(id="byYearTabNeighbourhood",
tabPanel("Bar Chart",
 htmlOutput("byYearTitleNeighbourhood", container = tags$p, class = "by-Year-Title-Neighbourhood"),
 htmlOutput("byYearSubtitleNeighbourhood", container= tags$p, class = "by-Year-Subtitle-Neighbourhood"),

plotlyOutput("neighbourhoodBarChart")),


                      
tabPanel("Map",
 htmlOutput("byYearTitleMapNeighbourhood", container = tags$p, class = "by-Year-Title-Neighbourhood"),
 htmlOutput("byYearSubtitleMapNeighbourhood", container= tags$p, class = "by-Year-Subtitle-Neighbourhood"),

 leafletOutput("mapNeighbourhood"))

    )
  )
), 


# Question 2: Community Belonging

conditionalPanel(condition = "input.QuestionBCNeighbourhoodTheme == 'Community Belonging'",
                 
  sidebarPanel(
    
    # Explanatory text for selected question 
    tags$div(class="header", checked=NA,
             tags$p(),
             tags$p(strong("Respondent's strength of feeling of belonging to community:")),
             tags$p()
    ),
    
    
     selectInput("DateCodeBCCommbel",
                               "Year:",
                               choices=sort(DateCodeCommbel, decreasing = TRUE)),
     selectInput("BelongingBC",
                               "Sense of belonging:",
                               choices=list("Very strongly", "Fairly strongly", "Don't know",
                                            "Not very strongly", "Not at all strongly")),
    
     # Additional bar chart controls displayed only on condition 
     conditionalPanel(condition = "input.byYearTabCommbel == 'Bar Chart'",
                      
            # CI, Scottish average, ordering and zoom selectors 
            checkboxInput("ConfidenceIntervalsBCCommbel",
                          "Show Confidence Intervals",
                          value = TRUE,
                          width = NULL),
            
            checkboxInput("ScottishAverageBCCommbel",
                          "Show Scottish Average",
                          value = FALSE,
                          width = NULL),
            
            selectInput("OrderBCCommbel",
                        "Sort",
                        choices <- c("Alphabetical", "Ascending", "Descending")),
            
            radioButtons("zoomLevel_BCCommbel",
                         "Y-axis zoom level: ",
                         selected = "Full scale",
                         choices = c("Full scale", "Zoom to data")),
            
        # Chart data download button  
        downloadButton("DownloadCommbel", "Download Data", style="color: #fff; background-color: #008080") 
 )
  ),

# Main panel displays the selected chart or map 
  
mainPanel(tabsetPanel(id="byYearTabCommbel",
  tabPanel("Bar Chart",
      htmlOutput("byYearTitleCommbel", container = tags$p, class = "by-Year-Title-Belonging"),
      htmlOutput("byYearSubtitleCommbel", container= tags$p, class = "by-Year-Subtitle-Belonging"),
      
  plotlyOutput("barChartCommbel")),
                        
  tabPanel("Map",
       htmlOutput("byYearTitleMapCommbel", container = tags$p, class = "by-Year-Title-Belonging"),
       htmlOutput("byYearSubtitleMapCommbel", container= tags$p, class = "by-Year-Subtitle-Belonging"),

  leafletOutput("mapCommbel"))
  
    )
  )
),


# Question 3: Area Improvement 

conditionalPanel(condition = "input.QuestionBCNeighbourhoodTheme == 'Area Improvement'",
                 
                 sidebarPanel(
                   
                   # Explanatory text for selected question 
                   tags$div(class="header", checked=NA,
                            tags$p(),
                            tags$p(strong("Respondent's perception of neighbourhood improvements 
                                          in the past three years:")),
                            tags$p()
                   ),
                   
                   
                   selectInput("DateCodeBCArimp",
                               "Year:",
                               choices=sort(DateCodeArimp, decreasing = TRUE)),
                   selectInput("ImprovementBC",
                               "Change in neighbourhood:",
                               choices=list("Neighbourhood stayed the same", "Neighbourhood much better", 
                                            "Neighbourhood a little better", "Don't Know", 
                                            "Neighbourhood a little worse", "Neighbourhood much worse")),      

                   # Additional bar chart controls displayed only on condition 
                   conditionalPanel(condition = "input.byYearTabArimp == 'Bar Chart'",
                                    
                                    # CI, Scottish average, ordering and zoom selectors 
                                    checkboxInput("ConfidenceIntervalsBCArimp",
                                                  "Show Confidence Intervals",
                                                  value = TRUE,
                                                  width = NULL),
                                    
                                    checkboxInput("ScottishAverageBCArimp",
                                                  "Show Scottish Average",
                                                  value = FALSE,
                                                  width = NULL),
                                    
                                    selectInput("OrderBCArimp",
                                                "Sort",
                                                choices <- c("Alphabetical", "Ascending", "Descending")),
                                    
                                    radioButtons("zoomLevel_BCArimp",
                                                 "Y-axis zoom level: ",
                                                 selected = "Full scale",
                                                 choices = c("Full scale", "Zoom to data")), 
                                    
          # Chart data download button  
          downloadButton("DownloadArimp", "Download Data", style="color: #fff; background-color: #008080") 

                )
                 ),
                 
                 
# Main panel displays the selected chart or map                  
mainPanel(tabsetPanel(id="byYearTabArimp",
  tabPanel("Bar Chart",
      htmlOutput("byYearTitleArimp", container = tags$p, class = "by-Year-Title-Improvement"),
      htmlOutput("byYearSubtitleArimp", container= tags$p, class = "by-Year-Subtitle-Improvement"),

  plotlyOutput("barChartArimp")),
                     
 tabPanel("Map",
    htmlOutput("byYearTitleMapArimp", container = tags$p, class = "by-Year-Title-Improvement"),
    htmlOutput("byYearSubtitleMapArimp", container= tags$p, class = "by-Year-Subtitle-Improvement"),

  leafletOutput("mapArimp"))
                     
    )
  )
),



#---------------------------------- HELP SECTION --------------------------------------------------------

# Fixes position of the help panel
fixedRow(
  
column(12, offset = 4,
  
mainPanel(
  
div(class = "help-section",
    
    div(p(strong("Frequently Asked Questions"), class="control-label")),
    
    fluidRow(actionButton("ShowDataMeaningBCNeighbourhood", "What do the values in the charts represent?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "DataMeaningBCNeighbourhood", p(dataMeaningText))),
    
    fluidRow(actionButton("ShowZoomDetailsBCNeighbourhood", "How can I zoom in and out on the chart?", 
                          class="help-button")),
    shinyjs::hidden(div(class = "help-text", id = "ZoomInstructionsBCNeighbourhood", p(zoomInstructionText))),
    
    fluidRow(actionButton("ShowIsolateDataDetailsBCNeighbourhood", "How do I isolate individual rows?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "IsolateDataInstructionsBCNeighbourhood", 
                        p(graphInstructionText))),
    
    fluidRow(actionButton("ShowMissingDataDetailsBCNeighbourhood", "Why are some values missing?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "MissingDataTextBCNeighbourhood",p(missingDataMessage))),
    
    fluidRow(actionButton("ShowConfidenceIntervalsDetailsBCNeighbourhood", "What are confidence intervals?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "ConfidenceIntervalsTextBCNeighbourhood",
                        p(confidenceIntervalsText))),
    
    fluidRow(actionButton("ShowStatisticallySignificantTextBCNeighbourhood", 
                          "What does 'statistically significant' mean?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "StatisticallySignificantTextBCNeighbourhood",
                        p(statisticallySignificantText)))
  )))))



