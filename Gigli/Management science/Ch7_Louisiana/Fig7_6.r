# File   Fig7_6.r
# By     Dan Carr

# 1. Graphics Device____________________________

pdf(width=6.5,height=9.5,file='Fig7_6_Omit4.pdf')
pdfOn=TRUE

# windows(width=6.5,height=10)

# 2. Sort and capture region id  

#   Fips codes for the highest loss regions
#    fips                 name
#   22087          St. Bernard
#   22071              Orleans
#   22075          Plaquemines
#   22023              Cameron  

omit = c(22087,22071,22075,22023)
good = is.na(match(census$fips,omit))
censusM4 = census[good,]
censusb4 = census[!good,]

# percent of 2005 value  
# need pop2007
pop2005 = censusM4[,3]
pc2006 = censusM4[,29]
pc2007 = censusM4[,30]
pop2006 = pc2006*pop2005/100+pop2005
pop2007 = pc2007*pop2006/100+pop2006
pcNew2007 = 100*(pop2007-pop2005)/pop2005  

ord = order(pc2006)
censusM4 = censusM4[ord,]

before = censusM4[,29]
after = pcNew2007[ord]

regionNam =censusM4$name 
regionId = as.character(censusM4[,1])

#3.Color setup_________________________________________________

wgray=rgb(.86,.86,.86)
#wgray = rgb(.78,.78,.78)
 
rgbcolors=matrix(c(
1.00, 0.30, 0.30,
1.00, 0.50, 0.00,
0.00, 0.80,  0.00,
0.10, 0.65, 1.00,
0.80, 0.45, 1.00,
0.35, 0.35, 0.35,
0.85, 0.85, 0.85,
0.50, 0.50, 0.50,
1.00, 1.00, 0.85,
0.85, 0.85, 0.85),ncol=3,byrow=T)
hdColors=rgb(rgbcolors[,1],rgbcolors[,2],rgbcolors[,3])

#4. Panel layou and graphics parameters_________________
bot=.3
top=0.23
left=0
right=0

panels=panelLayout(nrow=12,ncol=4, borders=rep(.2,4),
                   topMar=top,bottomMar=bot,
                   leftMar=left,rightMar=right,
                   rowSep=c(rep(0,6),.07,rep(0,6)),
                   colSize=c(1.7,2,2,1.5))

panelBlock=panelLayout(nrow=2,ncol=4,borders=rep(.2,4),
                       topMar=top,bottomMar=bot,
                       leftMar=left,rightMar=right,
                       rowSep=c(0,.07,0),
                       colSize=c(1.7,2,2,1.5))


dotCex=1.1
tcex=1.08
cex=0.7
fontsize=12
line1=.2
line2=1.0
line3=.2
ypad=.65
nameShift= -.04

iBeg=seq(1,60,by=5)
iEnd=seq(5,60,by=5)
nGroups=length(iEnd)

panelSelect(panels,1,1)
panelScale()
mtext(side=3,line=line2,'Parishes',cex=cex)
mtext(side=3,line=line1,'Sort: % Change 2006',cex=cex)

#5. Column 1: Region names___________________________

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
    points(rep(.1,nsubs),lady,pch=21,bg=hdColors[pen],fg='black',cex=dotCex)
    text(rep(.18,nsubs),lady+nameShift,gnams,cex=cex,adj=0,col='black')
}
    
# 6. Column 2: Percent change arrows________________

half=.31
panRange = range(c(before,after))
# expand the range by 4%
panRange = expandRange(panRange,1.07)
panRange[1]=-8
panGrid = c(-8,-4,0,4,8)   # empirical determination
# add reference line a 0
panelSelect(panels,1,2)
panelScale()
mtext(side=3,line=line2,'% Changes From 2005 Pop.',cex=cex)
mtext(side=3,line=line1,'Arrows from 2006 to 2007',cex = cex)

