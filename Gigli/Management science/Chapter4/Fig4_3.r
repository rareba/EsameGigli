# File        Figure 4.3 Poverty and Education _ US States
# By          Daniel B. Carr

#             Sections
#             1. Read data, remove US value, use shorter nam          
#             2. Start Graphics Device and Define Colors
#             3. Define panel layouts            
#             4. Define graphics parameters

#             5. Set up indices for perceptual groups of states
#             6. Write state names
#             7. Plot poverty

#             8. Plot education
#             9. Plot maps
#            10. Add title 
#            11. Outline groups of panel
#            12. Close current pdf device

#1.  Read data, use shorter names

edPov = read.csv(file="EducationPoverty_States.csv",header=T,row.names=1)
edPovUs = edPov[1,]
edPov = edPov[-1,]
colnames(edPov) = c("state","ed","pov","region")
ord = order(edPov$pov)
edPov = edPov[ord,]
regionId = rownames(edPov)

#2. Start Graphics Device and Define Colors______________________________

pdf(width=6.5,height=9,file="Fig4_3.pdf")
# windows(width=6.5,height=9)
dotCex = ifelse(names(dev.cur())=="pdf",1.25,1.35)

wgray = rgb(.86,.86,.86)  #white gray for grid lines
backgroundLinesGray = "#B0B0B0"
usLinesGray = "#909090"

rgbColors = matrix(c(
 1.00, .30, .30,  # lighter red
 1.00, .60, .00,  # orange
  .30,.80, .30,  # lighter green
  .10, .65,1.00,  # tourquise
  .80, .45,1.00,  # lavendar
  .35, .35, .35,  # dark gray
  .85, .85, .85,
  .50, .50, .50,
  1., 1., .85,  # light yellow,  was 1,1,.85, and .9,.9,.7; .93,.93,.75
  .85, .85, .85),ncol=3,byrow=T)
hdColors=rgb(rgbColors[,1],rgbColors[,2],rgbColors[,3])


#3. Define panel layouts________________________________________

bot = .4
top = .73
left = 0
right = 0
panels = panelLayout(nrow=11,ncol=4,borders=rep(.2,4),
         topMar=top,bottomMar=bot,
	    leftMar=left,rightMar=right,
         rowSep=c(0,0,0,0,0,0,0,0,0,0,0,0),
         rowSize=c(7,7,7,7,7,1.5,7,7,7,7,7),
         colSize=c(2.4,2.9,2.50,2.50),
         colSep=c(0,0,.07,.07,0))

panelBlock = panelLayout(nrow=3,ncol=4,borders=rep(.2,4),
 	        topMar=top,bottomMar=bot,
	        leftMar=left,rightMar=right,
             rowSep=c(0,.00,.0,0),
             rowSize=c(35,1.5,35),
             colSize=c(2.4,2.9,2.50,2.50),
             colSep=c(0,0,.07,.07,0)) 
   
#4. Define graphics parameters____________________________

tCex = 1.03
cex = .73
fontsize = 12
font = 1
line1 = .2
line2 = 1.0
line3 = -.1
line4 = .7
ypad = .68
nameShift = 0

#5. Set up indices for perceptual groups of states___________________

iBegin = c(1, 6,11,16,21,26,27,32,37,42,47)  #group beginning  subscript
iEnd   = c(5,10,15,20,25,26,31,36,41,46,51)  #group ending     subscript
nGroups = length(iEnd)

#6. Write state names____________________________________________________________

regionNames = edPov$state  # get the full state names except D.C.
             
# title column
panelSelect(panels,1,1)
panelScale()
mtext(side=3,line=line1,'',cex=cex)
mtext(side=3,line=line2,'States',cex=cex)

# draw region names
for (i in 1:nGroups){
   gsubs = iBegin[i]:iEnd[i]
   gnams = regionNames[gsubs]
   nsubs = length(gnams)
   pen = 1:nsubs
   laby = nsubs:1

   panelSelect(panels,i,1)
   panelScale(c(0,1),c(1-ypad,nsubs+ypad))
   if(i==6){pen = 6;panelFill(col=wgray);panelOutline()}
   for(j in 1:length(pen)){
      points(rep(.1,nsubs),laby,pch=21,bg=hdColors[pen],col="black",cex=dotCex)	
      text(.18,laby[j]+nameShift,gnams[j],cex=cex,col="black",font=font,adj=c(0,.5))
   }
}

#7.  Plot poverty

dot = edPov$pov
dotRange = range(dot)
# expand the range by 4%
dotRange = mean(dotRange) +1.1*diff(dotRange)*c(-.5,.5)
dotGrid = c(10,15,20)   # empirical determination

panelSelect(panels,1,2)
panelScale()
mtext(side=3,line=line2,'Percent Living Below',cex=cex)
mtext(side=3,line=line1,'Poverty Level',cex=cex)

