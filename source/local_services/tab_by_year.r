tab_by_year <- tabPanel("Local Services by Year", value = "byYearTab", 
                        
                        
                        sidebarPanel(
                          
                          selectInput("DateCodeBC",
                                      "Year:",
                                      choices=sort(DateCode, decreasing = TRUE),
                                      selected = max(DateCode)),
                          
                          selectInput("LocalAuthorityServicesAndPerformanceBC",
                                      "Statement:",
                                      choices=LocalAuthorityServicesAndPerformance),
                          
                          conditionalPanel(condition = "input.byYearTab == 'Bar Chart'",
                                           checkboxInput("ConfidenceIntervalsBC",
                                                         "Show Confidence Intervals",
                                                         value = TRUE,
                                                         width = NULL),
                                           
                                           checkboxInput("ScottishAverageBC",
                                                         "Show Scottish Average",
                                                         value = FALSE,
                                                         width = NULL),
                                           
                                           selectInput("OrderBC",
                                                       "Sort:",
                                                       choices=c("Alphabetical", "Ascending", "Descending")),
                                           
                                           radioButtons("zoomLevel_BC",
                                                        "Y-axis zoom level: ",
                                                        selected = "Full scale",
                                                        choices = c("Full scale", "Zoom to data")),
                                           
                         # Chart data download button  
                         downloadButton("DownloadLocalAuthorityServicesAndPerformance", 
                                        "Download Data", style="color: #fff; background-color: #008080")


)),

mainPanel(tabsetPanel(id="byYearTab",
                    
                    tabPanel("Bar Chart", 
                             
                             htmlOutput("byYearTitle", container = tags$p, class = "by-year-title"),
                             
                             htmlOutput("byYearSubtitle", container = tags$p, class = "by-year-subtitle"),
                             
                             plotlyOutput("barChart")),
                                              
                                              tabPanel("Map", 
                                                       
                                                       htmlOutput("byYearTitleMap", container = tags$p, class = "by-year-title"),
                                                       
                                                       htmlOutput("byYearSubtitleMap", container = tags$p, class = "by-year-subtitle"),
                                                       
                                                       leafletOutput("map")),
                                              
                                              div(class = "help-section",
                                                  
                                                  div(p(strong("Frequently Asked Questions"), class="control-label")),
                                                  
                                                  fluidRow(actionButton("ShowDataMeaningBC", "What do the values in the charts represent?", class="help-button", style="background-color: transparent")),
                                                  shinyjs::hidden(div(class = "help-text", id = "DataMeaningBC", p(dataMeaningText))),
                                                  
                                                  fluidRow(actionButton("ShowZoomDetailsBC", "How can I zoom in and out on the chart?", class="help-button")),
                                                  shinyjs::hidden(div(class = "help-text", id = "ZoomInstructionsBC", p(zoomInstructionText))),
                                                  
                                                  fluidRow(actionButton("ShowIsolateDataDetailsBC", "How do I isolate individual rows?", class="help-button", style="background-color: transparent")),
                                                  shinyjs::hidden(div(class = "help-text", id = "IsolateDataInstructionsBC", p(graphInstructionText))),
                                                  
                                                  fluidRow(actionButton("ShowMissingDataDetailsBC", "Why are some values missing?", class="help-button", style="background-color: transparent")),
                                                  shinyjs::hidden(div(class = "help-text", id = "MissingDataTextBC",p(missingDataMessage))),
                                                  
                                                  fluidRow(actionButton("ShowConfidenceIntervalsDetailsBC", "What are confidence intervals?", class="help-button", style="background-color: transparent")),
                                                  shinyjs::hidden(div(class = "help-text", id = "ConfidenceIntervalsTextBC",p(confidenceIntervalsText))),
                                                  
                                                  fluidRow(actionButton("ShowStatisticallySignificantTextBC", "What does 'statistically significant' mean?", class="help-button", style="background-color: transparent")),
                                                  shinyjs::hidden(div(class = "help-text", id = "StatisticallySignificantTextBC",p(statisticallySignificantText)))))))