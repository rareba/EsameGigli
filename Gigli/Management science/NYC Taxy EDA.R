setwd("~/Visual Studio 2017/Projects/MABIDA2017/Gigli/Management science/Data")

library(psych)
library(dplyr)
library(ggmap)

multi.fun <- function(x) {
  cbind(freq = table(x), 
        percentage = prop.table(table(x)))
  }

#read fare_data_4
data_fares <- read.csv("trip_fare_4.csv",
                       sep = ',', 
                       header = 1, 
                       nrows = 10000)
head(data_fares)

#remove columns I'n not going to use in the following
data_fares$medallion<-NULL
data_fares$vendor_id<-NULL

summary(data_fares)

#read trip_data_4
data_trip<-read.csv("trip_data_4.csv",sep=',', header=1, nrows = 30000)
head(data_trip)

#remove columns I'n not going to use in the following
data_trip$medallion<-NULL
data_trip$vendor_id<-NULL
data_trip$store_and_fwd_flag<-NULL
data_trip$rate_code<-NULL

summary(data_trip)

#CLEAN DATA

#exclude trip with time less than 60 seconds
data_trip<-data_trip[(data_trip$trip_time_in_secs)>60,]

#exclude trip with distance less than 0.3 miles
data_trip<-data_trip[(data_trip$trip_distance)>0.3,]

#work on a selection of the NYC area if the following command is uncommented
data_trip<-data_trip[(data_trip$pickup_latitude>(40.62)& data_trip$pickup_latitude<40.9 &
                        data_trip$pickup_longitude>(-74.1) & data_trip$pickup_longitude<(-73.75) &
                        data_trip$dropoff_latitude>(40.62)& data_trip$dropoff_latitude<40.9 &
                        data_trip$dropoff_longitude>(-74.1) & data_trip$dropoff_longitude<(-73.75)),]

#create a column for pickup_hour
data_trip$pickup_hour<-as.POSIXlt(data_trip$pickup_datetime)$hour

#create a column for dropoff_hour
data_trip$dropoff_hour<-as.POSIXlt(data_trip$dropoff_datetime)$hour

#create a column for counting
data_trip$ones<-1

summary(data_trip)

###############################################################
#a.     What is the distribution of number of passengers per trip?
###############################################################

summary(data_trip$passenger_count)
hist(data_trip$passenger_count)

hist(data_trip$passenger_count,
     10,
     main="Distribution of Number of Passengers per Trip",
     xlab="Number of Passengers p/Trip")

rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_trip$passenger_count,10, add = TRUE,col="yellow")

#other statistics on customer habits

summary(data_trip$trip_time_in_secs/60)
hist(data_trip$trip_time_in_secs/60,10,xlim=c(0,100),
     main="Distribution of Trip Time",
     xlab="Trip Time in minutes")

#rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
#hist(data_trip$trip_time_in_secs/60,10, add = TRUE,col="yellow")

summary(data_trip$trip_distance)
hist(data_trip$trip_distance,10,xlim=c(0,40),
     main="Distribution of Trip Distance",
     xlab="Trip Distance")

#rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
#hist(data_trip$trip_distance,10, add = TRUE,col="yellow")


###############################################################
#b.     What is the distribution of payment_type?
###############################################################

summary(data_fares$payment_type)

mop<-multi.fun(data_fares$payment_type)
mop

barplot(sort(mop[,2], decreasing = TRUE),ylim=c(0,0.8), xaxt = 'n')
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
barplot(sort(mop[,2], decreasing = TRUE),add = TRUE,col="yellow",
        main="Distribution of Payement Type",
        ylab="Frequency")

###############################################################
#c.     What is the distribution of fare amount?
###############################################################

summary(data_fares$fare_amount)

#histogram on full domain
hist(data_fares$fare_amount,
     main="Distribution of Fare Amount",
     xlab="Fare Amount")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_fares$fare_amount,add = TRUE,col="yellow")

#histogram on restricted domain
hist(data_fares$fare_amount,xlim=c(0,80),200,
     main="Distribution of Fare Amount",
     xlab="Fare Amount")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_fares$fare_amount,200, xlim=c(0,80),add = TRUE,col="yellow")

# hist(log(data_fares$fare_amount))
# rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
# hist(log(data_fares$fare_amount),add = TRUE,col="yellow",
#      main="Distribution of Fare Amount",
#      xlab="Fare Amount")

