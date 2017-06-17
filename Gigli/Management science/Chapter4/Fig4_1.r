#File      Fig4_1  White Male All Cancer Mortality Rates
#By        Daniel B. Carr
  
#          Sections
#          1. Read in Data, select and sort Midwest states
#          2. Get Midwest state polygon 
#          3. Graphics Device and Color
#          4. Perceptual Groups and Panel layouts

#          5. Graphics parameters
#          6. Row-label column
#          7. Rank column
#          8. Dots and confidence intervals column

#          9. Micromap column
#         10. Outline blocks of panels
#         11. Title
#         12. Close pdf device


#1. Read in White Male All Cancer Rates, select and sort Midwest states 

wmAllCan = read.csv("wmAllCan2001_05.csv",header=TRUE,as.is=TRUE,row.names=1)

midwest = wmAllCan$region=="MW"
wmAllCanMW = wmAllCan[midwest,]

ord = order(wmAllCanMW$Age.Adjusted.Rate)
wmAllCanMW = wmAllCanMW[ord,]
dat = wmAllCanMW     # can use more generic script

#2. Get Midwest state polygons 

good = !is.na(match(stateVBorders$st,rownames(wmAllCanMW)))
focusBorders = stateVBorders[good,]  # can use more generic script

#3. Graphics Device and Colors

pdf(width=5.5,height=4.0,file='Fig4_1.pdf')
#windows(width=5.5,height=4.0)

wgray = rgb(.85,.85,.85)  #white gray
backgroundGrayLine = "#D0D0D0"  
visitedGrayLine ="#A0A0A0"  
rgbColors = matrix(c(
 1.00, .10, .10,
 1.00, .50, .00,
  .20, .80, .20,
  .00, .50,1.00,
  .60, .30,1.00),ncol=3,byrow=T)
hdColors=rgb(rgbColors[,1],rgbColors[,2],rgbColors[,3])
wyellow = rgb(1,1,.82)

#4. Perceptual Groups and Panel layouts_____________________________

# Three groups of four
ib = c(1,5,9)
ie = c(4,8,12)

bot = .25
top = .73
left = 0
right = 0
panel = panelLayout(nrow=3,ncol=4, borders=rep(.2,4),
         topMar=top,bottomMar=bot,
	   leftMar=left,rightMar=right,
         colSize=c(1.7,1.0,3.2,2.1),
         colSep=c(0,0,0,0,0))

panelBlock = panelLayout(nrow=1,ncol=4,borders=rep(.2,4),
 	   topMar=top,bottomMar=bot,
	   leftMar=left,rightMar=right,
         colSize=c(1.7,1.0,3.2,2.1),
         colSep=c(0,0,0,0,0)) 
   
#5. Graphics parameters____________________________

dotCex = 1.4
tCex = 1.0
cex = .82
cex.axis=cex*.9
fontsize = 12
font = 1
line1 = .12
line2 = .98
line3 = .8
ypad = .68
nameShift = -.04

#6. Row-label column______________________________

regionId = rownames(wmAllCanMW)
regionNames = wmAllCanMW$State
             
# title column
panelSelect(panel,1,1)
panelScale()
mtext(side=3,line=line1,'States',cex=cex)
mtext(side=3,line=line2,'Midwest',cex=cex)
panN=length(ie)
# draw state names
for (i in 1:panN){
   gsubs = ib[i]:ie[i]
   gnams = regionNames[gsubs]
   nsubs=length(gnams)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panel,i,1)
   panelScale(c(0,1),c(1-ypad,nsubs+ypad))
   points(rep(.1,nsubs),laby,pch=21,bg=hdColors[pen],col="black",cex=dotCex)	
   text(rep(.18,nsubs),laby,gnams,cex=cex,adj=c(0,.5),col="black")
   if(i==panN){
      mtext(side=1,line=-.1,"Sorted by",cex=cex)
      mtext(side=1,line=line3,"Cancer Rate",cex=cex)
   }
}

##End

