# Librerie da installare
install.packages(c('httr', 'readr', 'data.table', 'psych', 'htmltab', 'stringi', 'bizdays', 'stringr', 'dyplr', 'timeDate'))

# Parte 1 - prendere i dati

library(httr)

WScall <- function(endpoint, parameters) {
    result <- GET(endpoint, query = parameters)
    return(result)
}

ad <- "1600 Pennsylvania Avenue, Washington, DC"
urla <- "http://nominatim.openstreetmap.org/search"
paramA <- list(q = ad, addressdetails = 1, format = "json")

resA <- WScall(urla, paramA)

if (resA$status_code == 200) {
    adrjson <- content(resA, as = "parsed")
    lat = adrjson[[1]]$lat
    lon = adrjson[[1]]$lon
}

urlw <- "http://forecast.weather.gov/MapClick.php"
paramW <- list(lat = lat, lon = lon, FcstType = "json")

resW <- WScall(urlw, paramW)

if (resW$status_code == 200) {
    weajson <- content(resW, as = "parsed")
    weajson$currentobservation
}

# Parte 2 - giocare con i dati


## Nouns (objects) in Pandas
### Data Frames

number = c(1, 2, 3)
animal = c('cat', 'dog', 'mouse')
df1 = data.frame(number, animal)
df1

df1$animal

## Verbs (operations) in Pandas
## Loading data (and basic statistics / visualization)
library(readr)
library(data.table)
names = c("State_Code", "County_Code", "Census_Tract_Number", "NUM_ALL", "NUM_FHA", "PCT_NUM_FHA", "AMT_ALL", "AMT_FHA", "PCT_AMT_FHA")
dt = as.data.table(read_csv("~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/Data/fha_by_tract.csv", col_names = names))
head(dt)

dt$GEOID = as.character(with(dt, as.numeric(Census_Tract_Number) * 100 + 10 ^ 6 * as.numeric(County_Code) + 10 ^ 9 * as.numeric(State_Code)  ))
head(dt)

df$GEOID = NULL # ma perche' dovrei droppare una colonna?
df = dt[-1,]

# Indici su data frame
setkey(dt, State_Code, County_Code)
head(dt)
data.frame(unclass(summary(dt)))

str(df)

library(psych)
describeBy(dt, df$PCT_AMT_FHA)
describeBy(dt)
hist(dt$PCT_AMT_FHA, col = rgb(1, 0, 0, 0.5))

dt$LOG_AMT_ALL = log1p(df$AMT_ALL)
hist(dt$LOG_AMT_ALL, col = rgb(1, 0, 0, 0.5))

## Indexing data frames

head(dt$State_Code)

head(dt[,c(State_Code, County_Code)])
head(dt[, County_Code, keyby = State_Code])
str(df$State_Code)

dt[12550,]

dt[12550, 'State_Code']

dt[12545:12550, County_Code, keyby = State_Code]

dt[3, 5]

dt[3:5, 2:4]

#filtering data

head(subset(dt, State_Code == 33))
head(subset(dt, (State_Code == 33) | (Census_Tract_Number == 9613)))
dt[State_Code == 33]

#joining data

dt2 = as.data.table(read_tsv("~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/Data/2013_Gaz_tracts_national.tsv", col_names = T))
head(dt2)
dt_joined = dt[dt2, on = "GEOID"]
head(dt_joined)

#aggregating data
usps_groups = dt_joined[, sum(ALAND), by = USPS]
usps_groups

#sorting by indices and columns

dtbystate = dt[order(State_Code)]
dtbyAMTFHA = dt[order(AMT_FHA)]

# Unique values
head(unique(dt))
nrow(unique(dt))


## Handling missing and NA data    --- POTENZIALMENTE ESPANDIBILE
head(is.na(dt))
naomit = na.omit(dt)
dt[is.na(dt)] <- 0

## Manipulating strings
library(stringr)
library(dplyr)

dtstring = dt_joined %>% filter(str_detect(USPS, "A"))

## Indices in Pandas
s1 <- c(1, 2, 3)
names(s1) = c('a', 'b', 'c')
s2 <- c(3, 2, 1)
names(s2) = c('c', 'b', 'a')
s1 + s2
s3 <- c(3, 2, 1)
names(s3) = c('c', 'd', 'e')
s1 + s3
append(s1, s3)

## Function application and mapping       ---- VEDERE
testFunc <- function(a, b) a + b
apply(dat[, c('x', 'z')], 1, function(y) testFunc(y['z'], y['x']))


### Pandas HTML data import example     
library(htmltab)
library(stringi)
require(data.table)
url <- "http://en.wikipedia.org/wiki/List_of_tallest_buildings_and_structures_in_the_world"
tallest <- htmltab(doc = url, which = 3)
tl = t(as.data.table(stri_extract_all(tallest$Coordinates, regex = "-?\\d{1,3}+\\.?\\d{4,6}")))
tallest$Latitude = tl[, 3]
tallest$Longitude = tl[, 4]
rm(tl)
head(tallest)


## Pandas Timestamps
Sys.setlocale("LC_TIME", "C")
as.POSIXlt("July 4, 2016", format = "%B %d, %Y")
as.POSIXlt('Monday, July 4, 2016', format = "%A, %B %d, %Y")
as.POSIXlt('Tuesday, July 4th, 2016', format = "%A, %B %dth, %Y")
as.POSIXlt('Monday, July 4th, 2016 05:00 PM', format = "%A, %B %dth, %Y %I:%M %p")
as.POSIXlt('04/07/2016T17:20:13.123456', format = "%d/%m/%YT%H:%M:%OS")
as.Date(as.POSIXlt(1467651600000000000 / 1000000000, origin = "1970-01-01"))

july4 = as.POSIXct('Monday, July 4th, 2016 05:00 PM', format = "%A, %B %dth, %Y %I:%M %p", tz = "US/Eastern")
labor_day = as.POSIXct('9/5/2016 12:00', format = "%d/%m/%Y %H:%M", tz = "US/Eastern")
thanksgiving = as.POSIXct('11/24/2016 16:00', format = "%m/%d/%Y %H:%M")

labor_day - july4
library(bizdays)
add.bizdays(july4,5)
add.bizdays(july4, -1)

library(timeDate)
if (is.bizday(timeLastDayInMonth(july4)) = TRUE) {
timeLastDayInMonth(july4)       # Migliorabile!
}

require(bizdays)
create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays = c("saturday", "sunday"))
business_days = bizseq('2016-01-01', '2016-12-31', "Brazil/ANBIMA")
business_days

dtimed = data.table(x = business_days, y = seq(1, length(business_days)))
setkey(dtimed, x)

d <- c("2009-03-07 12:00", "2009-03-08 12:00", "2009-03-28 12:00", "2009-03-29 12:00", "2009-10-24 12:00", "2009-10-25 12:00", "2009-10-31 12:00", "2009-11-01 12:00")
t1 <- as.POSIXct(d, "America/Los_Angeles")
cbind(US = format(t1), UK = format(t1, tz = "Europe/London"))

## Multi-indices, stacking, and pivot tables       ---- CESTINATO

 dt_joined[, list(sumNUM = sum('NUM_ALL'), sumFHA = sum('NUM_FHA')), by = .('State_Code', 'County_Code')]