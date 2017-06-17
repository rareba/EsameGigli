# File   Fig4_15_Iowa
# By     Dan Carr
#
#        1.  Graphics Device
#        2.  Read migration Data
#        3.  Percent calculations
#        4.  Read state centroids
#        5.  Panel Layouts and Graphics Parameters
#
#        6. and 7.  Maps in columns 1 and 4
#        8. State abbreviation columns 2 and 5
#        9. Percent dots column 3 and 6
#        10. Used title and outlines

# 1.  Graphics device and colors

pdf(width=6.3,height=7.5,file='Fig4_15Iowa.pdf')
# windows(width=6.5,height=7.5)


wgray=rgb(.78,.78,.78)
wmgray=rgb(.77,.77,.77)

mgray=rgb(.69,.69,.69)
mgray = wgray
wyellow = rgb(242,242,180,max=256)
wgreen=rgb(.85,1.00,.85)
rgbcolors=matrix(c(
1.00, 0.10, 0.10,
1.00, 0.50, 0.00,
0.00, 0.76, 0.00,
0.00, 0.50, 1.00,
0.70, 0.35, 1.00,
0.35, 0.35, 0.35,
0.85, 0.85, 0.85,
0.50, 0.50, 0.50,
1.00, 1.00, 0.85,
0.85, 0.85, 0.85),ncol=3,byrow=T)
hdColors=rgb(rgbcolors[,1],rgbcolors[,2],rgbcolors[,3])


# 2. Read migration data and check on meaning  

mig = read.csv("stateToStateMigration19952000.csv",row.names=1,as.is=TRUE)

head(mig)

# column 1 total at the end
# column 2 did not move
# other columns moved into Iowa
# the Iowa column moved within iowa so I want to exclude it from
#  the moving into iowa total.
# check
mig[,1] == apply(mig[,2:53],1,sum,na.rm=TRUE)  # Note" ND row has a missing value for RI   

# 3. Calculate percents for Iowa and sort in descenting order
 
pick = 16 # row number of Iowa

totIn = mig[pick,1]-mig[pick,2]-mig[pick,pick+2]
moveInPer = 100*mig[pick,-c(1,2,pick+2)]/totIn  # nicely labeled
sum(moveInPer)

moveOut = mig[-pick,pick+2]
totOut = sum(moveOut)
moveOutPer = 100*moveOut/totOut
sum(moveOutPer) 
names(moveOutPer) = rownames(mig)[-pick]  

moveInPerSort = sort(moveInPer,decreasing=TRUE)
moveInId = names(moveInPerSort)

moveOutPerSort = sort(moveOutPer,decreasing=TRUE)
moveOutId = names(moveOutPerSort)

# 4. Read in state centroids as set map scale ________________
#    The states and nation boundardies should be available

centroids=read.csv('stateCenteroid.csv',row.names=NULL,header=T,
                    stringsAsFactors=FALSE)

rxpoly=range(stateVBorders$x,na.rm=T)
rypoly=range(stateVBorders$y,na.rm=T)

polygonId=stateVBorders$st[is.na(stateVBorders$x)]

# 4. Colors _______________________________

# 5. Panel Layout and graphis parameters____________________________________________
bot=0.2
top=0.3
left=0
right=0
font=1

panels=panelLayout(nrow=10,ncol=6,borders=rep(.2,4),
                   topMar=top,bottomMar=bot,
                   leftMar=left,rightMar=right,
                   rowSep=c(rep(0,5),.07,rep(0,5)),
                   rowSize=c(7,7,7,7,7,7,7,7,7,7),
                   colSize=c(2.5,1.0,2.3,2.3,1.0,2.5),
                   colSep=c(0,.02,0,0.3,.02,0,0))

panelBlock=panelLayout(nrow=1,ncol=4,
                       topMar=top,bottomMar=bot,
                       leftMar=left,rightMar=right,
                       rowSep=c(0,0),
                       colSize=c(3.6,3.5,3.6,2.5),colSep=c(0,0,.5,0,0))