###############################################################
#d.     What is the distribution of tip amount?
###############################################################

summary(data_fares$tip_amount)

#histogram on full domain
hist(data_fares$tip_amount,
     main="Distribution of Tip Amount",
     xlab="Tip Amount")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_fares$tip_amount,add = TRUE,col="yellow")

#histogram on restricted domain
hist(data_fares$tip_amount,200,xlim=c(0,20),
     main="Distribution of Tip Amount",
     xlab="Tip Amount")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_fares$tip_amount,200,xlim=c(0,20),add = TRUE,col="yellow")

#histogram on full domain
hist(data_fares$total_amount,main="Distribution of Total Amount",xlab="Total Amount")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_fares$total_amount,add = TRUE,col="yellow")

###############################################################
#e.     What is the distribution of total amount?
###############################################################

summary(data_fares$total_amount)

#histogram on full domain
hist(data_fares$total_amount,main="Distribution of Total Amount",xlab="Total Amount")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_fares$total_amount,add = TRUE,col="yellow")

#histogram on restricted domain
hist(data_fares$total_amount,200,xlim=c(0,100),
     main="Distribution of Total Amount",
     xlab="Total Amount")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "grey")
hist(data_fares$total_amount,add = TRUE,col="yellow",200,xlim=c(0,100))

#other statistics for the dashboard

summary(data_fares$fares_amount)
summary(data_fares$total_amount-data_fares$fare_amount-data_fares$tip_amount)


###############################################################
#f.    What are top 5 busiest hours of the day?
###############################################################

#I assume "busiest hours" means "hours showing the highest number of pickup requests"

#create a column for pickup_hour
data_trip$pickup_hour<-as.POSIXlt(data_trip$pickup_datetime)$hour
#create a column for counting
data_trip$ones<-1

#count number of pickups grouped by pickup_hour 
busy_hours <- aggregate(data_trip$ones ~ data_trip$pickup_hour, data_trip, sum)
busy_hours

names(busy_hours)[names(busy_hours)=="data_trip$pickup_hour"] <- "pickup_hour"
names(busy_hours)[names(busy_hours)=="data_trip$ones"] <- "counter"

tripsum <- sum(busy_hours$counter)
busy_hours$perc<-busy_hours$counter/tripsum

ggplot(busy_hours,aes(x = pickup_hour,y = perc*100))+
  geom_ribbon(aes(ymin=0, ymax=perc*100), 
              fill="lightgoldenrod2", 
              color="lightgoldenrod2") + 
  scale_x_continuous(breaks = seq(from = 0, to = 23, by = 1)) +
  geom_point(size=3,
             color="burlywood3") +
  geom_line(color="burlywood3", 
            lwd=0.5) +
  ggtitle("Number of Pickups per Hour every 100 Daily Pickups") +
  xlab("Hour of the Day") +
  theme(axis.title.y = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        text=element_text(size = 22))

#select top 5 pickup_hours
top5_hours<-busy_hours %>%  arrange(desc(busy_hours[,2])) %>% top_n(5)
top5_hours


###############################################################
#g.    What are the top 10 busiest locations of the city?
###############################################################

#I assume "busiest locations" means "locations showing the highest number of pickup requests". 
#In the following I will get rid of records not having latitude and/or longitude reported for pickups.

#Locations are grouped accordingly to their latitude and longitude. In order to find a balance 
#between being too much approximative (ie obtaining areas too large to be considered informative 
#locations) and too much precise (ie having a huge number of distinct locations) I have rounded 
#latitude and longitude to the 0.005 closest decimals.

data_trip<-data_trip[!(data_trip$pickup_latitude==0 | data_trip$pickup_longitude==0),]

data_trip$latpickup<-round(data_trip$pickup_latitude/0.005)*0.005
data_trip$slatpickup<-lapply(data_trip$latpickup,toString)
data_trip$latpickup<-NULL
data_trip$lonpickup<-round(data_trip$pickup_longitude/0.005)*0.005
data_trip$slonpickup<-lapply(data_trip$lonpickup,toString)
data_trip$lonpickup<-NULL

#build a trip identifier concatenating rounded latitude and longitude in string format
data_trip$trip_start<-paste(data_trip$slatpickup,data_trip$slonpickup,sep="|")

#remove redundant data
data_trip$slatpickup<-NULL
data_trip$slonpickup<-NULL

