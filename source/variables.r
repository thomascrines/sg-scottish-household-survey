#----------------------------------------------- CHARTS -----------------------------------------------------------

# DATA IMPORT 
# Imports raw data from csv's into R for each question

# Local Services theme

# Unfiltered <- read.csv("data/serv1_all_251018.csv")

# Neighbourhoods theme 

# UnfilteredNeighbourhood <- read.csv("data/rb1ODP_LA_Scode_all_021118.csv")
# UnfilteredCommbel <-read.csv("data/commbel_LA_Scode_all_021118.csv")
# UnfilteredArimp <-read.csv("data/area1ODP_LA_Scode_all_021118.csv")

# PRIMARY VARIABLES FOR QUESTIONS  
# Sets up the primary variables for each question and derives factor levels (Fairly good - Very poor, etc.)

# Local Services theme

LocalAuthorityServicesAndPerformanceUnsorted <- unique(Unfiltered["servicesperformance"])
LocalAuthorityServicesAndPerformance <- LocalAuthorityServicesAndPerformanceUnsorted[order(unique(Unfiltered["servicesperformance"])),]

# Neighbourhoods theme 

NeighbourhoodRatingUnsorted <- unique(UnfilteredNeighbourhood["neighbourhoodRating"])
NeighbourhoodRating <- NeighbourhoodRatingUnsorted[order(unique(UnfilteredNeighbourhood["neighbourhoodRating"])),]

BelongingUnsorted <- unique(UnfilteredCommbel["communityBelonging"]) 
Belonging <- BelongingUnsorted[order(unique(UnfilteredCommbel["communityBelonging"])),]

ImprovementUnsorted <- unique(UnfilteredArimp["localNeighbourhoodImprovement"]) 
Improvement <- ImprovementUnsorted[order(unique(UnfilteredArimp["localNeighbourhoodImprovement"])),]

# GROUPING VARIABLES FOR QUESTIONS  
# Sets up the grouping variables for each question (Date, Gender, etc...) and derives factor levels

# Local Services theme 

AgeUnsorted <- unique(Unfiltered["age"])
Age <- AgeUnsorted[order(unique(Unfiltered["age"])),]

GenderUnsorted <- unique(Unfiltered["gender"])
Gender <- GenderUnsorted[order(unique(Unfiltered["gender"])),]

UrbanRuralClassificationUnsorted <- unique(Unfiltered["urbanrural"])
UrbanRuralClassification <- UrbanRuralClassificationUnsorted[order(unique(Unfiltered["urbanrural"])),]

SIMDQuintilesUnsorted <- unique(Unfiltered["simd"])
SIMDQuintiles <- SIMDQuintilesUnsorted[order(unique(Unfiltered["simd"])),]

DateCodeUnsorted <- unique(Unfiltered["year"])
DateCode <- DateCodeUnsorted[order(unique(Unfiltered["year"])),]

FeatureCodeUnsorted <- unique(Unfiltered["area"])
FeatureCode <- FeatureCodeUnsorted[order(unique(Unfiltered["area"])),]

# Neighbourhoods theme

# Question 1: Neighbourhood Rating

GeographyCodeUnsorted <- unique(UnfilteredNeighbourhood["area"])
GeographyCode <- GeographyCodeUnsorted[order(unique(UnfilteredNeighbourhood["area"])),]

DateCodeUnsortedNeighbourhood <- unique(UnfilteredNeighbourhood["year"])
DateCodeNeighbourhood <- DateCodeUnsortedNeighbourhood[order(unique(UnfilteredNeighbourhood["year"])),]

GenderUnsortedNeighbourhood <- unique(UnfilteredNeighbourhood["gender"])
GenderNeighbourhood <- GenderUnsortedNeighbourhood[order(unique(UnfilteredNeighbourhood["gender"])),]

UrbanRuralClassificationUnsortedNeighbourhood <- unique(UnfilteredNeighbourhood["urbanRuralClassification"])
UrbanRuralClassificationNeighbourhood <- UrbanRuralClassificationUnsortedNeighbourhood[order(unique(UnfilteredNeighbourhood["urbanRuralClassification"])),]

SIMDQuintilesUnsortedNeighbourhood <- unique(UnfilteredNeighbourhood["simdQuintiles"])
SIMDQuintilesNeighbourhood <- SIMDQuintilesUnsortedNeighbourhood[order(unique(UnfilteredNeighbourhood["simdQuintiles"])),]

TypeOfTenureUnsorted <- unique(UnfilteredNeighbourhood["typeOfTenure"])
TypeOfTenure <- TypeOfTenureUnsorted[order(unique(UnfilteredNeighbourhood["typeOfTenure"])),]

HouseholdTypeUnsorted <- unique(UnfilteredNeighbourhood["householdType"])
HouseholdType <- HouseholdTypeUnsorted[order(unique(UnfilteredNeighbourhood["householdType"])),]