for (i in 1:nGroups){
   gsubs = iBeg[i]:iEnd[i]
   nsubs = length(gsubs)
   pen = 1:nsubs
   laby = nsubs:1
   panelSelect(panels,i,2)
   panelScale(panRange,c(1-ypad,nsubs+ypad))
   panelFill(col=wgray)
   rect(0,1-ypad,panRange[2],nsubs+ypad,col=wgray)
   panelGrid(x=panGrid,col="white",lwd=1)
   panelGrid(x=0,col="#008000",lty=1)
   panelOutline(col="white")
#   rect(after[gsubs],laby-half,after[gsubs],laby+half,
#         col=hdColors[pen],border=hdColors[pen],lwd=2)

#   rect(before[gsubs],laby,after[gsubs],laby,
#         col=hdColors[pen],border=hdColors[pen],lwd=2)

    dot = ifelse(abs(before[gsubs]-after[gsubs]) < .2,TRUE,FALSE)
    if(any(dot)){
       dsubs= gsubs[dot]
       dpen = pen[dot]
       points(after[dsubs],laby[dot],
          pch=21,bg=hdColors[dpen],fg='black',cex=dotCex)
    }
    if(any(!dot)){
       asubs= gsubs[!dot]
       apen = pen[!dot]
       arrows(before[asubs],laby[!dot],after[asubs],laby[!dot],length=.09,angle=30,
         col=hdColors[apen],lwd=2) 
    }  
   if(i==nGroups){axis(side=1,at=panGrid,
      labels=as.character(panGrid),
      col="black",mgp=c(1.,-.2,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=.7,'Percent Change',font=font,cex=cex)
   }	   
}
    
# 9. Column 3: Population Total as bars________________

bar = censusM4[,3]
panRange = range(bar)
# expand the range by 4%
panRange = expandRange(panRange,1.10)
panRange[1]=0
panGrid = c(100000,200000,300000,400000)   # empirical determination
# add reference line a 0
panelSelect(panels,1,3)
panelScale()
mtext(side=3,line=line2,'Population',cex=cex)
mtext(side=3,line=line1,'2005',cex = cex)

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
   half=.31
   rect(rep(0,nsubs),laby-half,bar[gsubs],laby+half,
       col=hdColors[pen],border=hdColors[pen])   
   if(i==nGroups){axis(side=1,at=panGrid,
      labels=as.character(panGrid/1000),
      col="black",mgp=c(1.,-.2,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=.7,'Population in Thousands',font=font,cex=cex)
   }	   
}

# 10.  Map panels_____________________________________  

regions=LA_Parish

expandRange = function(rx,f=1.08)mean(rx)+ f*diff(rx)*c(-.5,.5)
rxpoly=range(regions$x,na.rm=T)
rxpoly = expandRange(rxpoly,f=1.08)
rypoly=range(regions$y,na.rm=T)
rypoly = expandRange(rypoly,f=1.09)

polygonId=regions$id[is.na(regions)]

for (i in 1:nGroups){
   panelSelect(panels,i,4)
   panelScale(rxpoly,rypoly)
   panelFill(col=wgray)
   panelOutline(col="white")
   gsubs = iBeg[i]:iEnd[i]

   if(i <=6)frontRegions = regionId[1:iEnd[i]]
   if(i > 6)frontRegions = regionId[iBeg[i]:60]

   highlightRegions= regionId[gsubs]

   back = is.na(match(regions$id,frontRegions))
   polygon(regions$x[back], regions$y[back],col="white",border=wgray) 
   polygon(LAborder$x,LAborder$y,density=0,col='#A0A0A0')

   fore = !is.na(match(regions$id,highlightRegions))
   past = !back & !fore
   polygon(regions$x[past], regions$y[past],col=hdColors[9],border="black")
   colorLoc = match(polygonId,highlightRegions)
   colorLoc = colorLoc[!is.na(colorLoc)]
   polygon(regions$x[fore],regions$y[fore],col=hdColors[colorLoc],
         border="black")  
}

panelSelect(panels,1,4)
panelScale()
mtext(side=3,line=line2,'Cumulative Down To',cex=cex)
mtext(side=3,line=line1,'Middle Panel',cex=cex)
panelSelect(panels,12,4)
panelScale()
mtext(side=1,line=-.2,'Cumulative Up To',cex=cex)
mtext(side=1,line=.7,'Middle Panel',cex=cex)

# 11. Outline panels
for(i in 1:2){
  panelSelect(panelBlock,i,2)
  panelScale()
  panelOutline(col="black")
  panelSelect(panelBlock,i,3)
  panelScale()
  panelOutline(col="black")
  panelSelect(panelBlock,i,4)
  panelScale()
  panelOutline(col="black")
}

if(pdfOn){
   dev.off()
   pdfOn=FALSE
}

