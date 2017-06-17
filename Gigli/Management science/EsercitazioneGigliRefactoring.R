# Parte 1 - prendere i dati

library(jsonlite)
library(urltools)

address = "1600+Pennsylvania+Avenue,+Washington,+DC"

urla <- "http://nominatim.openstreetmap.org/search?q=bla&format=json"
urla <- param_set(url, key = "q", value = address)

# read url and convert to data.frame
jsonaddress = fromJSON(readLines(url)[1])

lat= jsonaddress[[1]]$lat
lon= jsonaddress[[1]]$lon

urlw <- "http://forecast.weather.gov/MapClick.php?lat=1&lon=2&FcstType=json"
urlw <- param_set(url, key = "lat", value = lat)
urlw <- param_set(url, key = "lon", value = lon)

jsonweather = fromJSON(readLines(urlw)[1])

# Parte 2 - giocare con i dati

number = c(1, 2, 3)
animal = c('cat', 'dog', 'mouse')
df1 = data.frame(number,animal)

df1$animal
str(df1)

df2 = t(df1)

names = c("State_Code", "County_Code", "Census_Tract_Number", "NUM_ALL", "NUM_FHA", "PCT_NUM_FHA", "AMT_ALL", "AMT_FHA", "PCT_AMT_FHA")
df = read_csv('small_data/fha_by_tract.csv', names=names)  # Manca il csv nella cartella di dropbox!
df.head(3)

df$GEOID = df$Census_Tract_Number*100 + 10**6 * df$County_Code + 10**9 * df$State_Code
df.head()

# df$GEOID = NULL - ma perche' dovrei droppare una colonna?

rownames(df) <- df$State_Code #assegna indici al dataframe, multiindex con workaround non raccomandabile
rownames(df) = NULL #rimuovi indici?

library(psych)
describeBy(df, df$PCT_AMT_FHA)
hist(df$PCT_AMT_FHA, breaks=50, col=rgb(1,0,0,0.5))

df$LOG_AMT_ALL = log1p(df$AMT_ALL)

#indexing data frames

head(df$State_Code)

head(c('State_Code', 'County_Code'))

str(df$State_Code)

df[,4]

df[3, 'State_Code']

df[0:3,"State_Code":'Census_Tract_Number']

df[3,0]

df[0:3,0:3]

#filtering data

head(subset(df, State_Code == 1 ))
head(subset(df, State_Code == 1 | Census_Tract_Number == 9613 ))
head(df[df$State_Code == 5])

#joining data

df2 = read_csv('small_data/2013_Gaz_tracts_national.tsv', sep='\t')  # Manca il csv nella cartella di dropbox!
head(df2)
df_joined = marge(df1, df2, by = 'GEOID')
head(df_joined)

#aggregating data
dfag = aggregate(df, by='USPS')
dfag

#sorting by indices and columns

#per indice
d$index <- as.numeric(row.names(df))
df[order(d$index), ]

#per colonna
df[order('AMT_FHA'),]
