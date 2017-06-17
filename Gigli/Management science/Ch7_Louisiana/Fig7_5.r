# File   Fig7_5.r
# By     Dan Carr

# 1. Graphics Device____________________________

pdf(width=6.5,height=1.9,file='Fig7_5_Big4.pdf')
pdfOn=TRUE
#windows(width=6.5,height=1.9)

# 2. Sort and capture region id

#  Fips codes for the highest loss regions
#    fips                 name
#   22087          St. Bernard
#   22071              Orleans
#   22075          Plaquemines
#   22023              Cameron  

omit = c(22087,22071,22075,22023)
good = !is.na(match(census$fips,omit))
censusBig4 = census[good,]
censusM4 = census[!good,]

# 3. Calculations

# percent of 2005 value  
# need pop2007
pop2005 = censusBig4[,3]
pc2006 = censusBig4[,29]
pc2007 = censusBig4[,30]
pop2006 = pc2006*pop2005/100+pop2005
pop2007 = pc2007*pop2006/100+pop2006
pcNew2007 = 100*(pop2007-pop2005)/pop2005  

ord = order(pc2006)
censusBig4 = censusBig4[ord,]

before = censusBig4[,29]
after = pcNew2007[ord]

regionNam =censusBig4$name 
regionId = as.character(censusBig4[,1])

#3. Color setup______________________________________

wgray=rgb(.86,.86,.86)
#wgray = rgb(.78,.78,.78)

rgbcolors=matrix(c(
1.00, 0.30, 0.30,
1.00, 0.50, 0.00,
0.00, .80,  0.00,
0.10, 0.65, 1.00,
0.80, 0.45, 1.00,
0.35, 0.35, 0.35,
0.85, 0.85, 0.85,
0.50, 0.50, 0.50,
1.00, 1.00, 0.85,
0.85, 0.85, 0.85),ncol=3,byrow=T)
hdColors=rgb(rgbcolors[,1],rgbcolors[,2],rgbcolors[,3])

#4. Panel layout and graphics parameters___________________
bot=.32
top=0.26
left=0
right=0

panels=panelLayout(nrow=1,ncol=4, borders=rep(.2,4),
                   topMar=top,bottomMar=bot,
                   leftMar=left,rightMar=right,
                   colSize=c(1.4,2,2,1.5))

panelBlock=panelLayout(nrow=1,ncol=4,borders=rep(.2,4),
                       topMar=top,bottomMar=bot,
                       leftMar=left,rightMar=right,
                       colSize=c(1.4,2,2,1.5))

dotCex=1.35
tcex=1.08
cex=0.75
font=0.55
fontsize=12
line1=.2
line2=1.0
line3=.2
ypad=.65
nameShift= -.04

iBeg=1
iEnd=4
nGroups=length(iEnd)

panelSelect(panels,1,1)
panelScale()
mtext(side=3,line=line2,'Parishes',cex=cex)
mtext(side=3,line=line1,'Sort: % Change 2006',cex=cex)
mtext(side=1,line=-.2,'Have Lowest',cex=cex)
mtext(side=1,line=.6,'2007 Percents',cex=cex)

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
    for(j in 1:length(pen)){
        points(.2,lady[j],pch=21,bg=hdColors[pen[j]],fg="gray",cex=dotCex)
        text(.28,lady[j]+nameShift,gnams[j],cex=cex,adj=0,col='black',font=font)
    }
}
    
# 6. Column 2: Percent change arrows________________

half=.31
panRange = range(c(before,after))
# expand the range by 4%
panRange = expandRange(panRange,1.07)

panGrid = c(-80,-65,-50,-35,-20)   # empirical determination

panelSelect(panels,1,2)
panelScale()
mtext(side=3,line=line2,'% Change From 2005 Pop.',cex=cex)
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
       points(after[dsubs],laby[dot],
          pch=21,bg="white",col='white',cex=.3)
    }
    if(any(!dot)){
       asubs= gsubs[!dot]
       apen = pen[!dot]
       arrows(before[asubs],laby[!dot],after[asubs],laby[!dot],length=.09,angle=30,
         col=hdColors[apen],lwd=2)
#       points(after[asubs],laby[!dot],
#          pch=21,bg="white",col='white',cex=.3) 
    }  
   if(i==nGroups){axis(side=1,at=panGrid,
      labels=as.character(panGrid),
      col="black",mgp=c(1.,-.2,0),tck=0,cex.axis=cex)
	 mtext(side=1,line=.7,'Percent Change',font=font,cex=cex)
   }	   
}
   
# 9. Column 3 Population total as bars________________

bar = censusBig4[,3]
panRange = range(bar)
# expand the range by 4%
panRange = expandRange(panRange,1.10)
panRange[1]=0
panGrid = c(100000,300000,500000)   # empirical determination
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
   panelGrid(x=0,col="green",lty=1)  # hard code U.S. average
   panelOutline(col="white")
   half=1/3 
   rect(rep(0,nsubs),laby-half,bar[gsubs],laby+half,
       col=hdColors[pen],border='gray')   
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

regions$id = as.numeric(regions$id)
polygonId= regions$id[is.na(regions$x)]

panelSelect(panels,1,4)
panelScale(rxpoly,rypoly)
panelFill(col=wgray)
panelOutline(col="white")
highlightRegions = censusBig4$fips

back = is.na(match(regions$id,highlightRegions))
polygon(regions$x[back], regions$y[back],col="white",border=wgray)
polygon(LAborder$x,LAborder$y,density=0,col='#A0A0A0')

ord = match(polygonId,highlightRegions)
ord = ord[!is.na(ord)]
polygon(regions$x[!back], regions$y[!back],col=hdColors[ord],border="black")


panelSelect(panels,1,4)
panelScale()
mtext(side=3,line=line2,'Micromap',cex=cex)
#mtext(side=3,line=line1,'Lowest 2007 Percents',cex=cex)
#panelSelect(panels,12,4)
#panelScale()
#mtext(side=1,line=-.2,'Cumulative Up To',cex=cex)
#mtext(side=1,line=.7,'Middle Panel',cex=cex)


# 11. Outline panels
for(i in 1:1){
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


