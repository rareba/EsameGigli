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

number = c(1, 2, 3)
animal = c('cat', 'dog', 'mouse')
df1 = data.frame(number, animal)

df1$animal
str(df1)

df2 = t(df1)

names = c("State_Code", "County_Code", "Census_Tract_Number", "NUM_ALL", "NUM_FHA", "PCT_NUM_FHA", "AMT_ALL", "AMT_FHA", "PCT_AMT_FHA")
df = read_csv('small_data/fha_by_tract.csv', names = names) # Manca il csv nella cartella di dropbox!
df.head(3)

df$GEOID = df$Census_Tract_Number * 100 + 10 ** 6 * df$County_Code + 10 ** 9 * df$State_Code
df.head()

# df$GEOID = NULL - ma perche' dovrei droppare una colonna?

rownames(df) <- df$State_Code #assegna indici al dataframe, multiindex con workaround non raccomandabile
rownames(df) = NULL #rimuovi indici?

library(psych)
describeBy(df, df$PCT_AMT_FHA)
hist(df$PCT_AMT_FHA, breaks = 50, col = rgb(1, 0, 0, 0.5))

df$LOG_AMT_ALL = log1p(df$AMT_ALL)

#indexing data frames

head(df$State_Code)

head(c('State_Code', 'County_Code'))

str(df$State_Code)

df[, 4]

df[3, 'State_Code']

df[0:3, "State_Code":'Census_Tract_Number']

df[3, 0]

df[0:3, 0:3]

#filtering data

head(subset(df, State_Code == 1))
head(subset(df, State_Code == 1 | Census_Tract_Number == 9613))
head(df[df$State_Code == 5])

#joining data

df2 = read_csv('small_data/2013_Gaz_tracts_national.csv', sep = '\t') # Manca il csv nella cartella di dropbox!
head(df2)
df_joined = marge(df1, df2, by = 'GEOID')
head(df_joined)

#aggregating data
dfag = aggregate(df, by = 'USPS')
dfag

#sorting by indices and columns

#per indice
d$index <- as.numeric(row.names(df))
df[order(d$index),]

#per colonna
df[order('AMT_FHA'),]

# Unique values
unique(df)
# df['State_Code'].value_counts().head() - boh?
# df['State_Code'] .isin(df['State_Code'] .head(3)) .head() - boh?

## Handling missing and NA data
df[is.na(df)]
dfnaomit = df[na.omit[df]]
dfna0 = df[is.na(df)] <- 0

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