#7. Rank column______________________________________
             
# title column
panelSelect(panel,1,2)
panelScale()
mtext(side=3,line=line1,'1=Lowest',cex=cex)
mtext(side=3,line=line2,'Ranks',cex=cex)

# draw ranks
for (i in 1:length(ie)){
   gsubs = ib[i]:ie[i]
   gnams = regionId[gsubs]
   nsubs=length(gnams)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panel,i,2)
   panelScale(c(0,1),c(1-ypad,nsubs+ypad))	
   text(rep(.9,nsubs),laby,gsubs,cex=cex,adj=c(1,.5),col="black")
}

#8. Dot and confidence interval column___________________________

expandR = function(x,f=1.06) mean(x)+ f*diff(x)*c(-.5,.5)
panRx = range(dat[,4],dat[,5])
panRx = expandR(panRx)
panGridx = c(210,230,250)


panelSelect(panel,1,3)
panelScale()
mtext(side=3,line=line1,"95% Confidence Interval",cex=cex)
mtext(side=3,line=line2,"Age-Adjusted Rates and",cex=cex)

panN = length(ie)
for (i in 1:panN){
   gsubs = ib[i]:ie[i]
   gnams = regionId[gsubs]
   nsubs=length(gnams)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panel,i,3)
   panelScale(panRx,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=panGridx,col="white")
   panelOutline(col="white")
      segments(dat[gsubs,4],laby,dat[gsubs,5],laby,
           col=hdColors[pen],lend="butt",lwd=2)
      points(dat[gsubs,2],laby,pch=21,bg=hdColors[pen],
           col='black',cex=dotCex)
   if(i==3){
     axis(side=1,at=panGridx,tick=FALSE,mgp=c(2,-.1,0),cex.axis=cex)
     mtext(side=1,line=line3,"Deaths per 100,000",cex=cex)
   }
}

#9. Micromap column___________________________________

# panel title
panelSelect(panel,1,4)
panelScale()
mtext(side=3,line=line2,'Light Yellow Means',cex=cex)
mtext(side=3,line=line1,'Highlighted Above',cex=cex)
 
rxpoly = range(focusBorders$x,na.rm=T)
rypoly = range(focusBorders$y,na.rm=T)

rxpoly = mean(rxpoly) + 1.11*diff(rxpoly)*c(-.5,.5)
rypoly = mean(rypoly) + 1.11*diff(rypoly)*c(-.5,.5)

# polygon id's one per polygon 
polygonId = focusBorders$st[is.na(focusBorders$x)]

# drawing the maps________________

panN = length(ie)
for (i in 1:panN){
   panelSelect(panel,i,4)
   panelScale(rxpoly,rypoly)
   panelFill(col=wgray)
   panelOutline(col="white")

   gsubs = ib[i]:ie[i]

   frontRegions = regionId[1:ie[i]]
   highlightRegions = regionId[gsubs]  
   back = is.na(match(focusBorders$st,frontRegions))
   polygon(focusBorders$x[back],focusBorders$y[back],col="white",
           border=backgroundGrayLine) # 

   fore = !is.na(match(focusBorders$st,highlightRegions))
   past = !back & !fore
   polygon(focusBorders$x[past],focusBorders$y[past],col=wyellow,
           border=visitedGrayLine) 
   colorLoc = match(polygonId,highlightRegions)
   colorLoc = colorLoc[!is.na(colorLoc)]
   polygon(focusBorders$x[fore],focusBorders$y[fore],col=hdColors[colorLoc],border="black")
}

#10. Outline blocks of panels___________________________________  
for (j in 3:4){
   panelSelect(panelBlock,1,j)
   panelScale()
   panelOutline()
}

#11. Title________________________________________________________  
panelSelect(panel,mar="top")
panelScale()
text(.5,.85,"White Male All Cancer Mortality Rate, 2001-2005", cex=tCex)

#12. Close pdf device_____________________________________________
if(names(dev.cur())=="pdf")dev.off()













dev.
