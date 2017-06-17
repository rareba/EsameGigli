       Linked Micromaps Chapter 7

           Louisiana Parishes
      
Figure 7.1  Name
            Population 2000 = bar column
            Percent Black = dot column
            Percent People in poverty = dot column
            Parish = micromap column
            Sorted by population 2000

Figure 7.2  Like 7.1, sorted by percent black
Figure 7.3  Like 7.2  sorted by poverty
Figure 7.4  Name = name column
            %Change 2005-2006 = dot column
            %Change 2006-2007 = dot column
            Parish = micromap column
Figure 7.5  Name = Name column
            %Change 2006 to 2007 Relative to 2005 = arrows column
            Population 2005 = bar column
            4 biggest loss parishes only
            Sorted by 2006 % change 
Figure 7.6  Like 7.5 show the other parishes
            
Figure 7.11 Two juxtaposted scatterplots with smooths
            Black population % change 2006 to 2007
            White population % change 2006 to 2007
            versus percent People in Poverty
            3 extreme change Parishes omitted

In R cd to the folder, then 

# _________Panel Functions and Louisiana boundaries____

source("panelFunctions.r")

LA_Parish = read.csv("LA_Parish_Bnd.csv",
    row.names=1,header=TRUE,as.is=TRUE)
LA_Parish$id = as.character(LA_Parish$id)
LAborder= read.csv("LA_Bnd.csv",
    row.names=1,header=TRUE,as.is=TRUE)      

#______________Louisiana Data__________________________

katrinaBig = read.csv('katrinaBig.csv',row.names=1)
census = read.csv('census.csv',row.names=1)

#________________Figures_______________________________

source("Fig7_1.r")
source("Fig7_2.r")
source("Fig7_3.r")
source("Fig7_4.r")

source("Fig7_5.r")
source("Fig7_6.r")
source("Fig7_11.r")  # scatterplots with smooths
