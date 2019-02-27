tagList( # Needed to operate Shinyjs
  useShinyjs(),

# CSS STYLES 

# Basic CSS from first release: styles imported from 'shs.css' file 
tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "shs.css"),
          
# Additional CSS for revised UI with landing pages and buttons: styles added directly to HTML tags. 

tags$style(
  
# Base layer:columns   
  # Defines column strucutre for landing pages 
  ".landing-page-column {padding-right:3vh}",

# Back layer: boxes 
  # Defines landing page boxes
  ".landing-page-box {width:100%; height:100%; min-height:22vh; background-color:white;
  border: 1px solid #AAAAAA; margin-bottom: 5px; float: left; transition: 0.5s ease; position: relative; 
  object-fit: scale-down;}",
  # Landing page box titles 
  ".landing-page-box-title {font-size: 16px; text-align:center; color: darkblue;
  font-weight: bold; background-color: none; width:100%; max-height: 20px; margin-top: 10px; 
  position: relative;}",
  
# Middle layer: icons 
  # Landing page box icons (separate box structure on top of base)
  ".landing-page-icon {width:100%; height:45%; min-height:7vh; background-color: white;
  border: 0px ; position: absolute; object-fit: scale-down;}",
  
# Front layer: action buttons (transparent, hovering selector buttons on top of base and layer 1)
  # Landing page box action buttons 
  ".landing-page-button {text-align:center;
  background-image:none; color: black; white-space: normal; border-radius: 0;border: 0px;
  font-size: 16px; min-height: 16vh; position: relative; margin-bottom: 0px; margin-top: 5px; 
  float: top;width: 100%; opacity: 0;}",
  # Hover effect for landing page box action buttons
  ".landing-page-button:hover , .landing-page-button:active {opacity: 1; 
  background-color: #fff; /* fallback */
  background-color: rgba(255, 255, 255, 0.8);
  color: darkblue;
  border-color: #fff; /* fallback */
  border-color: rgba(255, 255, 255, 0.8); transition: background-color 0.3s ease-in,
  color 0.3s ease-in;}",

# Additional CSS to hide R error messages throughiout the app (disable if testing)
  
  ".shiny-output-error { visibility: hidden; }",
  ".shiny-output-error:before { visibility: hidden; }"

), 

# Testing banner
tags$div(id="welcome-banner", "Welcome to the new Scottish Household Survey data visualisation App.",
         tags$br(),
         "We're still working on the site and welcome any comments and suggestions to ", 
         tags$a(href="mailto:shs@gov.scot", "shs@gov.scot"),
         actionButton("close-banner", "",icon=icon("times"))),

