# File      Fig4_8 White Male All Cancer Mortality Rates
# By        Dan Carr
# Credit    Jim Pearson produced the example for the book.
#           He used new data, adapted a previous script, and
#            modified functions.   
                 
#          Sections
#          1. Install the stateMicromap functions are related objects
#          2. Read state data sets for two time periods
#          3. Merge the state data for input to stateMicromap() 
#          4. Read the county data and make state level boxplots 
#          5. Create a dataframe for stateMicromap() 
#             defining the type of panel for each columns and 
#             indicating the variables to use 
#          6. Open the graphics device and call stateMicromp() 


# 1. Install the state micromap functions and the associated
#    default color and graphics parameter lists 

source("stateMicromap.r")
source("stateMicromapSetDefaults.r")
stateMicromapDefaults = stateMicromapSetDefaults()
stateNamesFips = read.csv(file="stateNamesFips.csv",row.names=1,as.is=TRUE)


# 2.  Read the lung cancer states data for two time periods
#     into a dataframe.   
#        Note : For simplicity the data files provided here omit the US row.
#               Often this is a useful reference values and 
#               stateMicromap() supports drawing a reference value line.                

wfLung95 = read.table('WFLungMort19951999AgeAdj2000State.csv',
                      header=T,sep=';',row.names=1)
head(wfLung95)

wfLung00 = read.table('WFLungMort20002004AgeAdj2000State.csv',
                      header=T,sep=';',row.names=1)
head(wfLung00)

# 3. Merge and make the state Abbreviations the Row Labels
#    This will be the primary data input to stateMicromap()

wfLung95_00 = merge(wfLung95,wfLung00,by="row.names",suffixes=c("_95","_00"))
rownames(wfLung95_00) = wfLung95_00$Row.names
wfLung95_00$Row.names=NULL

head(wfLung95_00)

# 4. Create boxplots for counties of each state________________________
#    labeling them with state abbreviations
 
wfLung00Cnty = read.table('WFAgeAdjLungMort2000-4CountyAgeAdj2000.csv',
                  header=T, sep=';', as.is=T)
head(wfLung00Cnty)

# The first two digits of county fips codes are state fips codes

# state abbreviation    
countyStateFips = floor(wfLung00Cnty$Fips/1000)
countyStateAb = stateNamesFips$ab[match(countyStateFips,stateNamesFips$fips)]
                         
# boxplot list structure based county values of each state
wfCntyBoxplot = boxplot(split(wfLung00Cnty$Rate,countyStateAb),plot=F)


# 5. Create the panel layout description data frame___________________
#    This is also input to stateMicromap()
#    Variables to used are specific by column number
#    of the data  data.frame

column = 1:ncol(wfLung95_00)
names(column) = names(wfLung95_00)
column

panelDesc = data.frame(
  type=c('maptail','id','dotconf','arrow','boxplot'),
  lab1=c('','','State 2000-4','State Change','County 2000-4'),
  lab2=c('','','Rate and 95% CI','1995-9 to 2000-4','Rates'),
  lab3=c('','','Deaths per 100,000','Deaths per 100,000','Deaths per 100,000'),
#                             dotconf                arrow 
  col1=c(NA,NA,7,1,NA),    # 7 = Rate_00,        1= State 95 Rate
  col2=c(NA,NA,9,7,NA),    # 9= State Lower CI,  7 =State 00 Rate
  col3=c(NA,NA,10,NA,NA),  #10= State Upper CI,
#                         name of boxplot list to link in use
  boxplot= c('','','','','wfCntyBoxplot' ) 
)  

# 6. Open device and plot

pdf(file="Fig4_8.pdf",width=7.5,height=10)
# windows(width=7.5,height=10)
stateMicromap(wfLung95_00,panelDesc,sortVar=7,ascend=F,
            title=c('Female Lung Cancer Mortality Rates',
                    '2000-2004 and Change'))  
dev.off()
##End---

 


