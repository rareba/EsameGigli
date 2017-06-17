# File      Fig7_3.r
# By        Dan Carr

# 1. Sort by 2000 population
#    and get region ids (fips code) and parish names  

tmp = census$PctAllPov
ord = order(tmp,decreasing=TRUE)   # sort on populations
census = census[ord,]

regionNam =census$name 
regionId = as.character(census$fips)

#2. Functions 

expandRange = function(rx,f=1.08)mean(rx)+ f*diff(rx)*c(-.5,.5)

#3. Graphics Device, Panel Layout and graphics parameters_________
pdf(w=6.5,h=9.5,file='Fig7_3_SortPovertyPercent.pdf')
pdfOn=TRUE
#windows(width=6.5,height=10)

wgray=rgb(.86,.86,.86)
bordergray = rgb(.78,.78,.78)

rgbcolors=matrix(c(
1.00, 0.30, 0.30,
1.00, 0.50, 0.00,
0.25, 1.00, 0.25,
0.10, 0.65, 1.00,
0.80, 0.45, 1.00,
0.35, 0.35, 0.35,
0.85, 0.85, 0.85,
0.50, 0.50, 0.50,
1.00, 1.00, 0.85,
0.85, 0.85, 0.85),ncol=3,byrow=T)
hdColors=rgb(rgbcolors[,1],rgbcolors[,2],rgbcolors[,3])

#_____________Panel Layout_______________________________________

bot=.3
top=0.23
left=0
right=0

panels=panelLayout(nrow=13,ncol=5, borders=rep(.2,4),
                   topMar=top,bottomMar=bot,
                   leftMar=left,rightMar=right,
                   rowSep=c(rep(0,6),.07,.07,rep(0,6)),
                   colSize=c(1.8,1.5,1.5,1.5,1.5))

panelBlock=panelLayout(nrow=3,ncol=5,borders=rep(.2,4),
                       topMar=top,bottomMar=bot,
                       leftMar=left,rightMar=right,
                       rowSize=c(6,1,6),
                       rowSep=c(0,.07,.07,0),
                       colSize=c(1.8,1.5,1.5,1.5,1.5))


#___________________Graphics Parameters________________________

dotCex=1.1   # 1.35 windows
tcex=1.08
cex=0.7
font=0.55
fontsize=12
line1=.2
line2=1.0
line3=.2
ypad=.65
nameShift= -.04  # .12 for windows

iBeg=c(1, 6,11,16,21,26,31,35,40,45,50,55,60)
iEnd=c(5,10,15,20,25,30,34,39,44,49,54,59,64)
nGroups=length(iEnd)

panelSelect(panels,1,1)
panelScale()
mtext(side=3,line=line2,'Parish',cex=cex)
mtext(side=3,line=line1,'Names',cex=cex)

#4.  Region names________________________________

for(i in 1:nGroups){
    gsubs=iBeg[i]:iEnd[i]
    gnams=regionNam[gsubs]
    nsubs=length(gnams)
    pen=1:nsubs
    lady=nsubs:1
    panelSelect(panels,i,1)
    panelScale(c(0,1),c(1-ypad,nsubs+ypad))
    panelFill(col="white")
    panelOutline(col="#E0E0E0")
    points(rep(.1,nsubs),lady,pch=21,bg=hdColors[pen],fg="gray",cex=dotCex)
    text(rep(.18,nsubs),lady+nameShift,gnams,cex=cex,adj=0,col='black',font=font)
}
    
# 5. Column 2: 2000 Census________________

panVar = census$pop_total/1000
panRange = range(panVar)
# expand the range by 7%
panRange = expandRange(panRange,1.07)
panRange[1]=0
panGrid = c(0,200,400)   # empirical determination
# add reference line a 0
panelSelect(panels,1,2)
panelScale()
mtext(side=3,line=line2,'Population',cex=cex)
mtext(side=3,line=line1,'2000 Census',cex = cex)

for (i in 1:nGroups){
   gsubs = iBeg[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panels,i,2)
   panelScale(panRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=panGrid,col="white",lwd=1)
   panelOutline(col="white")
   if(i==7) half=.31 * 2.7/3.7 else half=.31
   rect(rep(0,nsubs),laby-half,panVar[gsubs],laby+half,
        col=hdColors[pen],border='#303030')   
   if(i==nGroups){axis(side=1,at=panGrid,
      labels=as.character(panGrid),
      col="black",mgp=c(1.,-.2,0),tck=0,cex.axis=cex)
	mtext(side=1,line=.7,'Population in 1000s',font=font,cex=cex)
   }	   
}
##End
    
