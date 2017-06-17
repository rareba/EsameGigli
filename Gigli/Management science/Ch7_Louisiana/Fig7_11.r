# File     Fig7_11.r
#          Parish Percent Change 2006 to 2007
#          Side by side smooth scatterplots 
#          For Black and Whites 
#
# By       Dan Carr
#
# Note      Three Parishes omitted from plot
#           Orleans, St. Bernard, and Vernon 
#           First two percent change > 16 
#           Vernon  percent change < -8 omitted from plot


#  1. Graphics Device__________________________


pdf(w=6.6,h=3.7,file="Fig7_11_bwSmooth.pdf")
pdfOn = TRUE

#windows(w=6.5,h=3.7)

# 2. Extract data______________________________

names(katrinaBig)
yB = katrinaBig$Bpc0607
yW = katrinaBig$Wpc0607
pov = 100*katrinaBig$PctAllPov
lab = katrinaBig[,1]

# 3.  find outliers and remove____________________ 

which(yB >= 16)
which(yB==min(yB))

subs = c(36,44,58)
mat = cbind(pov,yB,yW)[c(36,44,58),]
rownames(mat)=lab[subs]
mat

povSub = pov[-subs]
yBSub = yB[-subs]
yWSub = yW[-subs]
labSub = lab[-subs]

#  4. Panel Layout______________________________ 

topMar =.2
leftMar = .4
rightMar = 0
bottomMar = .4
cex=.85
pan = panelLayout(nr=1,nc=2,borders=rep(.2,4),
       topMar=topMar,bottomMar=bottomMar,
       leftMar=leftMar,rightMar=rightMar,
       colSep = c(0,.07,0))

# 5. Scaling and grid lines______________________

expandRange = function(x,f=1.04)mean(x)+f*diff(x)*c(-.5,.5)

rx = range(pov)
ry = range(yB)
rx = expandRange(rx,f=1.08)
ry = expandRange(ry,f=1.08)
ry=c(-4.7,8)

panGridX = c(10,20,30,40)
panGridY = seq(-4,8,length=4)

# 6. Plot Black____________________________________

panelSelect(pan,1,1)
panelScale(rx,ry)
panelFill(col="#E0E0E0")
panelGrid(x=panGridX,y=panGridY,col="white")
panelGrid(x=0,col="#008000")

points(povSub,yBSub,pch=21,bg='cyan',cex=1.2)
subs=c(44,58)
ans = loess(yBSub~povSub,degree=1,span=.5)

xnew  = seq(min(pov),max(pov),length=100)
lines(xnew,predict(ans,xnew),lwd=3,col='blue')
panelOutline()
axis(side=1,at=panGridX,tck=0,mgp=c(2,0,0),cex.axis=cex)
axis(side=2,at=panGridY,tck=0,mgp=c(2,.3,0),cex.axis=cex,las=2)

mtext(side=2,line=1.5,"Population Percent Change 2006 to 2007",cex=cex)
mtext(side=1,line=1,"Percent People In Poverty: 2000 Census",cex=cex)
mtext(side=3,line=.3,"Black Population",cex = cex)

# 7. Whites_________________________________________

panelSelect(pan,1,2)
panelScale(rx,ry)
panelFill(col="#E0E0E0")
panelGrid(x=panGridX,y=panGridY,col="white")
panelGrid(x=0,col="#008000")

points(povSub,yWSub,pch=21,bg='cyan',cex=1.2)
subs=c(44,58)
ans = loess(yWSub~povSub,degree=1,span=.5)

xnew  = seq(min(pov),max(pov),length=100)
lines(xnew,predict(ans,xnew),lwd=3,col='blue')
panelOutline()
axis(side=1,at=panGridX,tck=0,mgp=c(2,0,0),cex.axis=cex)
# axis(side=2,at=panGridY,tck=0,mgp=c(2,.3,0),cex.axis=cex,las=2)
mtext(side=1,line=1,"Percent People In Poverty: 2000 Census",cex=cex)
mtext(side=3,line=.3,"White Population",cex = cex)

if(pdfOn){
   dev.off()
   pdfOn=FALSE
}

