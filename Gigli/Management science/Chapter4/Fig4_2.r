# File        Figure 4.2 Poverty and Education _ Southern States
# By          Daniel B. Carr
#
#             Sections
#             (1. Read state borders) Commented out
#             2. Read data, shorter names, select and sort states          
#             3. Extract borders for southern states
#             4. Start graphics device and define colors
#             5. Define panel layouts            

#             6. Define graphics parameters
#             7. Set up indices for perceptual groups of states
#             8. Write state names
#             9. Plot poverty
#
#            10. Plot education
#            11. Plot maps
#            12. Add title 
#            13. Outline groups of panel
#            14. Close current pdf device


# 1. Read state borders
#
# stateVBorders = read.csv("stateVisibilityBorders.csv",
#                       row.names=NULL,header=T,as.is=TRUE)
# nationVBorders = read.csv("nationVisibilityBorders.csv", 
#                blank.lines.skip=F,row.names=NULL,header=T,as.is=TRUE)
# columns names:  st= state abbreviations, x and y are polygon coordinates  

#2.  Read data, use shorter names and select and sort Southern States

edPov = read.csv(file="EducationPoverty_States.csv",header=T,row.names=1)
colnames(edPov) = c("state","ed","pov","region")
edPovS = edPovS = edPov[edPov$region=="S",]
ord = order(edPovS$pov)
edPovS = edPovS[ord,]

#3. Extract borders for southern states

stateId=rownames(edPovS)
ind = match(stateVBorders$st,rownames(edPovS))
good = !is.na(ind)
southBorders = stateVBorders[good,]

#4. Start Graphics Device and Define Colors______________________________

pdf(width=6,height=5.25,file="Fig4_2.pdf")
# windows(width=6.5,height=5.25)

wgray = rgb(.86,.86,.86)  #white gray

rgbColors = matrix(c(
 1.00, .10, .10,
 1.00,1.00, .00,
 # .0,  .85,  .0,  # .25,100,.25
  .10, .65,1.00,
  .44, .22, .88,                  # .80, .45,1.00,
  .55, .55, .55,
  .85, .85, .85,
  .50, .50, .50,
 1.00,1.00, .85,
  .85, .85, .85),ncol=3,byrow=T)
hdColors=rgb(rgbColors[,1],rgbColors[,2],rgbColors[,3])

#5. Define panel layouts________________________________________

bot = .25
top = .73
left = 0
right = 0
panels = panelLayout(nrow=5,ncol=4, borders=rep(.2,4),
         topMar=top,bottomMar=bot,
	    leftMar=left,rightMar=right,
         rowSep=c(0,0,.00,.00,0,0),
         rowSize=c(5,5,1.25,5,5),
         colSize=c(2.3,2.90,2.90,2.5),
         colSep=c(0,0,0,0,0))

panelBlock = panelLayout(nrow=3,ncol=4,borders=rep(.2,4),
 	    topMar=top,bottomMar=bot,
	    leftMar=left,rightMar=right,
         rowSep=c(0,.00,.00,0),
         rowSize=c(10,1.25,10),
         colSize=c(2.3,2.90,2.90,2.5),
         colSep=c(0,0,0,0,0)) 
   
#6. Define graphics parameters____________________________

dotCex = 1.5
tCex = 1.03
cex = .79
fontsize = 12
font = 1
line1 = .2
line2 = 1.0
line3 = .8
ypad = .68
nameShift = -.04

#7.  Set up indices for perceptual groups of states___________________

iBegin = c(1, 5, 9,10,14) #group beginning  subscript
iEnd   = c(4, 8, 9,13,17) #group ending     subscript
nGroups = length(iEnd)

#8. Write region names____________________________________________________________

regionNames = edPovS$state  # get the full state names except D.C.
             
# title column
panelSelect(panels,1,1)
panelScale()
mtext(side=3,line=line1,"States",cex=cex)
mtext(side=3,line=line2,"Southern",cex=cex)

# write state names
for (i in 1:nGroups){
   gsubs = iBegin[i]:iEnd[i]
   gnams = regionNames[gsubs]
   nsubs=length(gnams)
   pen = 1:nsubs
   laby = nsubs:1
   if(i==3){pen = 5}
   panelSelect(panels,i,1)
   panelScale(c(0,1),c(1-ypad,nsubs+ypad))
   points(rep(.1,nsubs),laby,pch=21,bg=hdColors[pen],col="black",cex=dotCex)	
   text(rep(.18,nsubs),laby +nameShift,gnams,cex=cex,adj=0,col="black")
}

#9.  Plot poverty

