# 'Source' definition connects to 'UI'
tab_time_series <- tabPanel("Neighbourhoods Time Series", value= "neighbourhoodsTimeSeriesTab",
                            
# MASTER QUESTION SELECTOR

# Selects an individual question from the 'Neighbourhoods' theme 
selectInput("QuestionLCNeighbourhoodTheme",
            "Topic:",
            choices=c("Neighbourhood Rating", "Community Belonging", "Area Improvement")),

# INDIVIDUAL QUESTION CONTROLS AND DISPLAYS

# Creates the relevant sidebar controls and output on selection from "QuestionLCNeighbourhoodTheme" above 

# Question 1: Neighbourhood Rating 
conditionalPanel(condition = "input.QuestionLCNeighbourhoodTheme == 'Neighbourhood Rating'",
                            
# Tab sidebar with input selector                      
    sidebarPanel(
      
# Explanatory text for selected question
      tags$div(class="header", checked=NA,
               tags$p(),
               tags$p(strong("Respondent's rating of their neighbourhood as a place to live:")),
               tags$p()
      ),
         
# Grouping variable selector                      
        radioButtons("VariableSelectLCNeighbourhood",
        "Select a variable: ",
         selected = "Local Authorities",
         choices = c("Local Authorities","Gender", "Urban Rural Classification", 
                     "SIMD Quintiles", "Type of Tenure","Household Type", 
                      "Ethnicity", "Walking distance to nearest greenspace")),

# Conditional inputs (LA or LA by other grouping variable) and neighbourhood rating selectors 

        selectInput("NeighbourhoodRatingLC",
                     "Neighbourhood rating:",
                     choices = list("Very good", "Fairly good", "No opinion", "Fairly poor", "Very poor"),
                     multiple = FALSE),

# "Very good", "Fairly good", "No opinion", "Fairly poor", "Very poor"

        conditionalPanel(condition = "input.VariableSelectLCNeighbourhood == 'Local Authorities'",
                         
# Limits multiple choices to the 8 colours available in the 'timeSeriesColours' palette 

selectizeInput("GeographyCodeLCMultipleNeighbourhood",
                        "Local Authority:",
                        choices=GeographyCode,
                        selected = "Scotland",
                        multiple = TRUE, 
                        options = list(maxItems = 8)),
                                               
            actionButton("clearSelectedNeighbourhood", "Clear Selected",
              style="color: #fff; background-color: #008080")),

        conditionalPanel(condition = "input.VariableSelectLCNeighbourhood != 
                                           'Local Authorities'",
                                               
            selectInput("GeographyCodeLCSingleNeighbourhood",
                         "Local Authority:",
                         choices=GeographyCode,
                         selected = "Scotland",
                         multiple = FALSE)),

# CI  and zoom selectors 
                              
        checkboxInput("ConfidenceIntervalsLCNeighbourhood",
                       "Show Confidence Intervals",
                        value = TRUE,
                        width = NULL),
                              
        radioButtons("zoomLevel_LCNeighbourhood",
                     "Y-axis zoom level: ",
                      selected = "Full scale",
                      choices = c("Full scale", "Zoom to data")),

        downloadButton("DownloadNeighbourhoodLC", "Download Data", style=
                         "color: #fff; background-color: #008080") 
                              
                              
                            ),

# Tab main data window with chart and map subtabs and text                           
  mainPanel(
      plotlyOutput("lineChartNeighbourhood")
      
# End main panel
)

# End conditional panel  
),  

# Question 2: Community Belonging 
conditionalPanel(condition = "input.QuestionLCNeighbourhoodTheme == 'Community Belonging'",
                 
                 
     
     # Tab sidebar with input selector                      
     sidebarPanel(
       
       # Explanatory text for selected question 
       tags$div(class="header", checked=NA,
                tags$p(),
                tags$p(strong("Respondent's strength of feeling of belonging to community:")),
                tags$p()
       ),
       
       # Grouping variable selector                      
       radioButtons("VariableSelectLCCommbel",
                    "Select a variable: ",
                    selected = "Local Authorities",
                    choices = c("Local Authorities","Gender", "Urban Rural Classification", 
                                "SIMD Quintiles", "Type of Tenure","Household Type", 
                                "Ethnicity", "Walking distance to nearest greenspace")),
       
       # Conditional inputs (LA or LA by other grouping variable) and neighbourhood rating selectors  
       selectInput("BelongingLC",
                   "Sense of belonging:",
                   choices = list("Very strongly", "Fairly strongly", "Don't know",
                                  "Not very strongly", "Not at all strongly"),
                   multiple = FALSE),
       
       conditionalPanel(condition = "input.VariableSelectLCCommbel == 'Local Authorities'",
                        
      # Limits multiple choices to the 8 colours available in the 'timeSeriesColours' palette  
                        selectizeInput("GeographyCodeLCMultipleCommbel",
                                    "Local Authority:",
                                    choices=GeographyCode,
                                    selected = "Scotland",
                                    multiple = TRUE,
                                    options=list(maxItems=8)
                                    ),
                        
                        actionButton("clearSelectedCommbel", "Clear Selected",
                                     style="color: #fff; background-color: #008080")),
       
       conditionalPanel(condition = "input.VariableSelectLCCommbel != 
                        'Local Authorities'",
                        
                        selectInput("GeographyCodeLCSingleCommbel",
                                    "Local Authority:",
                                    choices=GeographyCode,
                                    selected = "Scotland",
                                    multiple = FALSE)),
                   
                   # CI  and zoom selectors 
                   
                   checkboxInput("ConfidenceIntervalsLCCommbel",
                                 "Show Confidence Intervals",
                                 value = TRUE,
                                 width = NULL),
                   
                   radioButtons("zoomLevel_LCCommbel",
                                "Y-axis zoom level: ",
                                selected = "Full scale",
                                choices = c("Full scale", "Zoom to data")),
                   
 # Chart data download button  
 downloadButton("DownloadCommbelLC", "Download Data", style="color: #fff; background-color: #008080") 
 
                   
                 ),
                 
                 # Tab main data window with chart and map subtabs and text                           
                 mainPanel(
                   plotlyOutput("lineChartCommbel")
                   
                 )),

# Question 3: Neighbourhood Improvement  
conditionalPanel(condition = "input.QuestionLCNeighbourhoodTheme == 'Area Improvement'",
                 
                 
 
 # Tab sidebar with input selector                      
 sidebarPanel(
   
   # Explanatory text for selected question 
   tags$div(class="header", checked=NA,
      tags$p(),
      tags$p(strong("Respondent's perception of neighbourhood improvements in the past three years:")),
      tags$p()
   ),
   
                   # Grouping variable selector                      
                   radioButtons("VariableSelectLCArimp",
                                "Select a variable: ",
                                selected = "Local Authorities",
                                choices = c("Local Authorities","Gender", "Urban Rural Classification", 
                                            "SIMD Quintiles", "Type of Tenure","Household Type", 
                                            "Ethnicity", "Walking distance to nearest greenspace")),
                   
       # Conditional inputs (LA or LA by other grouping variable) and neighbourhood rating selectors  
       selectInput("ImprovementLC",
                   "Change in neighbourhood:",
                   choices = list("Neighbourhood stayed the same", "Neighbourhood much better", 
                                  "Neighbourhood a little better", "Don't Know", 
                                  "Neighbourhood a little worse", "Neighbourhood much worse"),
                   multiple = FALSE),
                   
                   conditionalPanel(condition = "input.VariableSelectLCArimp == 'Local Authorities'",
                      
                  # Limits multiple choices to the 8 colours available in the 'timeSeriesColours' palette               
                                
                  selectizeInput("GeographyCodeLCMultipleArimp",
                              "Local Authority:",
                              choices=GeographyCode,
                              selected = "Scotland",
                              multiple = TRUE, 
                              options=list(maxItems=8)),
                  
                  actionButton("clearSelectedArimp", "Clear Selected",
                               style="color: #fff; background-color: #008080")),
                   
                   conditionalPanel(condition = "input.VariableSelectLCArimp != 
                                    'Local Authorities'",
                                    
                                    selectInput("GeographyCodeLCSingleArimp",
                                                "Local Authority:",
                                                choices=GeographyCode,
                                                selected = "Scotland",
                                                multiple = FALSE)),
                   
                   # CI  and zoom selectors 
                   
                   checkboxInput("ConfidenceIntervalsLCArimp",
                                 "Show Confidence Intervals",
                                 value = TRUE,
                                 width = NULL),
                   
                   radioButtons("zoomLevel_LCArimp",
                                "Y-axis zoom level: ",
                                selected = "Full scale",
                                choices = c("Full scale", "Zoom to data")),
                   
 # Chart data download button  
 downloadButton("DownloadArimpLC", "Download Data", style="color: #fff; background-color: #008080") 
 
                   
                 ),
                 
                 # Tab main data window with chart and map subtabs and text                           
                 mainPanel(
                   plotlyOutput("lineChartArimp")
                   
                 )
                 
                 
                 ), 

# Help text section (self contained (...)
mainPanel(div(class = "help-section",
              
    div(p(strong("Frequently Asked Questions"), class="control-label")),
    
    fluidRow(actionButton("ShowDataMeaningLCNeighbourhood", "How are the values collected?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "DataMeaningLCNeighbourhood", 
                        p(paste(dataMeaningText)))),
    
    fluidRow(actionButton("ShowZoomDetailsLCNeighbourhood", "How can I zoom in and out on the chart?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "ZoomInstructionsLCNeighbourhood", 
                        p(zoomInstructionText))),
    
    fluidRow(actionButton("ShowIsolateDataDetailsLCNeighbourhood", "How do I isolate individual rows?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "IsolateDataInstructionsLCNeighbourhood", 
                        p(graphInstructionText))),
    
    fluidRow(actionButton("ShowMissingDataDetailsLCNeighbourhood", "Why are some values missing?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "MissingDataTextLCNeighbourhood",
                        p(missingDataMessage))),
    
    fluidRow(actionButton("ShowConfidenceIntervalsDetailsLCNeighbourhood", 
                          "What do confidence intervals mean?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "ConfidenceIntervalsTextLCNeighbourhood",
                        p(confidenceIntervalsText))),
    
    fluidRow(actionButton("ShowStatisticallySignificantTextLCNeighbourhood", 
                          "What does 'statistically significant' mean?", 
                          class="help-button", style="background-color: transparent")),
    shinyjs::hidden(div(class = "help-text", id = "StatisticallySignificantTextLCNeighbourhood",
                        p(statisticallySignificantText))))

)


)
