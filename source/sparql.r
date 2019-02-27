SparqlDataEndpoint <- 'http://statistics.gov.scot/sparql.csv'

SparqlDataQuery <- 'PREFIX qb: <http://purl.org/linked-data/cube#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dim: <http://statistics.gov.scot/def/dimension/>
PREFIX sdmx: <http://purl.org/linked-data/sdmx/2009/dimension#>

SELECT ?year ?age ?gender ?servicesperformance ?simd ?urbanrural ?area ?95lowerCI ?percent ?95upperCI

WHERE {
?s qb:dataSet <http://statistics.gov.scot/data/local-authority-services-and-performance---shs>;
dim:age ?ageURI;
sdmx:refPeriod ?yearURI;
dim:gender ?genderURI;
dim:localAuthorityServicesAndPerformance ?servicesperformanceURI;
dim:simdQuintiles ?simdURI;
dim:urbanRuralClassification ?urbanruralURI;
<http://statistics.gov.scot/def/measure-properties/95-lower-confidence-limit-percent> ?95lowerCI;
sdmx:refArea ?areaURI.

?t qb:dataSet <http://statistics.gov.scot/data/local-authority-services-and-performance---shs>;
dim:age ?ageURI;
sdmx:refPeriod ?yearURI;
dim:gender ?genderURI;
dim:localAuthorityServicesAndPerformance ?servicesperformanceURI;
dim:simdQuintiles ?simdURI;
dim:urbanRuralClassification ?urbanruralURI;
<http://statistics.gov.scot/def/measure-properties/95-upper-confidence-limit-percent> ?95upperCI;
sdmx:refArea ?areaURI.

?u qb:dataSet <http://statistics.gov.scot/data/local-authority-services-and-performance---shs>;
dim:age ?ageURI;
sdmx:refPeriod ?yearURI;
dim:gender ?genderURI;
dim:localAuthorityServicesAndPerformance ?servicesperformanceURI;
dim:simdQuintiles ?simdURI;
dim:urbanRuralClassification ?urbanruralURI;
<http://statistics.gov.scot/def/measure-properties/percent> ?percent;
sdmx:refArea ?areaURI.

?ageURI rdfs:label ?age.
?yearURI rdfs:label ?year.
?genderURI rdfs:label ?gender.
?servicesperformanceURI rdfs:label ?servicesperformance.
?simdURI rdfs:label ?simd.
?urbanruralURI rdfs:label ?urbanrural.
?areaURI rdfs:label ?area.
}

ORDER BY ?year'

rawData <- SPARQL(SparqlDataEndpoint, SparqlDataQuery, format = "csv")
Unfiltered <- rawData$results

SparqlDataQueryNeighbourhood <- 'PREFIX qb: <http://purl.org/linked-data/cube#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX dim: <http://statistics.gov.scot/def/dimension/>
  PREFIX sdmx: <http://purl.org/linked-data/sdmx/2009/dimension#>

