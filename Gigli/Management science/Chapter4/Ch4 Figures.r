      Linked Micromaps Chapter 4 Figures:  
      
Figure 4.1  Midwest states + more:  white male lung cancer
Figure 4.2  Southern states: Poverty and education
Figure 4.3  All states: Poverty and education
Figure 4.4  Pennsylvania Hazardous air pollution
Figure 4.4b Revised capitalization 

Figure 4.8  All states: Female Lung cancer
Figure 4.9  All states: Smooth and residuals
Figure 4.14 All states: Syphilis time series
Figure 4.15 Iowa migration

In R, cd to the folder and then
 
## Run_________________________________________________  

# Scripts assume panelFunctions
source("panelFunctions.r")

# Many scripts assume State Boundary Files
stateVBorders = read.csv('stateVisibilityBorders.csv',
    row.names=NULL,header=TRUE,as.is=TRUE)
nationVBorders = read.csv('nationVisibilityBorders.csv',
    blank.lines.skip=F,row.names=NULL,header=TRUE,as.is=TRUE)      

# Figure production scripts
source("Fig4_1.r")
source("Fig4_2.r")
source("Fig4_3.r")
source("Fig4_4.r")
source("Fig4_4b.r")

source("Fig4_8.r")
source("Fig4_9.r")
source("Fig4_14.r") 
source("Fig4_15_IowaMigration.r")

## End _______________________________________________


For a different device:

Comment out the pdf() lines
Uncomment the line  
# windows(width=width,height=height)
or put in the device of your choice   