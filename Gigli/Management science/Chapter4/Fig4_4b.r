# File      Fig4_4b.r  Pennylvania hazardous air pollutants
# By        Dan Carr
# Note      Intended version. The book version had
#           lighter gray lines in the map.         

#           1. Read data
#           2. Read PA figs codes
#           3. Read county boundary files and fix 
#           4. Sort data

#           5. Open graphics device and define layout 
#           6. Open graphics device and set panel layout
#           7. Set graphics parameters
#           8. Plot names

#           9. Plot dots
#          10. Plot maps
#          11. Outline blocks of panels
#          12. Plot labels


# 1. Read county data and extract the PA counties
triDat = read.csv(file="airPollutants.csv",head=TRUE,stringsAsFactors=FALSE)

nchr = nchar(triDat[,1])
stateId = substring(triDat[,1],nchr-1,nchr)
good= stateId=="PA"
triPA = triDat[good,]

nchr = nchar(triPA[,1])
rownames(triPA) = substring(triPA[,1],1,nchr-4)
dim(triPA)


# 2. Get the fips codes for PA counties since the
#    available county boundary names are fips codes.

PAfips = read.table('PA Fips.txt',header=FALSE,row.names=1)
dim(PAfips)

# There are 7 PA counties without assuming PA creating or collapsing
# counties 
# Make a data frame hapPA with all the counties and append data    

hapPA = PAfips  
hapPA$Air = rep(NA,nrow(triHap))
loc = match(rownames(hapPA),toupper(rownames(triPA)))
hapPA$Air = triPA[loc,2]
colnames(hapPA) = c("Fips","Haps")
hapPA[,1] = hapPA[,1]+42000

# Address all caps
nam = rownames(hapPA)
nchr = nchar(nam) 
nam = paste(substring(nam,1,1),tolower(substring(nam,2,nchr)),sep='')
nam[42] = "McKean"
rownames(hapPA) = nam

#3. Read county boundary Files and convert__________________________  

regionBorders = read.table('PA_counties.txt',header=FALSE,col.names=c("x","y"),
                        colClasses = c('character','numeric'))
good = regionBorders[,1]=="ID"
polygonId = as.integer(regionBorders[good,2])
regionBorders[good,] = c(NA,NA)
regionBorders[,1] = as.numeric(regionBorders[,1])
regionBorders =rbind(regionBorders,c(NA,NA))
nr = nrow(regionBorders)

# make a vector of polygonID's like x and y
ints = 1:nr
naLine = c(ints[good])
regionBorders=regionBorders[-1,]
regionBorders$Id = rep(polygonId,diff(naLine))

grandBorder = read.table("PA_boundary.txt",header=FALSE,
                          colClasses=c('numeric','numeric'),col.names=c("x","y"),
                          skip=1)

rxpoly = range(grandBorder$x,na.rm=TRUE)
rypoly = range(grandBorder$y,na.rm=TRUE)
rxpoly = mean(rxpoly)+ 1.10*diff(rxpoly)*c(-.5,.5)
rypoly = mean(rypoly)+ 1.10*diff(rypoly)*c(-.5,.5)
rxpoly[2]=860000

#4. Sort Data___________________________________

ord = order(hapPA[,2],decreasing=TRUE)
hapPA = hapPA[ord,]

#5. Open graphics device and set panel layout________________________
pdf(width=6.5,height=6.8,file="Fig4_4bAirPollutants.pdf")
#windows(width=6.5,height=6.5)
topMar=.5
leftMar=0
rightMar=0
bottomMar=.4
pan = panelLayout(nrow=8,ncol=6,borders=rep(.1,4),
               topMar=topMar,bottomMar=bottomMar,
               leftMar=leftMar,rightMar=rightMar,
               rowSep=c(0,0,0,0,.07,0,0,0,0),
               colSep=c(0,0,0,0,0,0,0),
               colSize=c(1.1,1,1.1,1.0,1,1.1))
