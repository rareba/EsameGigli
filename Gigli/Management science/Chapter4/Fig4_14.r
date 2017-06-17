# File        Fig4_14.r   Syphilis times series
# By          Dan Carr
# Date        SCS: Jan 2, 2005, R June 10, 2008, Edited May 22, 2010

#             Assumes State Visibility Maps

# Note        I recently obtained data through 2008 using PC Wonder.
#             Comparison against my older data through 2003 revealed
#             a few discrepancies just for 2003.  
#             The maximum absolute is difference is .49 deaths per million.
#             This is inconsequential terms of the plot, include sort order 
                           

#1. Read data, sort by the maximum and make a table_________

syphRows = read.csv(file="syphilis84_03.csv",
          header=TRUE,row.names=1,as.is=TRUE)

stateMax = apply(syphRows[,3:22],1,max)
ord = order(stateMax,decreasing=TRUE)
syphRows = syphRows[ord,]

tab = cbind(1:length(stateMax),sort(stateMax,decreasing=TRUE))
tab

# Note:  Year labels such as X1984 are not used
#                     so the X is not removed.  

                  
#2  Device, Page Layout, Colors, and Parameters_____

pdf(width=4.8,height=9,file='Fig4_14.pdf')
#windows(width=4.8,height=9)

topMar = .7
bottomMar = .2
leftMar =  0
rightMar = 0
panels = panelLayout(nrow=13,ncol=3,borders=rep(.1,4),
	       topMar=topMar,bottomMar=bottomMar,
	       leftMar=leftMar,rightMar=rightMar,
             rowSep=c(0,.07,0,0,0,0,.07,0,0,0,0,0,0,0),        
             colSize=c(1.1,1.3,1.4))	       
			
panTop = panelLayout(nrow=1,ncol=1,borders=rep(.1,4),
	       topMar=topMar,bottomMar=bottomMar,
	       leftMar=leftMar,rightMar=rightMar)
			
mat = matrix(c(
 1.00, .30, .30,  #  4 red
  .20, .80, .20,  #  6 green
  .00, .50,1.00,  #  7 blue,medium blue-green would be .32, .65, .70
  .60, .30, .90), #  8 purpl3  
   ncol=3,byrow=T)

lineCol = rgb(mat[,1],mat[,2],mat[,3])
wyellow = "#FFFFD9"
wgray = "#E0E0E0"
mgray = "#A0A0A0"

dotCex=1.15
dcex=.5
cex.axis = .65
cex=.63
line1=.1
line2=.75
tcex=.8
ypad = .68

#3 Set up for processing in loops__________________

iB = c(1,5, 9,13,17,21,25,28,32,36,40,44,48)  #group beginning  subscript
iE   = c(4,8,12,16,20,24,27,31,35,39,43,47,51)  #group ending     subscript
nGroup = length(iB)
nGroupSize = max(iE-iB+1)


#4. Plot region names___________________________________________

panelSelect(panels,1,2)
panelScale()
mtext(side=3,line=line1,at=.4,'States',cex=cex)

regionId = rownames(syphRows)
regionNam = syphRows[,1]

for(i in 1:nGroup){
    gsubs=iB[i]:iE[i]
    gnams=regionId[gsubs]
    nsubs=length(gnams)
    pen=1:nsubs
    lady=nsubs:1
    panelSelect(panels,i,2)
    panelScale(c(0,1),c(1-ypad,nsubs+ypad))
    panelFill(col="white")
    points(rep(.085,nsubs),lady,pch=21,bg=lineCol[pen],fig='black',cex=dotCex)
    text(rep(.13,nsubs),lady,regionNam[gsubs],cex=cex,adj=c(0,.5),col='black')
}

#5. Perceptual Group Panel Scaling and Color for Time series_______   

expandR =function(x,f=1.15)mean(x)+f*diff(x)*c(-.5,.5)
scaleGrp = list(1:4,5:24,25:51)
panRy = matrix(0,nrow=2,ncol=3)
for(j in 1:3){
   panRy[2,j] = max(tab[scaleGrp[[j]],2])
   panRy[ ,j] = expandR(panRy[,j])
}
panGrp = c(1,2,2,2,2,2,3,3,3,3,3,3,3)
panRyGrp = panRy[,panGrp]
panRyGrp[1,] = panRyGrp[1,]*2 # decrease min values for more room

