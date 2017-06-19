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
names = c("State_Code", "County_Code", "Census_Tract_Number", "NUM_ALL", "NUM_FHA", "PCT_NUM_FHA", "AMT_ALL", "AMT_FHA", "PCT_AMT_FHA")
df = as.data.frame(na.omit(read_csv("~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/Data/fha_by_tract.csv", col_names = names)))
head(df)

df$GEOID = with(df, ((as.numeric(Census_Tract_Number) * 100) + (10 ^ 6 * as.numeric(County_Code)) + (10 ^ 9 * as.numeric(State_Code))))
head(df)

df$GEOID = NULL # ma perche' dovrei droppare una colonna?
df = df[-c(2, 4),] # droppo righe 2 e 4

# Indici su data frame
library(data.table)
dt <- as.data.table(df)
setkey(dt, State_Code, County_Code)
head(dt)
data.frame(unclass(summary(dt)))

str(df)

library(psych)
describeBy(df, df$PCT_AMT_FHA)
hist(df$PCT_AMT_FHA, breaks = 50, col = rgb(1, 0, 0, 0.5))

df$LOG_AMT_ALL = log1p(df$AMT_ALL)

## Indexing data frames

head(df$State_Code)

head(c('State_Code', 'County_Code'))

str(df$State_Code)

df[, 4]

df[3, 'State_Code']

df[0:3, "State_Code":'Census_Tract_Number'] ############## rivedere

df[3, 0]

df[0:3, 0:3]

#filtering data

head(subset(df, State_Code == 33))
head(subset(df, State_Code == 33 | Census_Tract_Number == 9613))
df[State_Code == 33] ########### rivedere

#joining data

df2 = read_csv('~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/Data/2013_Gaz_tracts_national.csv', sep = '\t')
df2 = as.data.frame(na.omit(read_tsv("~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/Data/2013_Gaz_tracts_national.tsv", col_names = T)))
head(df2)
df_joined = merge(df1, df2, by = 'GEOID') ####################rivedere
head(df_joined)

#aggregating data
dfag = aggregate(df, by = 'USPS')
dfag

#sorting by indices and columns

d$index <- as.numeric(row.names(df))
df[order(d$index),]

df[order('AMT_FHA'),]

# Unique values
unique(df)
# df['State_Code'].value_counts().head() - boh?
# df['State_Code'].isin(df['State_Code'] .head(3)) .head() - boh?

## Handling missing and NA data
df[is.na(df)]
dfnaomit = df[na.omit[df]]
dfna0 = df[is.na(df)] <- 0
#usare ZOO

## Manipulating strings
dfstring <- df[grep("stringa", df$AMT_FHA),]

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

## Function application and mapping
testFunc <- function(a, b) a + b
apply(dat[, c('x', 'z')], 1, function(y) testFunc(y['z'], y['x']))


### Pandas HTML data import example
library(htmltab)
library(stringi)

url <- "http://en.wikipedia.org/wiki/List_of_tallest_buildings_and_structures_in_the_world"
tallest <- htmltab(doc = url, which = 3)
tl = t(as.data.table(stri_extract_all(tallest$Coordinates, regex = "-?\\d{1,3}+\\.?\\d{4,6}")))
tallest$Latitude = tl[, 3]
tallest$Longitude = tl[, 4]
head(tallest)

cleancord = function(string) {
pattern = ""
}

## Pandas Timestamps
Sys.setlocale("LC_TIME", "C")
as.POSIXlt("July 4, 2016", format = "%B %d, %Y")
as.POSIXlt('Monday, July 4, 2016', format = "%A, %B %d, %Y")
as.POSIXlt('Tuesday, July 4th, 2016', format = "%A, %B %dth, %Y")
as.POSIXlt('Monday, July 4th, 2016 05:00 PM', format = "%A, %B %dth, %Y %I:%M %p")
as.POSIXlt('04/07/2016T17:20:13.123456', format = "%d/%m/%YT%H:%M:%OS")
as.Date(as.POSIXlt(1467651600000000000 / 1000000000, origin = "1970-01-01"))

july4 = pd.Timestamp('Monday, July 4th, 2016 05:00 PM') .tz_localize('US/Eastern')
labor_day = pd.Timestamp('9/5/2016 12:00', tz = 'US/Eastern')
thanksgiving = pd.Timestamp('11/24/2016 16:00') # no timezone

labor_day - july4

july4 + 5
july4
july4
july4

library(bizdays)
create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays = c("saturday", "sunday"))
business_days = bizseq('2016-01-01', '2016-12-31', "Brazil/ANBIMA")

d <- c("2009-03-07 12:00", "2009-03-08 12:00", "2009-03-28 12:00", "2009-03-29 12:00", "2009-10-24 12:00", "2009-10-25 12:00", "2009-10-31 12:00", "2009-11-01 12:00")
t1 <- as.POSIXct(d, "America/Los_Angeles")
cbind(US = format(t1), UK = format(t1, tz = "Europe/London"))

## Multi-indices, stacking, and pivot tables


## Plugging into more advanced analytics
df$AMT_FHA
setkey(dt, group)
system.time(dt[, list(mean = mean(age), sd = sd(age)), by = group])

╗┐ / ´╗┐