# APP MASTER NAVBAR 
navbarPage("Scottish Household Survey", id="intabset",
             
# Home tab  
tabPanel("Home", 
  titlePanel(title= div(class="titleBar",
  img(src="logo.png"))),

  mainPanel(
    width = 11, style="margin-left:4%; margin-right:4%",
    
    fluidRow(h3("Welcome to the Scottish Household Survey (SHS) App.", 
                style="margin-top:0px;")),
    fluidRow(h4("Explore the data by SHS theme...", style="margin-top:0px; ")),
    
    
# Enclosing fluid row: for 3 buttons of 4 width (max row width is 12 units, spacing automatic)
    fluidRow(
    
# Local Services theme landing button  
  column(6, class="landing-page-column",
   div(class="landing-page-box", 
       div("Local Services", class = "landing-page-box-title"),
       p(),
       div(class = "landing-page-icon", img(src="local.png", width = "100px", height = "100px"), 
      style="text-align: center"),
       actionButton('jump_to_local_services_landing',
                    'Go to: Local Services',
                    class="landing-page-button", 
                    icon = icon("arrow-circle-right", "icon-lp")))),
  
# Neighbourhoods and Communities theme landing button  
  column(6, class="landing-page-column",
    div(class="landing-page-box", 
      div("Neighbourhoods and Communities", class = "landing-page-box-title"),
      p(),
      div(class = "landing-page-icon", img(src="neighbourhood.png", width = "100px", height = "100px"), 
      style="text-align: center"),
        actionButton('jump_to_neighbourhood_landing',
             'Go to: Neighbourhoods and Communities',
             class="landing-page-button", 
              icon = icon("arrow-circle-right", "icon-lp"))))

    ), # End fluidRow 1

# fluidRow2
fluidRow(
  
# About tab button  
    column(6, class="landing-page-column",
     div(class="landing-page-box", 
         div("Resources", class = "landing-page-box-title"),
         p(),
         div(class = "landing-page-icon", img(src="about.png", width = "100px", height = "100px"), 
             style="text-align: center"),
         actionButton('jump_to_about', 
                'Go to: Resources',
                class="landing-page-button", 
                icon = icon("arrow-circle-right", "icon-lp")))),
    
    column(6, class="landing-page-column",
           div(class="landing-page-box", 
               div("Data Download", class = "landing-page-box-title"),
               p(),
               div(class = "landing-page-icon", img(src="download.png", width = "100px", height = "100px"), 
                   style="text-align: center"),
               actionButton('jump_to_download', 
                'Go to: Data Download',
                class="landing-page-button", 
                icon = icon("arrow-circle-right", "icon-lp"))))

    ), # End fluidRow 2
    
# fluidRow 3 
fluidRow(
  
# Reload welcome modal button 
  tags$br(), 
  tags$br(), 
  column(6, actionButton("reload_modal", "Reload 'Take a Tour'", style=
                         "color: #fff; background-color: #008080"))
      
    ) # End fluidRow 3
  ) # End 'mainPanel'
), # End 'tabPanel' 

# THEME TABS

# Local Services theme menu and buttons  
navbarMenu("Local Services",
           
  tabPanel("Local Services Home", value = "localServicesLandingTab",  
         
    titlePanel(title= div(class="titleBar",
         img(src="logo.png"))),
         
mainPanel(
width = 11, style="margin-left:4%; margin-right:4%",
fluidRow(h3("Welcome to the Local Services Theme.", style="margin-top:0px;")),

tags$br(),

tags$div(
tags$p("Every year the Scottish Household Survey (SHS) asks adults whether they agree with statements 
      about local authority services and performance. These statements are:"),  
tags$li("I can influence decisions affecting my local area."),
tags$li("I would like to be more involved in the decisions my council makes that affect my local area."),
tags$li("My local council addresses the key issues affecting the quality of life in my local 
       neighbourhood."),
tags$li("My council designs services around users' needs."),
tags$li("My council does its best with the money available."),
tags$li("My council is good at communicating performance."),
tags$li("My council is good at communicating services."),
tags$li("My council is good at listening."),
tags$li("My council provides high quality services."), 
tags$br(),
tags$p(h4("To compare local authority data within an individual survey year, click on the 'by Year' button. 
           To view trends in the data over the last six survey years instead, click on the 'Time Series'  
           button below.")),
tags$br()
  
), # End div 
           
# Fluid row: for 2 buttons of 6 width (max row width is 12 units, spacing automatic)
      fluidRow(
             
# Local Services by year button  
  column(6, class="landing-page-column",
    div(class="landing-page-box", 
        div("Local Services by Year", class = "landing-page-box-title"),
        p(),
        div(class = "landing-page-icon", img(src="by_year.png", width = "100px", height = "100px"), 
        style="text-align: center"),
          actionButton('jump_to_local_services_by_year',
                     'Go >>>',
                     class="landing-page-button", 
                     icon = icon("arrow-circle-right", "icon-lp")))),
             
# Local Services time series button  
     column(6, class="landing-page-column",
      div(class="landing-page-box", 
          div("Local Services Time Series", class = "landing-page-box-title"),
          p(),
          div(class = "landing-page-icon", img(src="time_series.png", width = "100px", height = "100px"), 
              style="text-align: center"),
          actionButton('jump_to_local_services_time_series',
                       'Go >>>',
                       class="landing-page-button", 
                       icon = icon("arrow-circle-right", "icon-lp"))))
   ), # End fluidRow

fluidRow(
  
  # Reload welcome modal button 
  tags$br(), 
  tags$br(), 
  column(6, actionButton("reload_modal_local_services_landing", "Reload 'Take a Tour'", style=
                           "color: #fff; background-color: #008080"))

  ) # End fluidRow
 ) # End mainPanel
), # End tabPanel 

# Link to Local Services by year tab 
source("source/local_services/tab_by_year.r", local = TRUE)$value,

# Link to Local Services time series tab 
source("source/local_services/tab_time_series.r", local = TRUE)$value


), # End navbarMenu

# Neighbourhoods and Communities theme menu and buttons 
navbarMenu("Neighbourhoods and Communities",

  tabPanel("Neighbourhoods Home", value = "neighbourhoodLandingTab",  
      titlePanel(title= div(class="titleBar",
      img(src="logo.png"))),

  mainPanel(
    width = 11, style="margin-left:4%; margin-right:4%",
    fluidRow(h3("Welcome to the Neighbourhoods and Communities Theme", style="margin-top:0px;")),
    
tags$br(),
tags$div(
tags$p("Every year the Scottish Household Survey (SHS) asks adults to reflect on their neighbourhood 
       by asking the following questions:"),
tags$li("Neighbourhood rating: thinking now about the neighbourhood you live in, 
        how would you rate it as a place to live?"), 
tags$li("Community belonging: how strongly do you feel you belong to your immediate neighbourhood?"),
tags$li("Area improvement: thinking about your local neighbourhood, do you think it has got better, 
        stayed the same or got worse over the last three years?"),
tags$br(),
tags$p(h4("To view the local authority data by individual survey year, click on the 'by Year' button.
To view trends in the data over the last six survey years instead, click on the 'Time Series' 
button below.")),
tags$br()

), # End div 
               
# Fluid row: for 2 buttons of 6 width (max row width is 12 units, spacing automatic)
  fluidRow(

# Neighbourhoods by year button  
      column(6, class="landing-page-column",
        div(class="landing-page-box", 
        div("Neighbourhoods by Year", class = "landing-page-box-title"),
        p(),
          div(class = "landing-page-icon", img(src="by_year.png", width = "100px", height = "100px"), 
          style="text-align: center"),
            actionButton('jump_to_neighbourhoods_by_year',
              'Go >>>',
              class="landing-page-button", 
              icon = icon("arrow-circle-right", "icon-lp")))),

# Neighbourhoods time series button  
        column(6, class="landing-page-column",
         div(class="landing-page-box", 
         div("Neighbourhoods Time Series", class = "landing-page-box-title"),
         p(),
            div(class = "landing-page-icon", img(src="time_series.png", width = "100px", height = "100px"), 
            style="text-align: center"),
              actionButton('jump_to_neighbourhoods_time_series',
                'Go >>>',
                class="landing-page-button", 
                icon = icon("arrow-circle-right", "icon-lp"))))

    ), # End fluidRow

fluidRow(
  
  # Reload welcome modal button 
  tags$br(), 
  tags$br(), 
  column(6, actionButton("reload_modal_neighbourhoods_landing", "Reload 'Take a Tour'", style=
                           "color: #fff; background-color: #008080"))
  
    ) # End fluidRow
  ) # End mainPanel
), # End tabPanel 

# Link to Neighbourhoods by year tab 
source("source/neighbourhoods/tab_by_year_neighbourhood.r", local = TRUE)$value,

# Link to Neighbourhoods time series tab 
source("source/neighbourhoods/tab_time_series_neighbourhood.r", local = TRUE)$value

), # End navbarMenu
           
# About tab
source("source/tab_about.r", local = TRUE)$value,

# Download tab
source("source/tab_download.r", local = TRUE)$value, 

fluid = TRUE

  )) # End navbarPage 
) # End 'taglist' 