# 6. Column 3 Percent Black  ________________

panVar = 100*census$popPctBlk
panRange = range(panVar)
# expand the range by 4%
panRange = expandRange(panRange,1.10)
panRange=c(-4,72)
panGrid = c(0,20,40,60)   # empirical determination
# add reference line a 0
panelSelect(panels,1,3)
panelScale()
mtext(side=3,line=line2,'Percent',cex=cex)
mtext(side=3,line=line1,'Black',cex = cex)

for (i in 1:nGroups){
   gsubs = iBeg[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panels,i,3)
   panelScale(panRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=panGrid,col="white",lwd=1)
   panelOutline(col="white")
   points(panVar[gsubs],laby,pch=21,
         cex=dotCex,bg=hdColors[pen],col='black')   
   if(i==nGroups){axis(side=1,at=panGrid,
      labels=as.character(panGrid),
      col="black",mgp=c(1.,-.2,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=.7,'Percent',font=font,cex=cex)
   }	   
}
##End
    
# 7. Column 4 Percent Poverty ________________

panVar = 100*census$PctAllPov
med = median(panVar)
panRange = range(panVar)
# expand the range by 4%
panRange = expandRange(panRange,1.14)
panGrid = c(10,20,30,40)   # empirical determination
# add reference line a 0
panelSelect(panels,1,4)
panelScale()
mtext(side=3,line=line2,'Percent',cex=cex)
mtext(side=3,line=line1,'People in Poverty',cex = cex)

for (i in 1:nGroups){
   gsubs = iBeg[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panels,i,4)
   panelScale(panRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   panelGrid(x=panGrid,col="white",lwd=1)
   panelGrid(x=med,col="#808080",lwd=2,lty=2)
   panelOutline(col="white")
   points(panVar[gsubs],laby,pch=21,
         cex=dotCex,bg=hdColors[pen],col='black')   
   if(i==nGroups){axis(side=1,at=panGrid,
      labels=as.character(panGrid),
      col="black",mgp=c(1.,-.2,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=.7,'Percent',font=font,cex=cex)
   }	   
}
##End


# 10.  Map panels_____________________________________  


rxpoly=range(regions$x,na.rm=T)
rxpoly = expandRange(rxpoly,f=1.08)
rypoly=range(regions$y,na.rm=T)
rypoly = expandRange(rypoly,f=1.09)

polygonId=regions$id[is.na(regions)]

for (i in 1:nGroups){
   panelSelect(panels,i,5)
   panelScale(rxpoly,rypoly)
   panelFill(col=wgray)
   panelOutline(col="white")
   gsubs = iBeg[i]:iEnd[i]

   if(i < 7)frontRegions = regionId[1:iEnd[i]]
   if(i ==7)frontRegions = regionId[iBeg[i]:iEnd[i]]
   if(i > 7)frontRegions = regionId[iBeg[i]:64]

   highlightRegions= regionId[gsubs]

   back = is.na(match(regions$id,frontRegions))
   polygon(regions$x[back], regions$y[back],col="white",border=bordergray) 
   polygon(LAborder$x,LAborder$y,density=0,col='#A0A0A0')

   fore = !is.na(match(regions$id,highlightRegions))
   past = !back & !fore
   polygon(regions$x[past], regions$y[past],col=hdColors[9],border="black")
   colorLoc = match(polygonId,highlightRegions)
   colorLoc = colorLoc[!is.na(colorLoc)]
   polygon(regions$x[fore],regions$y[fore],col=hdColors[colorLoc],
         border="black")  

}

panelSelect(panels,1,5)
panelScale()
mtext(side=3,line=line2,'Cumulative Down To',cex=cex)
mtext(side=3,line=line1,'Middle Panel',cex=cex)
panelSelect(panels,13,5)
panelScale()
mtext(side=1,line=line1,'Cumulative Up To',cex=cex)
mtext(side=1,line=line2,'Middle Panel',cex=cex)


# 11. Outline panels
for(i in 1:3){
  panelSelect(panelBlock,i,2)
  panelScale()
  panelOutline(col="black")
  panelSelect(panelBlock,i,3)
  panelScale()
  panelOutline(col="black")
  panelSelect(panelBlock,i,4)
  panelScale()
  panelOutline(col="black")
 panelSelect(panelBlock,i,5)
  panelScale()
  panelOutline(col="black")
}

if(pdfOn){
   dev.off()
   pdfOn=FALSE
}


