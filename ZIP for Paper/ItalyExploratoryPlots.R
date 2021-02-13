# load data and packages
source("ReadAllData1.R")
library(tidyverse)

# get all environmental plus rt and mobility
test_longer <-gather(italy_25, measurement, value, c(2:7,13,14,17))
test_longer$Date <- test_longer$date

# set names of facets
test_longer$measurement <- factor(test_longer$measurement, levels = c("daily_cases", "homer", 
                                                                      "med_hum", "med_temp",
                                                                      "no2", "o3", "pm10", 
                                                                      "pm25", "rt"), 
                                  labels = c(expression(paste("Daily Cases")), "Mobility", "Humidity", "Temperature",
                                             expression(NO[2]), expression(O[3]), pm10 = expression(PM[10]),
                                             expression(PM[2.5]), expression(R[t])))

# plot all 9 variables
ggplot(test_longer, aes(x = date, y = value, group = province_name, color = region)) + 
  geom_line() + facet_wrap(.~measurement, scales = "free_y", labeller = label_parsed) + 
  ggtitle("Italy") + theme_bw() +  theme(legend.position = "bottom", text = element_text(size = 14)) + 
  labs(x = "Date", y = "Value", color = "Region") + 
  scale_color_brewer(palette = "Set1") + guides(color = guide_legend(override.aes = list(size = 1.5)))


# get only vars used in model
test_longer <-gather(italy_25, measurement, value, c(2:5,13,14))
test_longer$Date <- test_longer$date

# set names of facets
test_longer$measurement <- factor(test_longer$measurement, levels = c("daily_cases", "homer", 
                                                                      "med_hum", "med_temp",
                                                                      "pm25", "rt"), 
                                  labels = c(expression(paste("Daily Cases")), "Mobility", "Humidity", "Temperature",
                                             expression(PM[2.5]), expression(R[t])))

# plot variables in model
ggplot(test_longer, aes(x = date, y = value, group = province_name, color = region)) + 
  geom_line() + facet_wrap(.~measurement, scales = "free_y", labeller = label_parsed) + 
  ggtitle("Italy") + theme_bw() +  theme(legend.position = "bottom", text = element_text(size = 14)) + 
  labs(x = "Date", y = "Value", color = "Region") + 
  scale_color_brewer(palette = "Set1") + guides(color = guide_legend(override.aes = list(size = 1.5)))


