# Twitter links defined separately for use in buttons.
# NOTE: for instructions on formatting a tweet url, go to 
# https://community.rstudio.com/t/include-a-button-in-a-shiny-app-to-tweet-the-url-to-the-app/8113/2 and
# https://crunchify.com/list-of-all-social-sharing-urls-for-handy-reference-social-media-sharing-buttons-without-javascript/

tweeturl <- "https://twitter.com/share?url=[url]&via=scotstat&hashtags=, ScottishHouseholdSurvey"
followurl <- "https://twitter.com/search?q=Scottish%20Household%20Survey&src=typd"

tab_about <- tabPanel("Resources", value = "aboutTab", 
                      
  fluidRow(div(class="homeTitleBar", img(src="logo.png"))),
  
  sidebarPanel(
    tags$div(
      p(strong(tags$em("Get in touch..."))),
      br(),
      p(strong("SHS Project Team, Communities Analysis Division, Area 2H North,Victoria Quay, 
               Edinburgh, EH6 6QQ")),
      p(strong("Email:", tags$a(href="mailto:shs@gov.scot", "shs@gov.scot"))),
      p(strong("Telephone: 0131 244 1685")),
      p(strong("App last modified: 11/12/2018")),
#     p(strong("Next update due: February 2019")),
      br(),
      actionButton("tweet_about", "Share on Twitter", icon=icon("twitter"), style=
                     "color: #fff; background-color: #1da1f2",
                   onclick = sprintf("window.open('%s')", tweeturl)),
      
      actionButton("tweet_about", "Follow us on Twitter", icon=icon("twitter"), style=
                     "color: #fff; background-color: #1da1f2",
                   onclick = sprintf("window.open('%s')", followurl))

  ) # End div 
), # End sidebarPanel 

  mainPanel(
    tags$div(
      br(),
# Direct links: target = "_blank" opens link in a new tab 
      p("For the most recent annual SHS publication,",tags$a(href=
"https://www.gov.scot/publications/scotlands-people-annual-report-results-2017-scottish-household-survey/", 
target = "_blank", "click here!")),

      p("For the most recent key findings report,", tags$a(href=
"https://www.gov.scot/publications/scottish-household-survey-key-findings-2017/", target="_blank",
"click here!")),

      p("To see the full questionnaire for each year,",tags$a(href=
"http://www.gov.scot/Topics/Statistics/16002/PublicationQuestionnaire", target = "_blank","click here!")),

      p("To view the SHS methodology,",tags$a(href=
"https://www2.gov.scot/Topics/Statistics/16002/PublicationMethodology", target = "_blank","click here!")),

      p("To see our bespoke report for the Fife Council area,",tags$a(href=
"https://www2.gov.scot/Resource/0054/00542508.pdf",target = "_blank","click here!")),

      p("To see our climate change topic report,",tags$a(href=
"https://www.gov.scot/publications/scottish-household-survey-topic-report-climate-change-2017/", 
target = "_blank","click here!")), 

      p("Take a look at our latest data comic,", tags$a(href=
"https://shs.theapsgroup.scot/september-2018/", target= "_blank", "click here!")),

      p("Our first data comic,", tags$a(href=
"https://shs.theapsgroup.scot/", target= "_blank", "click here!")),

      p(tags$em("The comic and welcome page images were illustrated by Katie Quinn")),

      p("To check out SHS in the news,", tags$a(href=
"https://www.google.co.uk/search?q=scottish+household+survey&source=
lnms&tbm=nws&sa=X&ved=0ahUKEwjI-LqnhfDfAhUBSRUIHawQCN4Q_AUIDygC&biw=1600&bih=1036", target = "_blank", 
"click here!")),

# Disclaimer text:
      p(tags$em("Please note, the Scottish Government is not responsible for and does not 
                endorse the content of external websites."))

    ), # End div 1

# Footer 'SHS in the news' image. 
    tags$div(img(src="news.png",  height="680", width="820")
    )# End div

  ) # End mainPanel
) # End tabPanel 
  

     