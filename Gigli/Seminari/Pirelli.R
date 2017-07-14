library(tidyverse)
library(magrittr)
library(forecast)
library(tseries)

#Use dplyr functions and the pipe operator to return
#just the Species name, mean Petal.Width and mean Petal.
#Length of the Species with the largest difference between mean
#Petal.Width and mean Petal.Length

head(iris)


# esercizio fine little_journey_through_the_tidyverse
irisexe <- group_by(iris, Species) %>%
summarise(specie, avgwid = mean(Petal.Width) && avglen = mean(Petal.Lenght)) %>%
mutate(diff = avg_length - avg_width) %>%
filter(diff = max(diff))
# da fixare

forecast

