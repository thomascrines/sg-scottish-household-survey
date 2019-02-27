#Scottish Household Survey Shiny App

###Overview

The purpose of this app is to allow users to create visualisations of the results of the Scottish Household Survey (SHS) results. The full datasets of results are available from the Scottish Open Data Platform at statistics.gov.scot.


###To run the project locally:

* Download the SHS folder from the remote repository
* Using R Studio, set the working directory to the SHS folder
* Open the file app.R file in the top level of the folder and select ‘run app’
* Install any dependencies as required


###Project Structure

The top level folder contains five files:

* app.R – The app file which calls all necessary libraries and defines the UI and server
* SHS.Rproj – Project file which is never directly edited
* .RHistory – History file which is not necessary to run app
* .gitignore – File which specifies files and directories to ignore when pushing to the remote git repository
* This read me file

In addition there are three folders:

* www – contains the css file which is called in the ui, and images
* source – contains code snippets that are called throughout the app through the ‘source’ keyword
* data – contains the shape files that are used for the map, as well as csv files of raw data

The overall structure of the app can be seen by following the source links from app.R. The files contained in the source folder have been named by the following naming convention:

* tab (followed by page name) – a ui tabPanel
* server (followed by name) – outputs and events called in the server
* data_proc (followed by name) – data preparation and processing, called in the server


###Further Information

For any more information about this app, please contact SHS@gov.scot 