dcex=1.03
tcex=1.08
cex=0.72
fontsize=12
line1=.2
line2=1.0
line3=.2
ypad=.65
nameShift=0

iBeg=c(1,6,11,16,21,26,31,36,41,46)
iEnd=c(5,10,15,20,25,30,35,40,45,50)
nGroups=length(iEnd)

# 6.  Column 1 Moving Into Iowa maps

regionId = moveInId

panelSelect(panels,1,1)
panelScale()
mtext(side=3,line=line2,'Iowa Welcomes',cex=cex,font=2)
mtext(side=3,line=line1,'214,841',cex=cex,font=1)


for (i in 1:nGroups){
   panelSelect(panels,i,1)
   panelScale(rxpoly,rypoly)
   gsubs = iBeg[i]:iEnd[i]
   gnams = regionId[gsubs]
   front = regionId[1:iEnd[i]] 

   back = is.na(match(stateVBorders$st,front))
   polygon(stateVBorders$x[back], stateVBorders$y[back],col="white",border=wgray) 
   highlight = !is.na(match(stateVBorders$st,gnams))
   pen= match(polygonId,gnams)
   pen=pen[!is.na(pen)]
   fore = !back
   previous = fore & !highlight
   if(any(previous))polygon(stateVBorders$x[previous],stateVBorders$y[previous],
                         col=wgreen,border=mgray)
   polygon(nationVBorders$x,nationVBorders$y,col="#909090",density=0,lwd=1) 
   polygon(stateVBorders$x[highlight], stateVBorders$y[highlight],col=hdColors[pen],border='black') 


   pen=match(centroids$st,gnams)
   draw=!is.na(pen)
   pen=pen[draw]
   segments(centroids$x[draw],centroids$y[draw],72.5,64,col=hdColors[pen],lwd=2)

   draw=!is.na(match(stateVBorders$st,"IA"))
   polygon(stateVBorders$x[draw],stateVBorders$y[draw],col="#FFFF00",border=T,lwd=1)
}

# 7.  Column 4 Moving Out Iowa maps

panelSelect(panels,1,4)
panelScale()
mtext(side=3,line=line2,'Iowa Will Miss',cex=cex,font=2)
mtext(side=3,line=line1,'247,853',cex=cex,font=1)

regionId = moveOutId

for (i in 1:nGroups){
   panelSelect(panels,i,4)
   panelScale(rxpoly,rypoly)
   gsubs = iBeg[i]:iEnd[i]
   gnams = regionId[gsubs]
   front = regionId[1:iEnd[i]] 

   back = is.na(match(stateVBorders$st,front))
   polygon(stateVBorders$x[back], stateVBorders$y[back],col="white",border=wgray) 
   highlight = !is.na(match(stateVBorders$st,gnams))
   pen= match(polygonId,gnams)
   pen=pen[!is.na(pen)]
   fore = !back
   previous = fore & !highlight
   if(any(previous))polygon(stateVBorders$x[previous],stateVBorders$y[previous],
                         col=wgreen,border=mgray)
   polygon(nationVBorders$x,nationVBorders$y,col="#909090",density=0,lwd=1) 
   polygon(stateVBorders$x[highlight], stateVBorders$y[highlight],col=hdColors[pen],border='black') 
 

   pen=match(centroids$st,gnams)
   draw=!is.na(pen)
   pen=pen[draw]
   segments(centroids$x[draw],centroids$y[draw],72.5,64,col=hdColors[pen],lwd=2)

   draw=!is.na(match(stateVBorders$st,"IA"))
   polygon(stateVBorders$x[draw],stateVBorders$y[draw],col="#FFFF00",border=T)
}

# 8. State names for columns 2 and 5

# title
    panelSelect(panels,1,2)
    panelScale()
    mtext(side=3,line=line1,'From',cex=cex)
    mtext(side=3,line=line2,'Coming',cex=cex)