SELECT ?year ?area ?ethnicity ?gender ?householdType ?neighbourhoodRating ?simdQuintiles ?typeOfTenure ?urbanRuralClassification ?walkingDistanceToNearestGreenspace ?95lowerCI ?95upperCI ?percent
WHERE { 
  ?s qb:dataSet <http://statistics.gov.scot/data/neighbourhood-rating---shs>; 
  sdmx:refPeriod ?yearURI;
  sdmx:refArea ?areaURI;
  dim:ethnicity ?ethnicityURI;
  dim:gender ?genderURI;
  dim:householdType ?householdTypeURI;
  dim:neighbourhoodRating ?neighbourhoodRatingURI;
  dim:simdQuintiles ?simdQuintilesURI;
  dim:typeOfTenure ?typeOfTenureURI;
  dim:urbanRuralClassification ?urbanRuralClassificationURI;
  dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
  <http://statistics.gov.scot/def/measure-properties/95-lower-confidence-limit-percent> ?95lowerCI.
  
  ?t qb:dataSet <http://statistics.gov.scot/data/neighbourhood-rating---shs>; 
  sdmx:refPeriod ?yearURI;
  sdmx:refArea ?areaURI;
  dim:ethnicity ?ethnicityURI;
  dim:gender ?genderURI;
  dim:householdType ?householdTypeURI;
  dim:neighbourhoodRating ?neighbourhoodRatingURI;
  dim:simdQuintiles ?simdQuintilesURI;
  dim:typeOfTenure ?typeOfTenureURI;
  dim:urbanRuralClassification ?urbanRuralClassificationURI;
  dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
  <http://statistics.gov.scot/def/measure-properties/95-upper-confidence-limit-percent> ?95upperCI.
  
  ?u qb:dataSet <http://statistics.gov.scot/data/neighbourhood-rating---shs>; 
  sdmx:refPeriod ?yearURI;
  sdmx:refArea ?areaURI;
  dim:ethnicity ?ethnicityURI;
  dim:gender ?genderURI;
  dim:householdType ?householdTypeURI;
  dim:neighbourhoodRating ?neighbourhoodRatingURI;
  dim:simdQuintiles ?simdQuintilesURI;
  dim:typeOfTenure ?typeOfTenureURI;
  dim:urbanRuralClassification ?urbanRuralClassificationURI;
  dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
  <http://statistics.gov.scot/def/measure-properties/percent> ?percent. 
  
  
  ?yearURI rdfs:label ?year.
  ?areaURI rdfs:label ?area.
  ?ethnicityURI rdfs:label ?ethnicity.
  ?genderURI rdfs:label ?gender.
  ?householdTypeURI rdfs:label ?householdType.
  ?neighbourhoodRatingURI rdfs:label ?neighbourhoodRating.
  ?simdQuintilesURI rdfs:label ?simdQuintiles.
  ?typeOfTenureURI rdfs:label ?typeOfTenure.
  ?urbanRuralClassificationURI rdfs:label ?urbanRuralClassification.
  ?walkingDistanceToNearestGreenspaceURI rdfs:label ?walkingDistanceToNearestGreenspace.
}'

rawDataNeighbourhood <- SPARQL(SparqlDataEndpoint, SparqlDataQueryNeighbourhood, format = "csv")
UnfilteredNeighbourhood <- rawDataNeighbourhood$results

SparqlDataQueryCommbel <- "PREFIX qb: <http://purl.org/linked-data/cube#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX dim: <http://statistics.gov.scot/def/dimension/>
PREFIX sdmx: <http://purl.org/linked-data/sdmx/2009/dimension#>

SELECT ?year ?area ?ethnicity ?gender ?householdType ?communityBelonging ?simdQuintiles ?typeOfTenure ?urbanRuralClassification ?walkingDistanceToNearestGreenspace ?95lowerCI ?95upperCI ?percent
WHERE { 
?s qb:dataSet <http://statistics.gov.scot/data/community-belonging---shs>; 
sdmx:refPeriod ?yearURI;
sdmx:refArea ?areaURI;
dim:ethnicity ?ethnicityURI;
dim:gender ?genderURI;
dim:householdType ?householdTypeURI;
dim:communityBelonging ?communityBelongingURI;
dim:simdQuintiles ?simdQuintilesURI;
dim:typeOfTenure ?typeOfTenureURI;
dim:urbanRuralClassification ?urbanRuralClassificationURI;
dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
<http://statistics.gov.scot/def/measure-properties/95-lower-confidence-limit-percent> ?95lowerCI.

?t qb:dataSet <http://statistics.gov.scot/data/community-belonging---shs>; 
sdmx:refPeriod ?yearURI;
sdmx:refArea ?areaURI;
dim:ethnicity ?ethnicityURI;
dim:gender ?genderURI;
dim:householdType ?householdTypeURI;
dim:communityBelonging ?communityBelongingURI;
dim:simdQuintiles ?simdQuintilesURI;
dim:typeOfTenure ?typeOfTenureURI;
dim:urbanRuralClassification ?urbanRuralClassificationURI;
dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
<http://statistics.gov.scot/def/measure-properties/95-upper-confidence-limit-percent> ?95upperCI.

?u qb:dataSet <http://statistics.gov.scot/data/community-belonging---shs>; 
sdmx:refPeriod ?yearURI;
sdmx:refArea ?areaURI;
dim:ethnicity ?ethnicityURI;
dim:gender ?genderURI;
dim:householdType ?householdTypeURI;
dim:communityBelonging ?communityBelongingURI;
dim:simdQuintiles ?simdQuintilesURI;
dim:typeOfTenure ?typeOfTenureURI;
dim:urbanRuralClassification ?urbanRuralClassificationURI;
dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
<http://statistics.gov.scot/def/measure-properties/percent> ?percent. 


?yearURI rdfs:label ?year.
?areaURI rdfs:label ?area.
?ethnicityURI rdfs:label ?ethnicity.
?genderURI rdfs:label ?gender.
?householdTypeURI rdfs:label ?householdType.
?communityBelongingURI rdfs:label ?communityBelonging.
?simdQuintilesURI rdfs:label ?simdQuintiles.
?typeOfTenureURI rdfs:label ?typeOfTenure.
?urbanRuralClassificationURI rdfs:label ?urbanRuralClassification.
?walkingDistanceToNearestGreenspaceURI rdfs:label ?walkingDistanceToNearestGreenspace.
}"