panBlock = panelLayout(nrow=2,ncol=6,borders=rep(.1,4),
               topMar=topMar,bottomMar=bottomMar,
               leftMar=leftMar,rightMar=rightMar,
               rowSep=c(0,.07,0),
               colSep=c(0,0,0,0,0,0,0),
               colSize=c(1.1,1,1.1,1.0,1,1.1))
panLabel = panelLayout(nrow=2,ncol=2,borders=rep(.1,4),
               topMar=topMar,bottomMar=bottomMar,
               leftMar=leftMar,rightMar=rightMar,
               rowSep=c(0,.07,0),
               colSep=c(0,.0,0))

#7. Set graphics parameters_____________________________

wgray = rgb(.86,.86,.86)
wgrayDark = "#C0C0C0"
wyellow=rgb(1,1,.85,max=1)
wgreen = "#D9FFD9"
rgbColors = matrix(c(
 1.00, .10, .10,
 1.00, .50, .00,
  .20, .80, .20,
  .00, .50,1.00,
  .60, .30,1.00),ncol=3,byrow=T)
hdColors=rgb(rgbColors[,1],rgbColors[,2],rgbColors[,3])

ypad=.65
dcex = 1.1
cex=.70
cex.axis = .7
tcex = .95
line1 = .2
line2 = .55
font=1


ie = c(4,8,12,17,21,25,29,34,
      38,42,46,51,55,59,63,67)
ib = c(1,ie[-length(ie)]+1)
nGroups = length(ib)

#8. Plot Region Names____________________________________ 

regionNams=rownames(hapPA)
   
for(i in 1:8){
    gsubs=ib[i]:ie[i]
    gnams=regionNams[gsubs]
    nsubs=length(gnams)
    pen=1:nsubs
    lady=nsubs:1
    panelSelect(pan,i,1)
    panelScale(c(0,1),c(1-ypad,nsubs+ypad))
#   points(rep(.07,nsubs),lady,pch=21,bg=hdcolors[pen],col='black',cex=dcex)
    text(.95,lady,gnams,cex=cex,col='black',adj=c(1,.5))
}

for(i in 9:16){
    gsubs=ib[i]:ie[i]
    gnams=regionNams[gsubs]
    nsubs=length(gnams)
    pen=1:nsubs
    lady=nsubs:1
    panelSelect(pan,i-8,4)
    panelScale(c(0,1),c(1-ypad,nsubs+ypad))
#    points(rep(.07,nsubs),lady,pch=21,bg=hdcolors[pen],col='black',cex=dcex)
    text(.945,lady,gnams,cex=cex,col='black',adj=c(1,.5))
}

#9 Plot dots__________________________________________

panVal =hapPA[,2]/1000000
panRx=range(panVal,na.rm=TRUE)
panRx = mean(panRx)+1.15*diff(panRx)*c(-.5,.5)
panGrid=c(0,5,10,15)

for(i in 1:8){
    gsubs=ib[i]:ie[i]
    nsubs=length(gsubs)
    pen=1:nsubs
    laby=nsubs:1
    panelSelect(pan,i,2)
    panelScale(panRx,c(1-ypad,nsubs+ypad))
    panelFill(col=wgray)
    panelGrid(x=panGrid,col='white',lwd=1)
    panelOutline(col="white")
    if(i==8){
       axis(side=1,at=panGrid,
       labels=TRUE,
       col='black',mgp=c(1.0,-0.2,0),tck=FALSE,cex.axis=cex.axis)
       mtext(side=1,line=line2,"Millions of Pounds",cex=cex)
    }

#    lines(panVal[gsubs],laby,col='black',lwd=1)
         points(panVal[gsubs],laby,pch=21,
         bg=hdColors[pen],cex=dcex,col='black')
}

