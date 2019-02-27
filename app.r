# INITIALISE LIBRARIES 

library(shiny)
library(ggplot2)        # For plots 
library(plotly)        

library(RColorBrewer)   # For colour palettes
library(shinyBS)        # For modals 

library(leaflet)        # For GIS
library(rgdal)          

library(jsonlite)       # For help boxes
library(shinyjs)      

library(plyr)           # For data processing 
library(reshape2)  

library(SPARQL)         # To return data from API

# COMMON ITEMS

# Variables etc used globally across the app
source("source/sparql.r")$value
source("source/variables.r")$value
ui <- source("source/ui.r", local = TRUE)$value

# Variables used only by specific theme and question modules within the app  
server <- function(input, output, session) {
  source("source/local_services/server_time_series.r", local = TRUE)$value
  source("source/local_services/server_by_year.r", local = TRUE)$value
  source("source/neighbourhoods/server_by_year_neighbourhood.r", local = TRUE)$value
  source("source/neighbourhoods/server_time_series_neighbourhood.r", local = TRUE)$value
  
# HOME PAGE BUTTONS

# Local Services Theme home tab
observeEvent(input$jump_to_local_services_landing, {
  updateTabsetPanel(session, "intabset", selected = "localServicesLandingTab")})

# Neighbourhoods and Communities Theme home tab
observeEvent(input$jump_to_neighbourhood_landing, {
  updateTabsetPanel(session, "intabset", selected = "neighbourhoodLandingTab")})

# About tab 
observeEvent(input$jump_to_about, {
  updateTabsetPanel(session, "intabset", selected = "aboutTab")})

# Data Download tab 
observeEvent(input$jump_to_download, {
  updateTabsetPanel(session, "intabset", selected = "DownloadTab")})

# THEME HOME TAB BUTTONS

# Local Services theme 

# Local Services by year tab
observeEvent(input$jump_to_local_services_by_year, {
  updateTabsetPanel(session, "intabset", selected = "byYearTab")})

# Local Services time series tab
observeEvent(input$jump_to_local_services_time_series, {
  updateTabsetPanel(session, "intabset", selected = "TimeSeriesTab")})

# Neighbourhoods and Communities theme  

# Neighbourhoods by year tab
observeEvent(input$jump_to_neighbourhoods_by_year, {
  updateTabsetPanel(session, "intabset", selected = "neighbourhoodsByYearTab")})

# Neighbourhoods time series tab
observeEvent(input$jump_to_neighbourhoods_time_series, {
  updateTabsetPanel(session, "intabset", selected = "neighbourhoodsTimeSeriesTab")})

# Additional server logic for ‘selectizeInput’ controls in neighbourhoods time series tab

updateSelectizeInput(session, 'DateCodeBCNeighbourhood',
                     choices = NULL, server = FALSE)

updateSelectizeInput(session, 'GeographyCodeLCMultipleNeighbourhood', 
                     choices = NULL, server = FALSE)

updateSelectizeInput(session, 'GeographyCodeLCMultipleCommbel',
                     choices = NULL, server = FALSE)

updateSelectizeInput(session, 'GeographyCodeLCMultipleCommbel',
                     choices = NULL, server = FALSE)

# Testing banner
shinyjs::onclick("close-banner", shinyjs::hide(id = "welcome-banner", anim = TRUE))

# MODAL (POP UP) PAGES   

# Welcome modal 
welcome_modal <- modalDialog(
  br(),
  p(img(src="comix.png", height=175, width =100 ), style="text-align: center"),
  p(tags$h4("Welcome to the SHS App!"), 
  tags$br(),
  tags$div(h5("This interactive tool provides access to a range of the SHS data..."),
  style = "color:0E3E5D; font-size:20px"),
  tags$br(),
  actionButton("tour", "Take a tour", icon("play-circle")),
  actionButton("modal_to_about", "Resources", icon("wrench")), 
  size = "1", align= "center", 
  easyClose = TRUE, fade=FALSE, footer = NULL)
) 

# Shows modal first time 
showModal(welcome_modal)

# Links from modal button to 'about' tab
observeEvent(input$modal_to_about, { updateTabsetPanel(session, "intabset", selected = "aboutTab")})

# Reloads modal on request from the main home tab and theme home tabs 
observeEvent(input$reload_modal, {showModal(welcome_modal)})
observeEvent(input$reload_modal_local_services_landing, {showModal(welcome_modal)})
observeEvent(input$reload_modal_neighbourhoods_landing, {showModal(welcome_modal)})

# 'Take a tour' tabs 

# Tour 1 
tour_modal_1 <- modalDialog(
fluidRow(
  column(12,
   p(tags$div("Let's get started!", style="color:0E3E5D; font-size:20px; width=90%, text-align: left;")),
   br(),
   tags$h5("There are two different ways around the tool:", style="width=90%, text-align: left;"), br())), 
fluidRow(
  column(5, offset=1, tags$h5("You can use the tabs at the top of the page...")),
  column(3, br(), img(src="tabs_select.png", height=20, width=200))), 
fluidRow(
  column(5, offset =1, tags$h5("Or, use the selection buttons instead.")),
  column(3, br(), img(src="buttons_select.png", height=80, width=200))), 
fluidRow(
  column(5, offset = 1, tags$h5("Lost? - Just click the 'home' button 
                                 to come back to the App home page at any time."))),
  br(),
  actionButton("next1", "Next", icon("play-circle"))
) 

observeEvent(input$tour,  {showModal(tour_modal_1)})
observeEvent(input$next1, {showModal(tour_modal_2)})
              
# Tour 2 
tour_modal_2 <- modalDialog(
fluidRow(
  column(12,
  p(tags$div("Select how you view the data:", style="color:0E3E5D; font-size:20px; width=90%, 
               text-align: left;")),
  br(),
  tags$h5("You can view the data in two ways.", style="width=90%, text-align: left;"), br())),
fluidRow(
  column(5, 
  offset = 1, tags$h5("To view all local authority data within a survey year, click 'by Year'...")),
  column(3, br(), img(src="by_year_select.png", height=80, width=200))),
fluidRow(
  column(5, 
         offset = 1, tags$h5("The 'by Year' tab also has a 'Map' function. This allows you to
                              view all local authority data within a survey year geographically.")),
  column(3, br(), img(src="map.png", height=80, width=200))),
fluidRow(
  column(5,
  offset = 1, tags$h5("To view the data by different breakdowns, such as age, gender and location, across 
                      the survey years, click 'Time Series’.")),
  column(3, br(), img(src="time_series_select.png", height=80, width=200))),
  br(),
  actionButton("next2", "Next", icon("play-circle")),
  actionButton("back1", "Back", icon("chevron-circle-left"))
  
) 

observeEvent(input$back1, {showModal(tour_modal_1)})
observeEvent(input$next2, {showModal(tour_modal_3)})

# Tour 3 
tour_modal_3 <- modalDialog(
  fluidRow(
    column(12, offset=1,
     p(tags$div("Arranging the data:", style="color:0E3E5D; font-size:20px; width=90%, text-align: left;")))),
     br(),
   fluidRow(
     column(5, offset = 1,
     tags$h5("When viewing the data on the 'by Year' tabs, you have the option to sort the results in 
              either ascending or descending order. The default is alphabetical order by local 
              authority name.")), 
    column(3, br(), img(src="sort_control.png", height=80, width=200))),
  fluidRow(
    column(5, offset = 1, 
    tags$h5("When viewing the data on both tabs, you can also change the level of zoom on the chart.")),
    column(3, br(), img(src="download_buttons_chart.png", height=80, width=200))),
  br(),
  actionButton("next3", "Next", icon("play-circle")),
  actionButton("back2", "Back", icon("chevron-circle-left"))
)

observeEvent(input$back2, {showModal(tour_modal_2)})
observeEvent(input$next3, {showModal(tour_modal_4)})


# Tour 4 
tour_modal_4 <- modalDialog(
fluidRow(
column(12,
  p(tags$div("What is 'significance'?", style="color:0E3E5D; font-size:20px; width=90%, text-align: left;")),
  br(),
  tags$h5("Both tabs let you view the data with and without ‘confidence intervals’. 
          It is not possible for us to survey the whole of Scotland’s population, 
          so we interview a representative sample of people from each area. ", 
         style="width=90%, text-align: left;"), 
  br())),

fluidRow(
column(5, offset = 1, 
  tags$h5("Confidence intervals can be used to estimate the precision of results obtained from our sample, 
           compared to the true population. A 95% confidence interval is a range which we can say, with 
            95 per cent certainty, that the true value lies within.")),
column(3, br(), img(src="ci_control.png", height=80, width=200))),

fluidRow( 
  column(12,
         p(tags$div("How do I find out if two values are significantly different??", 
                    style="color:0E3E5D; font-size:20px; width=90%, text-align: left;")))),

fluidRow(
column(5,
 offset = 1, tags$h5("If the confidence intervals for two values do not overlap, then we can say 
                      that those values are significantly different.  
                      Should the confidence intervals for two different values 
                      overlap, we cannot say that a statistically significant difference exits between the 
                      two. A difference between two areas is significant, if it is so large that it is 
                      unlikely to have occurred purely by chance factors.")),
column(3, br(), img(src="ci_overlap.png", height=80, width=200))),
br(),
actionButton("next4", "Next", icon("play-circle")),
actionButton("back3", "Back", icon("chevron-circle-left"))
) 

observeEvent(input$back3, {showModal(tour_modal_3)})
observeEvent(input$next4, {showModal(tour_modal_5)})

# Tour 5 
tour_modal_5 <- modalDialog(
fluidRow(
  column(12,
  p(tags$div("Want to do your own thing with the data? ", style="color:0E3E5D; font-size:20px; width=90%, text-align: left;")),
  br(),
  tags$h5("You can download data in two ways.", style="width=90%, text-align: left;"), br())),
  fluidRow(
    column(5, 
           offset = 1, tags$h5("You can download the data behind each chart on the ‘by Year’ and ‘Time Series’ tabs.")),
    column(3, br(), img(src="download_buttons_chart.png", height=80, width=200))),
  fluidRow(
    column(5,
           offset = 1, tags$h5("You can also download tables of the complete SHS data by theme and theme 
                               sub-question on the ‘Download’ tab. ")),
    column(3, br(), img(src="download_buttons_tab.png", height=80, width=200))),
  br(),
  actionButton("back4", "Back", icon("chevron-circle-left")),
  actionButton("modal_to_download", "Go to Download tab", icon("wrench"))
) 

observeEvent(input$back4, {showModal(tour_modal_4)})
observeEvent(input$modal_to_download, {updateTabsetPanel(session, "intabset", selected = "DownloadTab")} )

# THEME DATA DOWNLOADS 

# Local Services theme 
output$download_local_services <- downloadHandler( filename =  'local_services_theme_data.csv',
content = function(file) { write.csv(Unfiltered, file, row.names=FALSE) })

# Neighbourhoods and Communities theme

# Neighbourhood rating 
output$download_neighbourhoods <- downloadHandler(filename =  'neighbourhood_rating_all_data.csv',
content = function(file) { write.csv(UnfilteredNeighbourhood, file, row.names=FALSE) })

# Community belonging 
output$download_commbel <- downloadHandler(filename =  'community_belonging_all_data.csv',
content = function(file) { write.csv(UnfilteredCommbel, file, row.names=FALSE) })

# Area improvement 
output$download_arimp <- downloadHandler(filename =  'neighbourhood_improvement_all_data.csv',
content = function(file) { write.csv(UnfilteredArimp, file, row.names=FALSE) })

} # End 'server' 

shinyApp(ui, server)