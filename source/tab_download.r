tab_download <- tabPanel("Data Download", value = "DownloadTab",  
                                
  titlePanel(title= div(class="titleBar",
                        img(src="logo.png"))),
  mainPanel(
    width = 11, style="margin-left:4%; margin-right:4%",
    fluidRow(h3("Data Download by SHS Themes:", 
                style="margin-top:0px;")),
    tags$br(),
    fluidRow(h5("This tab allows you to download a table of the complete SHS data by theme and theme sub-question.")),
    tags$br(),
    fluidRow(
      column(6,h4("Download Local Services Data")), 
      column(6, downloadButton('download_local_services', 'Download', style="color: #fff; background-color: #008080"))
      
    ), # End fluidRow
    
    fluidRow(
      column(6,h4("Download Neighbourhoods and Communities Data"))),
    fluidRow(
      column(6,h5("Download Neighbourhood Rating Data")), 
      column(6, downloadButton('download_neighbourhoods', 'Download', style="color: #fff; background-color: #008080"))),
    fluidRow(
      column(6,h5("Download Community Belonging Data")), 
      column(6, downloadButton('download_commbel', 'Download', style="color: #fff; background-color: #008080"))),
    fluidRow(
      column(6,h5("Download Area Improvement Data")), 
      column(6, downloadButton('download_arimp', 'Download', style="color: #fff; background-color: #008080"))
      
      ) # End fluidRow
  ) # End mainPanel 
) # End tabPanel                       