EthnicityUnsorted <- unique(UnfilteredNeighbourhood["ethnicity"])
Ethnicity <- EthnicityUnsorted[order(unique(UnfilteredNeighbourhood["ethnicity"])),]

WalkingDistanceToNearestGreenspaceUnsorted <- unique(UnfilteredNeighbourhood["walkingDistanceToNearestGreenspace"])
WalkingDistanceToNearestGreenspace <- WalkingDistanceToNearestGreenspaceUnsorted[order(unique(UnfilteredNeighbourhood["walkingDistanceToNearestGreenspace"])),]

# Question 2: Community Belonging

GeographyCodeUnsortedCommbel <- unique(UnfilteredCommbel["area"])
GeographyCodeCommbel <- GeographyCodeUnsortedCommbel[order(unique(UnfilteredCommbel["area"])),]

DateCodeUnsortedCommbel <- unique(UnfilteredCommbel["year"])
DateCodeCommbel <- DateCodeUnsortedCommbel[order(unique(UnfilteredCommbel["year"])),]

GenderUnsortedCommbel <- unique(UnfilteredCommbel["gender"])
GenderCommbel <- GenderUnsortedCommbel[order(unique(UnfilteredCommbel["gender"])),]

UrbanRuralClassificationUnsortedCommbel <- unique(UnfilteredCommbel["urbanRuralClassification"])
UrbanRuralClassificationCommbel <- UrbanRuralClassificationUnsortedCommbel[
  order(unique(UnfilteredCommbel["urbanRuralClassification"])),]

SIMDQuintilesUnsortedCommbel <- unique(UnfilteredCommbel["simdQuintiles"])
SIMDQuintilesCommbel <- SIMDQuintilesUnsortedCommbel[order(unique(UnfilteredCommbel["simdQuintiles"])),]

TypeOfTenureUnsortedCommbel <- unique(UnfilteredCommbel["typeOfTenure"])
TypeOfTenureCommbel <- TypeOfTenureUnsortedCommbel[order(unique(UnfilteredCommbel["typeOfTenure"])),]

HouseholdTypeUnsortedCommbel <- unique(UnfilteredCommbel["householdType"])
HouseholdTypeCommbel <- HouseholdTypeUnsortedCommbel[order(unique(UnfilteredCommbel["householdType"])),]

EthnicityUnsortedCommbel <- unique(UnfilteredCommbel["ethnicity"])
EthnicityCommbel <- EthnicityUnsortedCommbel[order(unique(UnfilteredCommbel["ethnicity"])),]

WalkingDistanceToNearestGreenspaceUnsortedCommbel <- unique(UnfilteredCommbel[
  "walkingDistanceToNearestGreenspace"])
WalkingDistanceToNearestGreenspaceCommbel <- WalkingDistanceToNearestGreenspaceUnsortedCommbel[order(
  unique(UnfilteredCommbel["walkingDistanceToNearestGreenspace"])),]

# Question 3: Area Improvement

GeographyCodeUnsortedArimp <- unique(UnfilteredArimp["area"])
GeographyCodeArimp <- GeographyCodeUnsortedArimp[order(unique(UnfilteredArimp["area"])),]

DateCodeUnsortedArimp <- unique(UnfilteredArimp["year"])
DateCodeArimp <- DateCodeUnsortedArimp[order(unique(UnfilteredArimp["year"])),]

GenderUnsortedArimp <- unique(UnfilteredArimp["gender"])
GenderArimp <- GenderUnsortedArimp[order(unique(UnfilteredArimp["gender"])),]

UrbanRuralClassificationUnsortedArimp <- unique(UnfilteredArimp["urbanRuralClassification"])
UrbanRuralClassificationArimp <- UrbanRuralClassificationUnsortedArimp[
  order(unique(UnfilteredArimp["urbanRuralClassification"])),]

SIMDQuintilesUnsortedArimp <- unique(UnfilteredArimp["simdQuintiles"])
SIMDQuintilesArimp <- SIMDQuintilesUnsortedArimp[order(unique(UnfilteredArimp["simdQuintiles"])),]

TypeOfTenureUnsortedArimp <- unique(UnfilteredArimp["typeOfTenure"])
TypeOfTenureArimp <- TypeOfTenureUnsortedArimp[order(unique(UnfilteredArimp["typeOfTenure"])),]

HouseholdTypeUnsortedArimp <- unique(UnfilteredArimp["householdType"])
HouseholdTypeArimp <- HouseholdTypeUnsortedArimp[order(unique(UnfilteredArimp["householdType"])),]

EthnicityUnsortedArimp <- unique(UnfilteredArimp["ethnicity"])
EthnicityArimp <- EthnicityUnsortedArimp[order(unique(UnfilteredArimp["ethnicity"])),]

WalkingDistanceToNearestGreenspaceUnsortedArimp <- unique(UnfilteredArimp[
  "walkingDistanceToNearestGreenspace"])
