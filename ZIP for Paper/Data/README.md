## Quick rundown
Combined Data -- The folder with the full data (one file for each city) <br />
AQ Data -- The folder with Air Quality data downloaded from aciqcn.org (variables vary, but they all include PM2.5)<br />
NOAA Data -- The folder with meteorological data (Temperature and Relative Humidity)<br />
Rt1 -- The folder with Rt calculated from rt.live (see https://github.com/rtcovidlive/covid-model)<br />
Rt2 -- The folder with Rt calculated from epiforcasts.io (see https://github.com/epiforecasts/covid)<br />
italy_covid_data -- Time series of covid cases for each city<br />
Italy_Mobility_Report -- Google mobility data for each city<br />
get_noaa -- R script that gets updated NOAA data<br />
Combine Data -- Matlab script that combines AQ Data, NOAA Data, Rt1 Data, and Rt2 Data<br />

| Variable    | Description                                                                                                 |
|-------------|-------------------------------------------------------------------------------------------------------------|
| date        | YYYY-MM-DD format                                                                                           |
| daily_cases | Positive tests reported by the Italian Department of Civil Protection (https://github.com/pcm-dpc/COVID-19) |
| med_temp    | Median temperature (degrees Fahrenheit)                                                                     |
| med_hum     | Median relative humidity (%)                                                                                |
| pm25        | Median density of PM_{2.5} (micrograms per meter cubed)                                                     |
| pm10        | Median density of PM_{10} (micrograms per meter cubed)                                                      |
| o3          | Median density of O_3 (micrograms per meter cubed)                                                          |
| no2         | Median density of NO_2 (micrograms per meter cubed)                                                         |
| so2         | Median density of SO_2 (micrograms per meter cubed)                                                         |