dot = edPovS$pov
dotRange = range(dot)
# expand the range by 4%
dotRange = mean(dotRange) +1.12*diff(dotRange)*c(-.5,.5)
dotGrid = c(10,15,20)   # empirical determination

panelSelect(panels,1,2)
panelScale()
mtext(side=3,line=line2,"Percent Living Below",cex=cex)
mtext(side=3,line=line1,"Poverty Level",cex=cex)

for (i in 1:nGroups){
   gsubs = iBegin[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   if(i==3) pen=5
   panelSelect(panels,i,2)
   panelScale(dotRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=dotGrid,col="white",lwd=1)
   panelOutline(col="white")
   points(dot[gsubs],laby,pch=21,
         cex=dotCex,bg=hdColors[pen],col="black")   	   
   if(i==nGroups){axis(side=1,at=dotGrid,
      labels=as.character(dotGrid),
      col="black",mgp=c(1.,-.05,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=line3,"Percent",cex=cex)
   }
}

#10. Plot Education ___________________________________________________

dot = edPovS$ed
dotRange = range(dot)
# expand the range by 4%
dotRange = mean(dotRange) +1.12*diff(dotRange)*c(-.5,.5)
dotGrid = c(20,30,40)   # empirical determination

panelSelect(panels,1,3)
panelScale()
mtext(side=3,line=line2,"Percent Adults With",cex=cex)
mtext(side=3,line=line1,"4+ Years of College",cex=cex)

for (i in 1:nGroups){
   gsubs = iBegin[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   if(i==3)pen=5
   panelSelect(panels,i,3)
   panelScale(dotRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=dotGrid,col="white",lwd=1)
   panelOutline(col="white")
   points(dot[gsubs],laby,pch=21,
         cex=dotCex,bg=hdColors[pen],col="black") 
   if(i==nGroups){axis(side=1,at=dotGrid,
      labels=as.character(dotGrid),
      col="black",mgp=c(1.,-.15,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=line3,"Percent",cex=cex)
   }
}

#11.  Plot maps_________________________________________________________

# range for scale the polygon panels
rxpoly = range(southBorders$x,na.rm=T)
rypoly = range(southBorders$y,na.rm=T)

rxpoly = mean(rxpoly) + 1.10*diff(rxpoly)*c(-.5,.5)
rypoly = mean(rypoly) + 1.10*diff(rypoly)*c(-.5,.5)

# polygon id's one per polygon 
polygonId = southBorders$st[is.na(southBorders$x)]

# panel titles
panelSelect(panels,1,4)
panelScale()
mtext(side=3,line=line1,"Sorted by Poverty",cex=cex)
mtext(side=3,line=line2,"Micromaps",cex=cex)

# drawing the maps

for (i in 1:nGroups){
gsubs = iBegin[i]:iEnd[i]
if(i==2)gsubs = c(gsubs,9)   #median state added here
if(i==4)gsubs = c(gsubs,9)   #median state added here
panelNames = stateId[gsubs]

if(i==3){    #map not drawn, median state in adjacent panel
   panelSelect(panels,i,4)
   panelScale()
   panelFill(col=wgray)
   panelOutline(col="black")
   text(.5,.55,"Median",cex=cex)
   next
}
panelSelect(panels,i,4)
panelScale(rxpoly,rypoly)
panelFill(col=wgray)
panelOutline(col="white")
# plot background (out of contour) states in gray with white outlines 
polygon(southBorders$x, southBorders$y,col="white",border=F) # 
polygon(southBorders$x, southBorders$y,col="#808080",density=0) # outline states

# plot foreground states for the panel in their special colors pens 1:5
# and other in contour states in light yellow pen 9
fore =!is.na(match(southBorders$st,panelNames))
pen = match(polygonId,panelNames)
pen = pen[!is.na(pen)]
polygon(southBorders$x[fore], southBorders$y[fore],col=hdColors[pen],border=F) # outline states
polygon(southBorders$x[fore], southBorders$y[fore],col="black",density=0,lwd=1) # outline states
   text(135,31,"DC",cex=cex,adj=.5, col=1)
#  text(22,17,"AK",cex=cex,adj=.5, col=1)
#  text(47,8,"HI",cex=cex,adj=.5, col=1)

}


#12. Add title_______________________________________________

panelSelect(panels,margin="top")
panelScale()
text(.5,.75,"Poverty and Education in Southern U.S. States, 2000",
     cex=tCex)

#13 Outline groups of panels__________________________________

for (i in 1:3){
for (j in 2:4){
   panelSelect(panelBlock,i,j)
   panelScale()
   panelOutline(col="black")
}}

panelSelect(panelBlock,2,1)
panelScale()
panelOutline(col="black")

#14. Close current pdf device_________________________________
if(names(dev.cur())=="pdf")dev.off()