rawDataCommbel <- SPARQL(SparqlDataEndpoint, SparqlDataQueryCommbel, format = "csv")
UnfilteredCommbel <- rawDataCommbel$results

SparqlDataQueryArimp <- "PREFIX qb: <http://purl.org/linked-data/cube#> 
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX dim: <http://statistics.gov.scot/def/dimension/>
PREFIX sdmx: <http://purl.org/linked-data/sdmx/2009/dimension#>

SELECT ?year ?area ?ethnicity ?gender ?householdType ?localNeighbourhoodImprovement ?simdQuintiles ?typeOfTenure ?urbanRuralClassification ?walkingDistanceToNearestGreenspace ?95lowerCI ?95upperCI ?percent
WHERE { 
?s qb:dataSet <http://statistics.gov.scot/data/area-improvement---shs>; 
sdmx:refPeriod ?yearURI;
sdmx:refArea ?areaURI;
dim:ethnicity ?ethnicityURI;
dim:gender ?genderURI;
dim:householdType ?householdTypeURI;
dim:localNeighbourhoodImprovement ?localNeighbourhoodImprovementURI;
dim:simdQuintiles ?simdQuintilesURI;
dim:typeOfTenure ?typeOfTenureURI;
dim:urbanRuralClassification ?urbanRuralClassificationURI;
dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
<http://statistics.gov.scot/def/measure-properties/95-lower-confidence-limit-percent> ?95lowerCI.

?t qb:dataSet <http://statistics.gov.scot/data/area-improvement---shs>; 
sdmx:refPeriod ?yearURI;
sdmx:refArea ?areaURI;
dim:ethnicity ?ethnicityURI;
dim:gender ?genderURI;
dim:householdType ?householdTypeURI;
dim:localNeighbourhoodImprovement ?localNeighbourhoodImprovementURI;
dim:simdQuintiles ?simdQuintilesURI;
dim:typeOfTenure ?typeOfTenureURI;
dim:urbanRuralClassification ?urbanRuralClassificationURI;
dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
<http://statistics.gov.scot/def/measure-properties/95-upper-confidence-limit-percent> ?95upperCI.

?u qb:dataSet <http://statistics.gov.scot/data/area-improvement---shs>; 
sdmx:refPeriod ?yearURI;
sdmx:refArea ?areaURI;
dim:ethnicity ?ethnicityURI;
dim:gender ?genderURI;
dim:householdType ?householdTypeURI;
dim:localNeighbourhoodImprovement ?localNeighbourhoodImprovementURI;
dim:simdQuintiles ?simdQuintilesURI;
dim:typeOfTenure ?typeOfTenureURI;
dim:urbanRuralClassification ?urbanRuralClassificationURI;
dim:walkingDistanceToNearestGreenspace ?walkingDistanceToNearestGreenspaceURI;
<http://statistics.gov.scot/def/measure-properties/percent> ?percent. 


?yearURI rdfs:label ?year.
?areaURI rdfs:label ?area.
?ethnicityURI rdfs:label ?ethnicity.
?genderURI rdfs:label ?gender.
?householdTypeURI rdfs:label ?householdType.
?localNeighbourhoodImprovementURI rdfs:label ?localNeighbourhoodImprovement.
?simdQuintilesURI rdfs:label ?simdQuintiles.
?typeOfTenureURI rdfs:label ?typeOfTenure.
?urbanRuralClassificationURI rdfs:label ?urbanRuralClassification.
?walkingDistanceToNearestGreenspaceURI rdfs:label ?walkingDistanceToNearestGreenspace.
}"

rawDataArimp <- SPARQL(SparqlDataEndpoint, SparqlDataQueryArimp, format = "csv")
UnfilteredArimp <- rawDataArimp$results



