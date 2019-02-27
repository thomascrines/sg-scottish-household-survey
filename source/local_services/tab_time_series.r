tab_time_series <- tabPanel("Local Services Time Series", value = "TimeSeriesTab",
                            
                            
                            sidebarPanel(
                              
                              radioButtons("VariableSelectLC",
                                           "Select a variable: ",
                                           selected = "Local Authorities",
                                           choices = c("Local Authorities","Age", "Gender", "Urban Rural Classification", "SIMD Quintiles")),
                              
                              selectInput("LocalAuthorityServicesAndPerformanceLC",
                                          "Statement:",
                                          choices=LocalAuthorityServicesAndPerformance),
                              
                              conditionalPanel(condition = "input.VariableSelectLC == 'Local Authorities'",
                                               
                                               selectizeInput("FeatureCodeLCMultiple",
                                                           "Local Authority:",
                                                           choices=FeatureCode,
                                                           selected = "Scotland",
                                                           multiple = TRUE,
                                                           options=list(maxItems=8)),
                                               
                                               actionButton("clearSelected", "Clear Selected",
                                                            style="color: #fff; background-color: #008080")),
                              
                              conditionalPanel(condition = "input.VariableSelectLC != 'Local Authorities'",
                                               
                                               selectInput("FeatureCodeLCSingle",
                                                           "Local Authority:",
                                                           choices=FeatureCode,
                                                           selected = "Scotland",
                                                           multiple = FALSE)),
                              
                              checkboxInput("ConfidenceIntervalsLC",
                                            "Show Confidence Intervals",
                                            value = TRUE,
                                            width = NULL),
                              
                              radioButtons("zoomLevel_LC",
                                           "Y-axis zoom level: ",
                                           selected = "Full scale",
                                           choices = c("Full scale", "Zoom to data")),
                              
            downloadButton("DownloadLocalAuthorityServicesAndPerformanceLC", "Download Data", style=
                             "color: #fff; background-color: #008080") 
            
                              #TO DO: Add working save functionality
                              # ,
                              # 
                              # actionButton("openSaveButtonLC", "Save Chart", 
                              #              style="color: #fff; background-color: #008080"),
                              # 
                              # shinyjs::hidden(fluidRow(id="saveSectionLC",
                              #                          textInput("userFileName", "Type a file name:", ""),
                              #                          
                              #                          selectInput("userFileTypeLC",
                              #                                      "Select File Type:",
                              #                                      choices=c("jpeg", "png", "tiff", "bmp", "svg")),
                              #                          
                              #                          actionButton("saveButtonLC", "Save",
                              #                                       style="color: #fff; background-color: #008080")))
                              ),
                            
                            mainPanel(
                              
                              fluidRow(plotlyOutput("lineChart"),
                                       
                                       div(class = "help-section",
                                           
                                           div(p(strong("Frequently Asked Questions"), class="control-label")),
                                           
                                           fluidRow(actionButton("ShowDataMeaningLC", "How are the values collected?", class="help-button", style="background-color: transparent")),
                                           shinyjs::hidden(div(class = "help-text", id = "DataMeaningLC", p(paste(dataMeaningText)))),
                                           
                                           fluidRow(actionButton("ShowZoomDetailsLC", "How can I zoom in and out on the chart?", class="help-button", style="background-color: transparent")),
                                           shinyjs::hidden(div(class = "help-text", id = "ZoomInstructionsLC", p(zoomInstructionText))),
                                           
                                           fluidRow(actionButton("ShowIsolateDataDetailsLC", "How do I isolate individual rows?", class="help-button", style="background-color: transparent")),
                                           shinyjs::hidden(div(class = "help-text", id = "IsolateDataInstructionsLC", p(graphInstructionText))),
                                           
                                           fluidRow(actionButton("ShowMissingDataDetailsLC", "Why are some values missing?", class="help-button", style="background-color: transparent")),
                                           shinyjs::hidden(div(class = "help-text", id = "MissingDataTextLC",p(missingDataMessage))),
                                           
                                           fluidRow(actionButton("ShowConfidenceIntervalsDetailsLC", "What do confidence intervals mean?", class="help-button", style="background-color: transparent")),
                                           shinyjs::hidden(div(class = "help-text", id = "ConfidenceIntervalsTextLC",p(confidenceIntervalsText))),
                                           
                                           fluidRow(actionButton("ShowStatisticallySignificantTextLC", "What does 'statistically significant' mean?", class="help-button", style="background-color: transparent")),
                                           shinyjs::hidden(div(class = "help-text", id = "StatisticallySignificantTextLC",p(statisticallySignificantText)))))))
