# Relationship Between Air Quality and COVID-19
Code and data necessary to reproduce work presented in our paper "Investigating the Relationship between Air Quality and COVID-19". 

## Running the Code
`ReadAllData1.R` is used to read in data from the .csv files provided in the Data folder. In `RunGAMs.Rmd`, GAMs are created by city and by state, and Figure 3 is generated. In `CityGAMPlots.Rmd`, GAMS are created for each city (CITYNAME_gam) and state (STATENAME_gam). Creates Figures 4, 5. In `ItalyExploratoryPlots.R`, Figure 2 is created. Finally, in `ExcludeOneGAM.Rmd`, we exclude each city to create a GAM (CITYNAME_exclude_gam) and then use this GAM to predict the cases in the excluded city; plots are provided in this notebook. To ensure proper variables are available, `RunGAMs.Rmd` should be run first.
## Data
All data is provided in the Data folder. Temperature and relative humidity were collected from the NOAA Integrated surface Database; PM<sub>2.5</sub> was downloaded from the World Air Quality Index; mobility data was found at Google Community Mobility Reports; test results and case counts were collected from the Italian Department of Civil Protection; Rt was calculated using the open source model rt.live. Variables are as follows:

| Variable    | Description                                                                                                 |
|-------------|-------------------------------------------------------------------------------------------------------------|
| date        | YYYY-MM-DD format                                                                                           |
| daily_cases | Positive COVID-19 tests                                                                                     |
| med_temp    | Median temperature (<sup>o</sup>F)                                                                          |
| med_hum     | Median relative humidity (%)                                                                                |
| pm25        | Median density of PM<sub>2.5</sub> (µg/m<sup>3</sup>)                                                       |
| pm10        | Median density of PM<sub>10</sub> (µg/m<sup>3</sup>)                                                        |
| o3          | Median density of O<sub>3</sub> (µg/m<sup>3</sup>)                                                          |
| no2         | Median density of NO<sub>2</sub> (µg/m<sup>3</sup>)                                                         |
| so2         | Median density of SO<sub>2</sub> (µg/m<sup>3</sup>)                                                         |
| retail      | Change in visits to retail and recreational locations (%)                                                   |
| grocery     | Change in visits to grocery stores and pharmacies (%)                                                       |
| parks       | Change in visits to parks (%)                                                                               |
| transit     | Change in visits to transit stations (%)                                                                    |
| work        | Change in visits to workplaces (%)                                                                          |
| home        | Change in visits to residential areas (%)                                                                   |
| rt          | Median estimate of the effective reproduction number from <a href="http://rt.live"> rt.live </a>            |
| region      | Region where the province is located                                                                        |