stateId = moveInId
for(i in 1:nGroups){
    gsubs=iBeg[i]:iEnd[i]
    gnams=stateId[gsubs]
    nsubs=length(gnams)
    pen=1:nsubs
    lady=nsubs:1
    panelSelect(panels,i,2)
    panelScale(c(0,1),c(1-ypad,nsubs+ypad))
    points(rep(.3,nsubs),lady,pch=21,bg=hdColors[pen],col='black',cex=dcex)
    text(.45,lady+nameShift,gnams,cex=cex-.02,col='black',font=font,adj=c(0,.5))
}


# title
panelSelect(panels,1,5)
panelScale()
mtext(side=3,line=line1,'To',cex=cex)
mtext(side=3,line=line2,'Going',cex=cex)

stateId=moveOutId    
for(i in 1:nGroups){
    gsubs=iBeg[i]:iEnd[i]
    gnams=stateId[gsubs]
    nsubs=length(gnams)
    pen=1:nsubs
    lady=nsubs:1
    panelSelect(panels,i,5)
    panelScale(c(0,1),c(1-ypad,nsubs+ypad))
    points(rep(.3,nsubs),lady,pch=21,bg=hdColors[pen],col='black',cex=dcex)
    text(.45,lady+nameShift,gnams,cex=cex-.02,col='black',font=font,adj=c(0,.5))
}

# 9. Dots plots for Columns 3 and 6

panelSelect(panels,1,3)
panelScale()
mtext(side=3,line=line1,'Total Coming',cex=cex)
mtext(side=3,line=line2,'Percent of',cex=cex)

panVal =moveInPerSort
panRx=range(panVal)
panRx = mean(panRx)+1.12*diff(panRx)*c(-.5,.5)
panRx = c(-1,16)
panGrid=c(0,4,8,12,16)

for(i in 1:nGroups){
    gsubs=iBeg[i]:iEnd[i]
    nsubs=length(gsubs)
    pen=1:nsubs
    laby=nsubs:1
    panelSelect(panels,i,3)
    panelScale(panRx,c(1-ypad,nsubs+ypad))
    panelFill(col="#E0E0E0")
    panelGrid(x=panGrid,col='white',lwd=1)
    panelOutline(col='black')
    
    if(i==nGroups){
       axis(side=1,at=panGrid,
       labels=TRUE,
       col='black',mgp=c(1.0,-0.1,0),tck=FALSE,cex.axis=cex)
    }
#    lines(panVal[gsubs],laby,col='black',lwd=1)
    points(panVal[gsubs],laby,pch=21,
           bg=hdColors[pen],cex=dcex,col='black')
}

panelSelect(panels,1,6)
panelScale()
mtext(side=3,line=line1,'Total Going',cex=cex)
mtext(side=3,line=line2,'Percent of',cex=cex)

panVal = moveOutPerSort
panRx=range(panVal)
panRx=mean(panRx)+1.12*diff(panRx)*c(-.5,.5)
panRx[1] = -1
panGrid=c(0,4,8,12)

for(i in 1:nGroups){
    gsubs=iBeg[i]:iEnd[i]
    nsubs=length(gsubs)
    pen=1:nsubs
    laby=nsubs:1
    panelSelect(panels,i,6)
    panelScale(panRx,c(1-ypad,nsubs+ypad))
    panelFill(col="#E0E0E0")
    panelGrid(x=panGrid,col='white',lwd=1)
    panelOutline(col='black')   
    if(i==nGroups){axis(side=1,at=panGrid,
                   labels=TRUE,col='black',mgp=c(1.0,-0.1,0),
                   tck=FALSE,cex.axis=cex)
     }
 #   lines(panVal[gsubs],laby,col='black',lwd=1)
    points(panVal[gsubs],laby,pch=21,
       cex=dcex,bg=hdColors[pen],col='black')
}

# 10.  Unused title and outlines
#panelSelect(panels,margin='top')
#panelScale()
#text(.5,.8,'Iowa Migration from 1995 to 2000',cex=1.15)
 
#for(i in c(3,5)){
#panelSelect(panelBlock,1,i)
#panelScale()
#panelOutline(col='black') #}

if(names(dev.cur())=="pdf")dev.off()