#groupby trip identifier and count
busy_locations<-aggregate(data_trip$ones ~ data_trip$trip_start, data_trip, sum)
names(busy_locations)[names(busy_locations)=="data_trip$trip_start"] <- "location"
names(busy_locations)[names(busy_locations)=="data_trip$ones"] <- "counter"

#total number of trip
tripsum<-sum(busy_locations$counter)

busy_locations$perc<-busy_locations$counter/tripsum

top10_loc<-busy_locations%>%  arrange(desc(busy_locations[,2])) %>% top_n(10)
#print top 10 busiest location identifier and trip number per location
top10_loc

#get address of busy locations
c <- unlist(strsplit(top10_loc$location, "[|]"))
temp = matrix(as.double(c), nrow=10, ncol=2,byrow=TRUE) 
top10_loc$lat <- temp[,1]
top10_loc$lon <- temp[,2]
top10_loc$address <- mapply(FUN = function(lon, lat) revgeocode(c(lon, lat)), top10_loc$lon, top10_loc$lat)

top10_loc

#build map for busy locations
ny_map<-get_map(location=c(-73.9308,40.7336),maptype = "satellite", zoom=11)
ny_map2<-get_map(location=c(-73.9874,40.7539),maptype = "satellite", zoom=13)
ny_map3<-get_map(location=c(-73.99,40.75),maptype = "roadmap", zoom=13)

#it takes a lot of time, use a sample instead
#ggmap(ny_map, extent = "device") + geom_point(aes(x = data_trip$pickup_longitude, y = data_trip$pickup_latitude), colour = "yellow", alpha = 0.1, size = 1, data = data_trip)

data_sample<-data_trip[sample(nrow(data_trip), 10000), ]

ggmap(ny_map, extent = "device") + 
  geom_point(aes(x = data_sample$pickup_longitude, 
                 y = data_sample$pickup_latitude), 
             colour = "yellow", 
             alpha = 0.1, 
             size = 1, 
             data = data_sample)

ggmap(ny_map, extent = "device") + 
  geom_density2d(data = data_sample, 
                 aes(x = data_sample$pickup_longitude, 
                     y = data_sample$pickup_latitude), 
                 size = 0.3) + 
  stat_density2d(data = data_sample, 
                 aes(x = data_sample$pickup_longitude,
                     y = data_sample$pickup_latitude, 
                     fill = ..level.., 
                     alpha = ..level..), 
                 size = 0.01, 
                 geom = "polygon") + 
  scale_fill_gradient(low = "yellow", high = "red") + 
  scale_alpha(range = c(0.2, 0.8), guide = FALSE)

ggmap(ny_map2, extent = "device") + 
  geom_density2d(data = data_sample, 
                 aes(x = data_sample$pickup_longitude,
                     y = data_sample$pickup_latitude), 
                 size = 0.3) + 
  stat_density2d(data = data_sample, 
                 aes(x = data_sample$pickup_longitude, 
                     y = data_sample$pickup_latitude, 
                     fill = ..level..,
                     alpha = ..level..), 
                 size = 0.01, 
                 geom = "polygon") + 
  scale_fill_gradient(low = "yellow", high = "red") + 
  scale_alpha(range = c(0.4, 0.9), guide = FALSE)

ggmap(ny_map3, extent = "device") + 
  geom_density2d(data = data_sample, aes(x = data_sample$pickup_longitude, 
                                       y = data_sample$pickup_latitude), size = 0.3) + 
  stat_density2d(data = data_sample, aes(x = data_sample$pickup_longitude, 
                                       y = data_sample$pickup_latitud, fill = ..level.., 
                                       alpha = ..level..), size = 0.01, geom = "polygon") + 
  scale_fill_gradient(low = "yellow", high = "red") + scale_alpha(range = c(0.4, 0.9), guide = FALSE)

######################################################################
#h.     Which trip has the highest standard deviation of travel time?
######################################################################

#I assume "trip" means "a taxi run with a given trip_start and trip_end". "trip_start" has been defined 
#above. "trip_end" is defined below. Their concatenation defines the key for "trip".

#In the following I will get rid of records not having latitude and/or longitude reported for dropoffs

data_trip<-data_trip[!(data_trip$dropoff_latitude==0 | data_trip$dropoff_longitude==0),]