WalkingDistanceToNearestGreenspaceArimp <- WalkingDistanceToNearestGreenspaceUnsortedArimp[order(
  unique(UnfilteredArimp["walkingDistanceToNearestGreenspace"])),]

# ------------------------------------------ CHLOROPLETH MAPS --------------------------------------------------------

# Raw spatial data from directory and shapefile (layer files) into R

# Local Services theme

localAuthoritiesShape <- readOGR(dsn="data", layer=
"Local_Authority_Districts_December_2016_Super_Generalised_Clipped_Boundaries_in_Great_Britain", 
verbose=FALSE)

# Neighbourhoods theme

localAuthoritiesShapeNeighbourhood  <- readOGR(dsn="data", layer=
"Local_Authority_Districts_December_2016_Super_Generalised_Clipped_Boundaries_in_Great_Britain", 
  verbose=FALSE)

localAuthoritiesShapeCommbel <- readOGR(dsn = "data", layer=
"Local_Authority_Districts_December_2016_Super_Generalised_Clipped_Boundaries_in_Great_Britain", 
  verbose=FALSE)

localAuthoritiesShapeArimp <- readOGR(dsn = "data", layer=
"Local_Authority_Districts_December_2016_Super_Generalised_Clipped_Boundaries_in_Great_Britain", 
  verbose=FALSE)
                                      
# Sets up map variables and datums

# Local Services theme

locAuthLatLon <- spTransform(localAuthoritiesShape, CRS("+proj=longlat +datum=WGS84"))
scotLocAuth <- subset(locAuthLatLon, locAuthLatLon$lad16nm %in% FeatureCode)

# Neighbourhoods theme

locAuthLatLonNeighbourhood <- spTransform(localAuthoritiesShapeNeighbourhood , CRS("+proj=longlat +datum=WGS84"))
scotLocAuthNeighbourhood  <- subset(locAuthLatLonNeighbourhood , locAuthLatLonNeighbourhood$lad16nm %in% GeographyCode)

locAuthLatLonCommbel<- spTransform(localAuthoritiesShapeCommbel , CRS("+proj=longlat +datum=WGS84"))
scotLocAuthCommbel  <- subset(locAuthLatLonCommbel , locAuthLatLonCommbel$lad16nm %in% GeographyCode)

locAuthLatLonArimp<- spTransform(localAuthoritiesShapeArimp , CRS("+proj=longlat +datum=WGS84"))
scotLocAuthArimp  <- subset(locAuthLatLonArimp , locAuthLatLonArimp$lad16nm %in% GeographyCode)

# ------------------------------------------ COLOUR PALLETTES -----------------------------------------

# Experimental CB friendly pallette with grey

cbPalette <- c("#E69F00", "#56B4E9", "#CC79A7","#E69F00")

# SHS 'house' colour palette
# '#81c9bb' - teal, '#6cafe1' - sky blue, '#b8b8ba' - grey

byYearColours <- c("#008080", "#6cafe1", "#ccccff")
byYearColoursMap <- c("#000000", "#008080","#6cafe1",  "#ccccff")
timeSeriesColours <- brewer.pal(8, "Dark2")

# ------------------------------------------ HELP TEXT ----------------------------------------------------

dataMeaningText <- "The data shown represents the percentage of survey respondents who agreed or strongly agreed with the displayed statement. \n For more information about the survey methodology please see the links in the results section."
missingDataMessage <- "Some tables include missing values. This is where the count on which percentages would be calculated is less than 50 and this data is judged to be insufficiently robust for publication."
zoomInstructionText <- "To zoom, drag the cursor over the graph. Double click on the graph to zoom out. To adjust the y-axis to the data, use the 'zoom to data' button."
graphInstructionText <- "To hide a line, click once on the name of the line in the legend. This can be undone by clicking the name of the legend again. To show only one line and hide the rest, double-click the name of the desired line. To undo, double-click the name again."
confidenceIntervalsText <- "Confidence intervals can be used to estimate the precision of results obtained from our sample, compared to the true population. A 95% confidence interval is a range which we can say, with 95 per cent certainty, that the true value lies within. Caution should be taken when interpreting results with large confidence intervals as the larger the range, the less robust the result."
statisticallySignificantText <- tags$div(p("A difference between two areas is significant if it is so large that a difference of that size (or greater)
is unlikely to have occurred  purely by chance.Conventionally, significance is tested at the five per cent level, which means that a difference is 
considered significant if it would only have occurred  once in 20 different samples. Testing significance involves comparing the difference between the two samples with the 95 per cent 
confidence limits for each of the two estimates."),
p("How do I find out if two values are significantly different?"),
p("If the confidence intervals for two values do not overlap, then we can say that those values are significantly different. Should the confidence intervals for two different values overlap, we cannot say that a statistically significant difference exists between the two.")

)