for(i in 9:16){
    gsubs=ib[i]:ie[i]
    nsubs=length(gsubs)
    pen=1:nsubs
    laby=nsubs:1
    panelSelect(pan,i-8,5)
    panelScale(panRx,c(1-ypad,nsubs+ypad))
    panelFill(col=wgray)
    panelGrid(x=panGrid,col='white',lwd=1)
    panelOutline(col='white')  
    if(i==nGroups){
       axis(side=1,at=panGrid,labels=TRUE,
       col='black',mgp=c(1.0,-0.2,0),tck=FALSE,cex.axis=cex.axis)
       mtext(side=1,line=line2,"Millions of Pounds",cex=cex)
    }
#    lines(panVal[gsubs],laby,col='black',lwd=1)
         points(panVal[gsubs],laby,pch=21,
         bg=hdColors[pen],cex=dcex,col='black')
     catch = is.na(panVal[gsubs])
     if(any(catch)){
         tmpx = rep(.0,sum(catch))
         tmpy = laby[catch]
         points(tmpx,tmpy,bg=hdColors[pen[catch]],pch=22,col='black',cex=dcex)
     }  
}

#10. Plot maps  

regionId = hapPA[,1]

for (i in 1:8){
   panelSelect(pan,i,3)
   panelScale(rxpoly,rypoly)
   panelFill(col=wgray)
   panelOutline(col="white")
   gsubs = ib[i]:ie[i]
   gnams = regionId[gsubs]
   front = regionId[1:ie[i]] # else regionId[iBeg[i]:50] 
   #front=gnams

   back = is.na(match(regionBorders$Id,front))
   polygon(regionBorders$x[back], regionBorders$y[back],col=wgreen,border=wgrayDark) 
   polygon(grandBorder$x,grandBorder$y,col="#909090",density=0,lwd=1) 

   highlight = !is.na(match(regionBorders$Id,gnams))
   pen= match(polygonId,gnams)
   pen=pen[!is.na(pen)]
   fore = !back
   previous = fore & !highlight
   if(any(previous))polygon(regionBorders$x[previous],regionBorders$y[previous],
                         col=wyellow,border="black")

   polygon(regionBorders$x[highlight],regionBorders$y[highlight],col=hdColors[pen],border='black') 
 }


for (i in 9:16){
   panelSelect(pan,i-8,6)
   panelScale(rxpoly,rypoly)
   panelFill(col=wgray)
   panelOutline(col="white")
   gsubs = ib[i]:ie[i]
   gnams = regionId[gsubs]
   front = regionId[1:ie[i]] # else regionId[iBeg[i]:50] 
   #front=gnams

   back = is.na(match(regionBorders$Id,front))
   polygon(regionBorders$x[back], regionBorders$y[back],col=wgreen,border=wgrayDark) 
   polygon(grandBorder$x,grandBorder$y,col="#909090",density=0,lwd=1) 

   highlight = !is.na(match(regionBorders$Id,gnams))
   pen= match(polygonId,gnams)
   pen=pen[!is.na(pen)]
   fore = !back
   previous = fore & !highlight
   if(any(previous))polygon(regionBorders$x[previous],regionBorders$y[previous],
                         col=wyellow,border="black")

   polygon(regionBorders$x[highlight],regionBorders$y[highlight],col=hdColors[pen],border='black') 
 }

#11.  Outline blocks of panels

for(i in 1:2){
for(j in c(2,3,5,6)){
   panelSelect(panBlock,i,j)
   panelScale()
   panelOutline()
}}

#12. Plot labels

panelSelect(panLabel,1,1)
panelScale()
mtext(side=3,line=line1,"Higher Release Counties",cex=cex,font=2)

panelSelect(panLabel,1,2)
panelScale()
mtext(side=3,line=line1,"Lower Release and Missing Data Counties",cex=cex,font=2)

panelSelect(pan,mar="top")
panelScale()
text(.5,.83,"Pennsylvania Hazardous Air Pollutant Releases, 2007",cex = tcex)

if(names(dev.cur())=="pdf")dev.off()