data_trip$latdropoff<-round(data_trip$dropoff_latitude/0.005)*0.005
data_trip$slatdropoff<-lapply(data_trip$latdropoff,toString)
data_trip$latdropoff<-NULL
data_trip$londropoff<-round(data_trip$dropoff_longitude/0.005)*0.005
data_trip$slondropoff<-lapply(data_trip$londropoff,toString)
data_trip$londropoff<-NULL
data_trip$trip_end<-paste(data_trip$slatdropoff,data_trip$slondropoff,sep="|")
data_trip$slatdropoff<-NULL
data_trip$slondropoff<-NULL

#trip_id variable
data_trip$trip_id<-paste(data_trip$trip_start,data_trip$trip_end,sep="|")

#compute standard deviation for every trip
trips<-aggregate(data_trip$trip_time_in_secs ~ data_trip$trip_id, data_trip, sd)

#get the trip with highest standard deviation and find pickup and dropoff locations
temp<-trips %>%  arrange(desc(trips[,2])) %>% top_n(10)
names(temp)[names(temp)=="data_trip$trip_id"] <- "trip_id"
names(temp)[names(temp)=="data_trip$trip_time_in_secs"] <- "trip_sd"

#print the top 10, I will use the first one for the dashboard
trip_text=list()
for(i in 1:10) {
  coords=matrix(as.double(unlist(strsplit(temp$trip_id[i], "[|]"))), nrow=2, ncol=2,byrow=TRUE)
  from=coords[1,]
  to=coords[2,]
  origin<-mapply(FUN = function(lon, lat) revgeocode(c(lon, lat)), from[2], from[1])
  destination<-mapply(FUN = function(lon, lat) revgeocode(c(lon, lat)), to[2], to[1])
  trip_text[i]=paste("Trip",i,"from",origin,"to",destination,"has",temp$trip_sd[i])
}
print(trip_text)

######################################################################
#i.	    Which trip has most consistent fares? 
######################################################################

#I assume each taxy run is uniquely identified by "hack licence" and "pickup time". So, I can
# build unique run_id's for data_fares and data_trip tables and join them

data_fares$run_id<-paste(data_fares$hack_license,data_fares$pickup_datetime,sep="|")
data_trip$run_id<-paste(data_trip$hack_license,data_trip$pickup_datetime,sep="|")

#I create a new dataframe merging data_fares and data_trip on run_id

df_merge=merge(x=data_trip,y=data_fares, by.x="run_id", by.y="run_id", all.x=TRUE)

#get rid of some column to free memory

df_merge$pickup_datetime.x<-NULL
df_merge$dropoff_datetime<-NULL
df_merge$hack_license.y<-NULL
df_merge$pickup_datetime.y<-NULL

#groupby and standard deviation computation for fare ampount
fares<-aggregate(df_merge$fare_amount ~ df_merge$trip_id, df_merge, sd)
#I want to keep track of numerosity for each trip
fares_c<-aggregate(df_merge$ones ~ df_merge$trip_id, df_merge, sum)
fares_merge=merge(x=fares,y=fares_c, by.x="df_merge$trip_id", by.y="df_merge$trip_id", all.x=TRUE)
names(fares_merge)[names(fares_merge)=="df_merge$trip_id"] <- "trip_id"
names(fares_merge)[names(fares_merge)=="df_merge$fare_amount"] <- "fare_sd"
names(fares_merge)[names(fares_merge)=="df_merge$ones"] <- "trip_count"

#exclude trip with less then 30 occurrencies
fares_merge<-fares_merge[(fares_merge$trip_count>1),]

#ordering ascending by fares sd
fares_merge<- fares_merge %>%  arrange((fares_merge$fare_sd))

#trying to get some extrainformation beyond numbers
trip_text=list()
for(i in 1:5) {
    coords=matrix(as.double(unlist(strsplit(fares_merge$trip_id[i], "[|]"))), nrow=2, ncol=2,byrow=TRUE)
    from=coords[1,]
    to=coords[2,]
    origin<-mapply(FUN = function(lon, lat) revgeocode(c(lon, lat)), from[2], from[1])
    destination<-mapply(FUN = function(lon, lat) revgeocode(c(lon, lat)), to[2], to[1])
    trip_text[i]=paste("Trip",i,"starts from",origin,"and end to to",destination)
}
print(trip_text)

#Trip from JFK airport seem to be those with most consisten fares