for (i in 1:nGroups){
   gsubs = iBegin[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panels,i,2)
   panelScale(dotRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=dotGrid,col="white",lwd=1)
   panelGrid(x=5.6,col="black",lty=2)  # hard code U.S. average
   panelOutline(col="white")

   if(i==nGroups){axis(side=1,at=dotGrid,
      labels=as.character(dotGrid),
      col="black",mgp=c(1.,-.1,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=.7,'Percent',font=font,cex=cex)
   }
 
   if(i==6) pen=6
   points(dot[gsubs],laby,pch=21,
         cex=dotCex,bg=hdColors[pen],col='black')   	   
}

#8. Plot Education ___________________________________________________

dot = edPov$ed
dotRange = range(dot)
# expand the range by 4%
dotRange = mean(dotRange) +1.11*diff(dotRange)*c(-.5,.5)
dotGrid = c(20,30,40)   # empirical determination

panelSelect(panels,1,3)
panelScale()
mtext(side=3,line=line2,'Percent Adults With',cex=cex)
mtext(side=3,line=line1,'4+ Years of College',cex=cex)

for (i in 1:nGroups){
   gsubs = iBegin[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panels,i,3)
   panelScale(dotRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=dotGrid,col="white",lwd=1)
   panelOutline(col="white")

   if(i==nGroups){axis(side=1,at=dotGrid,
      labels=as.character(dotGrid),
      col="black",mgp=c(1.,-.1 ,0),tck=0,cex.axis=cex)  #-.2
	 mtext(side=1,line=.7,'Percent',font=font,cex=cex)
   }
 
   if(i==6) pen=6
   points(dot[gsubs],laby,pch=21,
         cex=dotCex,bg=hdColors[pen],col='black')   	   
}

# 9. Plot maps: Accumulate top down _______________________________

#    Experimented with an easier to follow approach to polygon drawing
#    Works like a charm
#    
#    Keep track of the foreground regions
#           and highlighed regions foreground
#
#    Select and plot all background (non-foreground) polygons
#           in background theme
#    Draw US outline, gray level between background and foreground lines        
#    Select and plot the non-highlighted foreground states in
#           in the foreground theme.    
#    Select and plot the highlighted states in the highlight theme.
#        Match the polygonId's to the highlight regions.
#        Remove the NA's.  
#        The remaining numbers, here typically 1 to 5
#        provide an index to the highlight colors used 
#        The first highlighted state polygon(s) to plot may be the
#             third in sorted order of states for that panel, so will
#             use the third color as desired.


regionBorders=stateVBorders      #use of generic script
refRegionBorders=nationVBorders     #use of generic script

# range for polygon panel scales
rxpoly = range(regionBorders$x,na.rm=T)
rypoly = range(regionBorders$y,na.rm=T)

rxpoly = mean(rxpoly) + 1.08*diff(rxpoly)*c(-.5,.5)
rypoly = mean(rypoly) + 1.08*diff(rypoly)*c(-.5,.5)
                            
# polygon id's one per polygon 
polygonId = regionBorders$st[is.na(regionBorders$x)]

# panel titles
panelSelect(panels,1,4)
panelScale()
mtext(side=3,line=line2,'Light Yellow Means',cex=cex)
mtext(side=3,line=line1,'Highlighted Above',cex=cex)

panelSelect(panels,11,4)
panelScale()
mtext(side=1,line=line3,'Cumulative',cex=cex)
mtext(side=1,line=line4,'Highlighted States',cex=cex)

# drawing the maps________________

for (i in 1:nGroups){
if(i==6){    #map not drawn, median state in adjacent panel
   panelSelect(panels,6,4)
   panelScale()
   panelFill(col=wgray)
   panelOutline(col="black")
   text(.5,.55,'Median',cex=cex)
   next
}

panelSelect(panels,i,4)
panelScale(rxpoly,rypoly)
panelFill(col=wgray)
panelOutline(col="white")

gsubs = iBegin[i]:iEnd[i]  # subscripts for highlight regions
frontRegions = regionId[1:iEnd[i]]  # accumulated foreground regions
# highlightRegions defined a few lines below to accommodate the median state

if(i==5){gsubs = c(gsubs,26);frontRegions=c(frontRegions,regionId[26])} #median state added here
if(i==7){gsubs = c(gsubs,26)} #median state added here

highlightRegions= regionId[gsubs]

# plot background (out of contour) states in white with gray outlines 
back = is.na(match(regionBorders$st,frontRegions))
polygon(regionBorders$x[back], regionBorders$y[back],col="white",
        border=backgroundLinesGray) # 

# outline U.S.
polygon(refRegionBorders$x,refRegionBorders$y,col=usLinesGray,density=0,lwd=1) # outside boundary

fore = !is.na(match(regionBorders$st,highlightRegions))
past = !back & !fore
polygon(regionBorders$x[past], regionBorders$y[past],col=hdColors[9],border="black") 
colorLoc = match(polygonId,highlightRegions)
colorLoc = colorLoc[!is.na(colorLoc)]
polygon(regionBorders$x[fore],regionBorders$y[fore],col=hdColors[colorLoc],border="black")

}

#10. Add Title _____________________________________________

panelSelect(panels,margin="top")
panelScale()
text(.5,.75,'Poverty and Education in U.S. States, 2000',
     cex=tCex)

#11 Outline groups of panels____________________________________

##Run
for (i in 1:3){
for (j in 2:4){
   panelSelect(panelBlock,i,j)
   panelScale()
   panelOutline(col="black")
}}

#12. Close current pdf device_________________________________
if(names(dev.cur())=="pdf")dev.off()