panGridy = matrix(c(0,600,1200,
                    0,180,360,
                    0,40,80),ncol=3) 
 
panGridyGrp=panGridy[,panGrp]
panCol= c(rgb(.92,.84,1.0),rgb(.87,.87,.87),rgb(.87,.87,1.00))
panCol=panCol[panGrp]

#6 Plot Maps

panelSelect(panels,1,3)
panelScale()
mtext(side=3,line=line1,'In Cases Per Million',cex=cex)
mtext(side=3,line=line2,'Yearly Rates',cex=cex)

panRx = c(1983,2004)
panGridx=c(1985,1990,1995,2000)
year = 1984:2003

for(i in 1:nGroup){
    gsubs=iB[i]:iE[i]
    nsubs=length(gsubs)
    pen=1:nsubs
    laby=nsubs:1
    panelSelect(panels,i,3)
    panelScale(panRx,panRyGrp[,i])
    panelFill(col=panCol[i])
    panelGrid(x=panGridx,y=panGridyGrp[,i],col='white',lwd=1)
    axis(side=2,at=panGridyGrp[,i],tck=0,mgp=c(2,.2,0),
            hadj=1,las=1,cex.axis=cex.axis)
    panelOutline(col='black')
    shift= ((1:nsubs -.5)/nsubs - .5)/3 
    for (j in nsubs:1){
      k=gsubs[j]
      
      lines(year,syphRows[k,3:22],col=lineCol[pen[j]],lwd=2)
#      points(year,syphRows[k,3:22],pch=21,bg=lineCol[pen[j]],
#                           col=lineCol[pen[j]],cex=.5)
    }
    if(i==nGroup){
       axis(side=1,at=panGridx,
       labels=TRUE,
       col='black',mgp=c(1.0,-0.1,0),tck=FALSE,cex.axis=cex)
    }
}

# 7. Plot Maps______________________________________________
  
rxpoly=range(stateVBorders$x,na.rm=T)
rypoly=range(stateVBorders$y,na.rm=T)
expandR =function(x,f=1.08)mean(x)+f*diff(x)*c(-.5,.5)
rxpoly=expandR(rxpoly)
rypoly=expandR(rypoly)

polygonId = stateVBorders$st[is.na(stateVBorders$x)]
regionId = rownames(syphRows)


panelSelect(panels,1,1)
panelScale()
mtext(side=3,line=line2,'Cumulative Micromaps',cex=cex,font=1)
mtext(side=3,line=line1,'Sort: State Maximum Rate',cex=cex,font=1)

for (i in 1:nGroup){
   panelSelect(panels,i,1)
   panelScale(rxpoly,rypoly)
   gsubs = iB[i]:iE[i]
   gnams = regionId[gsubs]
   front = regionId[1:iE[i]] 
   #if(i>7)front = regionId[iB[i]:51] else front = regionId[1:iE[i]] 
   #if(i==7)front=regionId[iB[i]:iE[i]]
   #front=gnams

   back = is.na(match(stateVBorders$st,front))
   polygon(stateVBorders$x[back], stateVBorders$y[back],col="white",border=wgray)
   polygon(nationVBorders$x,nationVBorders$y,col=mgray,density=0,lwd=1)  
   highlight = !is.na(match(stateVBorders$st,gnams))
   pen= match(polygonId,gnams)
   pen=pen[!is.na(pen)]
   fore = !back
   previous = fore & !highlight
   if(any(previous))polygon(stateVBorders$x[previous],stateVBorders$y[previous],
                         col=wyellow,border="black")
 
   polygon(stateVBorders$x[highlight],stateVBorders$y[highlight],col=lineCol[pen],border='black') 
}

panelSelect(panTop,mar='top')
panelScale()
text(x=.5,y=.82,"Primary Syphilis, Males",adj=.5,cex=tcex)
text(x=.5,y=.58,"1984 to 2003",adj=.5,cex=tcex)

if(names(dev.cur())=="pdf")dev.off()


