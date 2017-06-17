# File     stateMicromap.r
# By:      Dan Carr,  Splus version 2003? R Version?   
# Updated  Jim Pearson, April 20, 2009
# Updated  Dan Carr, May 31,2010


#  Dependencies:   stateMicromapSetDefaults
#                  panelFunctions.r
#                  stateVBorders
#                  nationVBorders

stateMicromap = function(
    stateframe,
    panelDesc,
    rowNames=c("ab","fips","full")[1],
    sortVar=NULL, 
    ascend=T,     

    title=c("",""),
    plotNames=c("ab","full")[2],
    colors=stateMicromapDefaults$colors,
    details= stateMicromapDefaults$details)
{


#  Function arguments
#     stateframe:  a data.frame
#             rownames must be state abbreviations, names, or fips codes
#             Must include variables used for 
#                 Dot, DotConf, DotSE, and arrow panels 
#      
#             A data.frame needs at least 2 columns for to keep from
#             degenerating in some situations. Add a second column to avoid
#             this. Later the function itself could do this.
#           
#                   let oneCol be a dataframe with one variab
#                   ord = order(oneCol[,1])
#                   dat = oneCol[ord,]
#                   rownames(dat) yields NULL  
#                          so the state names to use after sorting are lost  
#
# panelDesc   data.frame                
#             Example
#             panelDesc = data.frame(
#                type=c('mapcum','id','dotconf','dotconf'   ),
#                lab1=c('','','White Males','White Females'),
#                lab2=c('','','Rate and 95% CI','Rate and 95% CI'),
#                lab3=c('','','Deaths per 100,000','Deaths per 100,000'),
#                col1=c(NA,NA,2,9 ), 
#                col2=c(NA,NA,4,11),
#                col3=c(NA,NA,5,12),
#                refval=c(NA,NA,NA,wflungbUS[,1]),
#                boxplot=c('','','','')
#                style=c('tails',NA,NA,NA)                        
#                size = c(2,1,3,3))
#             The first item in each variable defining row above describes the first column of panels
#             The second item in each variable row above describes the second column of panels
#             an so on. Each column of panels may have both numeric and character string descriptors
#             so cannot cannot be describes by a single variables.  This transpose solution
#             me be confusion but works.   
# 
#  
# type refers the panel type,  valid types are  
#    "map", "mapCum","mapTail","mapMedian",
#    "id", 
#    "dot", "dotse","dotconf",
#    "bar", "arrow", 
#    "boxplot"
#                   
#         For non-highlighted foreground contours
#         map accumulates states top to bottom
#         maptail accumulates states outside in
#         mapMedian features above median states and below median states
#
#         bars  will accept negative values and plot from 0 in that direction.
#
# col1, col2, col3
#    numbers refers the variables in stateframe columns to be used as data
#    for state ranks, dot plots, bars, and arrows columns. Use NA as place holders.
#      
#       Dot and bar plots require one variable 
#              and the number in col1 will indicate its the column location in stateframe.  
#       
#
#       Dotse and arrows require two variables so numbers in 
#               col1 and col2 will indicate the two column locations in stateframe.
#               For dotse the variables are estimates and standard errors, respectively
#               For arrows the variables are the beginning and ending values respectively 
#     
#       Dotconf requires 3 columns
#           estimate, lower and upper bounds
#         
#       Boxplots requires the name of a "boxplot" object
#           of a boxplot objects. Use "" as a place holder
#
# lab1, lab2
#     Two label lines at the top of columns. Use "" for blank
# lab3
#     One label line at the bottom of a each column,
#     typically measurement units.  Use "" for blank
# refValues
#     name of objects providing a reference values shown
#     as a line down the column   
#
# boxplot
#      names a list object with a boxplot for each state.
#      states much be label by their abbreviation.
#                
#  Note:  Some descriptors may be omitted if none of the
#         panel plots need them.
#         often refValues and boxplots can be omitted            
#
# rowNames  type of state id used as row.names in stateframe
#           default is "ab" for abbreviation, 
#
# plotNames state label use in in the plot
#           default is the full name
#
# sortVar   a column subscript of stateframe to specific
#   the variable used in sorting. 
#   (can be a vector of column subscripts to break ties)
#
# title      A vector with one or two character strings to
#            use the title. The spacing
#                  
#      
# ascend   T default sorts in ascending order
#
# colors   a color palette as a vectors of strings
#              5 colors for states in a group of 5
#              1 color for the median state
#              1 foreground color for non-highlighted states in the map
#
# details   spacing, line widths and other details
#      see rlStateDefaults$details
#      The r1StateDefaults$details contains the line spacing and text size, group spacing, etc.
#      instead of the panel tables.  Yet, panels and the default must be in sync.
#
# legenddefault F allocates not extra space
#                 T allocates .5 inches
#                 the height to allocate in inches
#                 (function for adding legends)    
#

#______________________Argument Checks______________________

# Check data format
if(!is.data.frame(stateframe)) stop("First argument must be a data.frame")
nr = nrow(stateframe)
if(nr!=51) stop("Currently 51 rows (states plus DC) are required")
#
#   JP - Make sure the input data.frame is at least two columns - add one.
#   JP - Dot code (at least) has problems with single column stateframe structures.
#   To protect code and any other areas that may have problems,
#   quick fix is to append "0" column to the right of the provided data.frame.
#   This forces the data.frame to be at least 2 columns.
#
Ex = rep(0,nr)
SFrame = cbind(stateframe,Ex)

#  headers or US rate rows should not be included in data.format.

# Check panel description format
if(!is.data.frame(panelDesc))
    stop("Panel descriptor must be a data.frame")

# Check for panelDesc$type validity
valid = c("map","mapcum","maptail","mapmedian",
          "id","arrow",
          "dot","dotse","dotconf",
          "bar","boxplot")        # idDot and rank are not currently implemented
type = as.character(panelDesc$type)
subs = match(type,valid)
if(any(is.na(subs)))
    stop(paste("Invalid panel type:",type[is.na(subs)]))

ncol = nrow(panelDesc)
blank = rep('',ncol)
if(is.null(panelDesc$lab1)) lab1 = blank else
              lab1 = as.character(panelDesc$lab1)

if(is.null(panelDesc$lab2)) lab2 = blank else
              lab2 = as.character(panelDesc$lab2)

if(is.null(panelDesc$lab3)) lab3 = blank else
              lab3 = as.character(panelDesc$lab3)

# Column width defaults

if(is.null(panelDesc$colsize)){
   colSize = rep(0,length(type))
   loc = substring(type,1,3)=='map'
   if(any(loc))colSize[loc] = details$mapWidth

   loc = type=='id'
   if(any(loc)){
     sub = ifelse(plotNames=="full",1,2)
     colSize[loc] = details$idWidth[sub]
   }
   plotWidth = par("pin")[1]
   equalWidth= (plotWidth-sum(colSize))/sum(colSize==0)
   colSize = ifelse(colSize==0,equalWidth,colSize)
}

# Define panel functions=====================================

# Arrow==============================================================

# JP - fixed error when difference is zero.

rlStateArrow = function(j){

  x1 = dat[,col1[j]]  # Arrow uses two columns from the state.frame
  x2 = dat[,col2[j]]
  refval = refVals[j]
  good = !is.na(x1+x2)
  rx = range(x1,x2,na.rm=T)              # range on X axis for all states 
  rx = sc*diff(rx)*c(-.5,.5)+mean(rx)    # set up low and high for all states, and mean
  ry = c(0,1)                            # Y axis = 0 to 1.. 

  # ____________labeling and axes_______________

  panelSelect(panels,1,j)
  panelScale(rx,ry)                     # scale for all states.
  mtext(lab1[j],side=3,line=line1,cex=cexText)    # top labels (2)
  mtext(lab2[j],side=3,line=line2,cex=cexText)
  axis(side=3,mgp=mgpTop,tick=F,cex.axis=cexText)

  panelSelect(panels,ng,j)
  panelScale(rx,ry)
  # padj in axis needed to make grid line label close
  axis(side=1,mgp=mgpBottom,padj=padjBottom,tck=0,cex.axis=cexText) # bottom pad
  mtext(side=1,lab3[j],line=line3,cex=cexText)                      # bottom labels.

  #_________________drawing loop__________________
  #  Draw all of the elements - one per state.

  for (i in 1:ng){
     gsubs = ib[i]:ie[i]       # get range ib to ie
     ke = length(gsubs)        # get length
     laby = ke:1               
     pen = if(i==6) 6 else 1:ke # if index=6 (?) then pen = 6, else 1:ke (length of line.)
     panelSelect(panels,i,j)
     panelScale(rx,c(1-pad,ke+pad))
     panelFill(col=colBackgr)
     axis(side=1,tck=1,labels=F,col=colGrid,lwd=lwdGrid) # grid lines
     if(!is.na(refval))lines(rep(refval,2),c(1-padMinus,ke+padMinus),
            lty=ltyRefVal,lwd=lwdRefVal,col=colRefVal)
     panelOutline(col=colOutline)
  
     oldpar = par(lend="butt")
     for (k in 1:ke){
        m = gsubs[k]
        if(good[m]){
          if(abs(x1[m]-x2[m])>0){
             arrows(x1[m],laby[k],x2[m],laby[k],col=colors[pen[k]],length=lengthArrow,lwd=lwdArrow)
          } else {
             points(x1[m],laby[k],pch=20,cex=cexDot,col=colors[pen[k]])
          }
        }  
     }   
     par(oldpar)
   }

  # ____________________________PanelOutline____________________

  groupPanelOutline(j)

  if(!is.na(refval))rlStateRefVal(j,refval)

}

#Bar====================================================================

rlStateBar = function(j){

  py =  barht*c(-.5,-.5,.5,.5,NA)
  ry = c(0,1)
  refval = refVals[j]

  # ________scale x axis________________________

  x = dat[,col1[j]]             # one column
  rx = range(x,na.rm=T)
  if(rx[2]<=0){
    rx[2]= 0
    rx[1] = mean(1,sc)*rx[1]
  } else if (rx[1] >=0 ) {
       rx[1]= 0
       rx[2] = rx[2]*(1+sc)/2
    } else {
       rx = sc*diff(rx)*c(-.5,.5)+mean(rx)
    }

  good = !is.na(x)

  # ____________label axis_______________

  panelSelect(panels,1,j)
  panelScale(rx,ry)
  mtext(lab1[j],side=3,line=line1,cex=cexText)
  mtext(lab2[j],side=3,line=line2,cex=cexText)
  axis(side=3,mgp=mgpTop,tick=F,cex.axis=cexText)

  panelSelect(panels,ng,j)
  panelScale(rx,ry)
  # padj in axis needed to make grid line label close
  axis(side=1,mgp=mgpBottom,padj=padjBottom,tick=F,cex.axis=cexText)
  mtext(side=1,lab3[j],line=line3,cex=cexText) 

  # _______________drawing loop___________________

  for (i in 1:ng){
     gsubs = ib[i]:ie[i]
     ke = length(gsubs)
     pen = if(i==6)6 else 1:ke
     laby = ke:1 
     panelSelect(panels,i,j)
     panelScale(rx,c(1-pad,ke+pad))
     panelFill(col=colFill)
     axis(side=1,tck=1,labels=F,col=colGrid,lwd=lwdGrid) # grids
     if(!is.na(refval))
       lines(rep(refval,2),c(1-padMinus,ke+padMinus),
            lty=ltyRefVal,lwd=lwdRefVal,col=colRefVal)
     panelOutline(col=colOutline) 
     for (k in 1:ke){
        m = gsubs[k]
        val = x[m]
        if(good[m]){
           polygon(c(0,val,val,0,NA),rep(laby[k],5)+py,col=colors[pen[k]])
           polygon(c(0,val,val,0,NA),rep(laby[k],5)+py,col=colBarOutline,density=0)
        }
        lines(c(0,0),c(1-.5*barht,ke+.5*barht),col=1) # bar base line  
     }   
  }

  # ____________________________PanelOutline____________________

  groupPanelOutline(j)
 
  # _______Reference Value Legend

  if(!is.na(refval))rlStateRefVal(j,refval)
}

#Boxplot===========================================================

rlStateBoxplot = function(j,boxnam){
   boxlist = get(boxnam,pos=1)      # get name of box data object list.
   refval = refVals[j]              # get referrence to object

   # y boxplot scaling              # standard - horizontal box - no vertical (y) dimensions
   py = c(-.5,-.5,.5,.5)
   thiny = thinBox*py
   thicky = thickBox*py 
   medy = medianLine*c(-.5,.5)
  
   ry = c(0,1)                      # used in y scaling for grid lines
  
   #_______________Gather stats and put in State Order______________
  
   # For the moment match on names
   #                     Boxlist = names, stats, out, group, 
   stats = boxlist$stats       # Name,1-low,2-25%,3-median,4-75%,5-high  - 5 variables for each state.
   #
   thin = stats[c(1,5,5,1),]   # a column for each state - thin line - outliers - columns in boxlist (1,5,5,1)
   thick = stats[c(2,4,4,2),]  # a column for each state - thick line - 25% to 75% - columns in boxlist(2,4,4,2)
   med = stats[3,]             # a single value for each state (median)
   nam = boxlist$names         # state name.
  
   # conf = boxlist$conf
   outlier = rep(F,length(med))
   if(!is.null(boxlist$out)){
      out = boxlist$out
      group = boxlist$group
      outlier[unique(group)] = T
   }

   # Need to put in order
   ord = match(stateId,nam)

   # what about missing values
   # if NA do not plot on that line

   # What about name type inconsistency  
   # I will require use of state name abbreviation
   # Fips codes be useful
   #    split() based on first two digits of county fips  
   #    I could stash state fips in stateframe sorted order

   # Boxplot median sorting
   #   Currently the user would need to sort the 
   #   medians in the state frame making sure
   #   the row.names were correct.
   #   
   #   boxlist$stats[3,]
      

   # ___________ scale x axis_______________

   if(is.null(out)) rx = range(stats) else
              rx = range(stats,out)
   rx = sc*diff(rx)*c(-.5,.5)+mean(rx)
   dx = diff(rx)/200
   px= c(-dx,-dx,dx,dx)

   # ____________labeling axes_______________

   panelSelect(panels,1,j)
   panelScale(rx,ry)
   mtext(lab1[j],side=3,line=line1,cex=cexText)
   mtext(lab2[j],side=3,line=line2,cex=cexText)
   axis(side=3,mgp=mgpTop,tick=F,cex.axis=cexText)

   panelSelect(panels,ng,j)
   panelScale(rx,ry)
   # padj in axis needed to make grid line label close
   axis(side=1,mgp=mgpBottom,padj=padjBottom,tick=F,cex.axis=cexText)
   mtext(side=1,lab3[j],line=line3,cex=cexText) 

   # _______________drawing loop___________________

   oldpar = par(lend="butt")
   for (i in 1:ng){
      gsubs = ib[i]:ie[i]
      ke = length(gsubs)
      pen = if(i==6) 6 else 1:ke
      laby = ke:1 
      panelSelect(panels,i,j)
      panelScale(rx,c(1-pad,ke+pad))
      panelFill(col=colFill)
      axis(side=1,tck=1,labels=F,col=colGrid,lwd=lwdGrid) # grid lines
      if(!is.na(refval))
         lines(rep(refval,2),c(1-padMinus,ke+padMinus), lty=ltyRefVal,lwd=lwdRefVal,col=colRefVal)
      panelOutline(col=colOutline)

      for (k in 1:ke){
         m = ord[gsubs[k]] #m is the location of the state in boxlist
         if(is.na(m)) next
         kp = pen[k]      # color number
         ht = laby[k]
         if(outlier[m]){
            vals = out[group==m]
            points(vals,rep(ht,length(vals)),pch=1,
               col=ifelse(useBlack,"black",colors[kp]),
               cex=cexOutlier,lwd=lwdOutlier)
         }  
         polygon(thin[,m],rep(ht,4)+ thiny,col=colors[kp],border=NA)
#        polygon(thin[,m],rep(ht,4)+ thiny,col=colBoxOutline,density=0)
         polygon(thick[,m],rep(ht,4)+ thicky,col=colors[kp],border=NA)
#        polygon(thick[,m],rep(ht,4)+ thicky,col=colBoxOutline,density=0)
#        points(med[m],ht,col=colDotMedian,pch=pchMedian,cex=cexMedian)
#        points(med[m],ht,col="black",pch=1,cex=cexMedian)
#        polygon(med[m]+px,ht+medianLine*dy,lwd=1,density=0)
#        Lines looked crooked
         segments(med[m],ht+medy[1],med[m],ht+medy[2],
               col=colMedian,lwd=lwdMedian)
#        lines(rep(med[m],2),ht+medy,col=colMedian,lwd=lwdMedian)
      }   
   }
   par(oldpar)
   # ____________________________PanelOutline____________________

   groupPanelOutline(j)

   if(!is.na(refval))rlStateRefVal(j,refval)

}

# Dot==============================================================


rlStateDot = function(j){

  # Single Dot, no extra line or interval
  #  JB - add "as.double(as.vector(" to handle variation in how objects are converted.
  x = as.double(as.vector(dat[,col1[j]]))   # one value - the dot.
  good = !is.na(x)
  refval = refVals[j]
  ry = c(0,1)

  #____________scale x axis______________________
  rx = range(x,na.rm=T)
  rx = sc*diff(rx)*c(-.5,.5)+mean(rx)

  # ____________labeling axis_______________
  panelSelect(panels,1,j)
  panelScale(rx,ry)
  mtext(lab1[j],side=3,line=line1,cex=cexText)
  mtext(lab2[j],side=3,line=line2,cex=cexText)
  axis(side=3,mgp=mgpTop,tick=F,cex.axis=cexText)
 
  panelSelect(panels,ng,j)
  panelScale(rx,ry)
  # padj in axis needed to make grid line label close
  axis(side=1,mgp=mgpBottom,padj=padjBottom,tick=F,cex.axis=cexText)
  mtext(side=1,lab3[j],line=line3,cex=cexText) 

  # _______________drawing loop___________________
  for (i in 1:ng){
     gsubs = ib[i]:ie[i]
     ke = length(gsubs)
     pen = if(i==6) 6 else 1:ke
     laby = ke:1 
     panelSelect(panels,i,j)
     panelScale(rx,c(1-pad,ke+pad))
     panelFill(col=colFill)
     axis(side=1,tck=1,labels=F,col=colGrid,lwd=lwdGrid) # grid
     if(!is.na(refval))
        lines(rep(refval,2),c(1-padMinus,ke+padMinus), lty=ltyRefVal,lwd=lwdRefVal,col=colRefVal)
     panelOutline(colOutline) 
     for (k in 1:ke){
        # step through values for this panel
        m=gsubs[k]
        if(good[m]){    # if good - plot dot.
           points(x[m],laby[k],pch=pch,cex=cexDot,col=colors[pen[k]])
           if (OutlineDot)   # check to see if outline requested.
              points(x[m],laby[k],pch=1,cex=cexDot,col=colDotOutline)         
        }
 #      points(x[gsubs],laby,pch=pch,cex=cexDot,col=colors[pen])
 #      if (OutlineDot)
 #         points(x[gsubs],laby,pch=1,cex=cexDot,col=colDotOutline,
 #              lwd=lwdDotOutline)
     }
  }

  # ____________________________PanelOutline____________________

   groupPanelOutline(j)

  if(!is.na(refval))rlStateRefVal(j,refval)

}


# DotConf===========================================================
 
rlStateDotConf = function(j){

  x = dat[,col1[j]]             # Col 1 = DOT - median/mean
  lower = dat[,col2[j]]         # Col 2 = lower
  upper = dat[,col3[j]]         # Col 3 = upper
  good1 = !is.na(x)
  good2 = !is.na(upper+lower)
  if(!all(good2))warning("Missing Value in Confidence Intervals") 
  refval = refVals[j]
  ry = c(0,1)

  #_________________scale x axis________________
  rx = range(upper,lower,x,na.rm=T)
  rx = sc*diff(rx)*c(-.5,.5)+mean(rx)
  # ____________labeling axes_______________
  
  # panel 1 has line 1 and line 2, top Axis + later image.

  panelSelect(panels,1,j)     # labels (line 1, line 2 and top axis)
  panelScale(rx,ry)
  mtext(lab1[j],side=3,line=line1,cex=cexText)
  mtext(lab2[j],side=3,line=line2,cex=cexText)
  axis(side=3,mgp=mgpTop,tick=F,cex.axis=cexText)
  
  # panel ng has bottom axis and line 3 + later image.
  panelSelect(panels,ng,j)    # labels (bottom -> axis and line 3)
  panelScale(rx,ry)
  # padj in axis needed to make grid line label close
  axis(side=1,mgp=mgpBottom,padj=padjBottom,tick=F,cex.axis=cexText)
  mtext(side=1,lab3[j],line=line3,cex=cexText) 

  # _______________drawing loop___________________
  
  for (i in 1:ng){
     gsubs = ib[i]:ie[i]
     ke = length(gsubs)
     pen = if(i==6) 6 else 1:ke
     laby = ke:1
     panelSelect(panels,i,j)   
     panelScale(rx,c(1-pad,ke+pad))   # Adjusted scale for interior
     panelFill(col=colFill)
     axis(side=1,tck=1,labels=F,col=colGrid,lwd=lwdGrid) # vertical grid lines
     if(!is.na(refval))
        lines(rep(refval,2),c(1-padMinus,ke+padMinus),lty=ltyRefVal,lwd=lwdRefVal,col=colRefVal)
     panelOutline(col=colOutline)     # outline scaled image.
     for (k in 1:ke){ 
        m = gsubs[k]

        if(good2[m]){
           lines(c(lower[m],upper[m]),rep(laby[k],2),col=colors[pen[k]],lwd=lwdConf)
        }
        if(good1[m]){
           points(x[m],laby[k],pch=pch,cex=cexDot,col=colors[pen[k]])
           if (OutlineDot) {
              points(x[m],laby[k],pch=1,cex=cexDot,col=colDotOutline)
           } 
        }  
     }   

     #   segments(lower[gsubs],laby,upper[gsubs],laby,col=color[pen],lwd=lwdConf)
     #   points(x[gsubs],laby,pch=pch,cex=dotCex,col=colors[pen])
     #   points(x[gsubs],laby,pch=1,cex=cexDot,col=colDotOutline,
     #         lwd=lwdDotOutline)
  }

  # ____________________________PanelOutline____________________

  groupPanelOutline(j)

  if(!is.na(refval))rlStateRefVal(j,refval)

}


#groupPanelOutline===================================================

groupPanelOutline = function(j){
   for (i in 1:3){
      panelSelect(panelGroup,i,j)
      panelScale()
      panelOutline()
   }
}

#DotSE===============================================================

rlStateDotSe = function(j){

  x = dat[,col1[j]]
  zval = qnorm(.5+conf/200)
  inc = zval*dat[,col2[j]]
  upper = x+inc
  lower = x-inc
  good1 = !is.na(x)
  good2 = !is.na(upper)
  if(any(is.na(inc)))warning("Missing Value in Standard Errors")
  refval = refVals[j]
  ry=c(0,1)

#_______________scale x axis__________________
  rx = range(upper,lower,x1,na.rm=T)
  rx = sc*diff(rx)*c(-.5,.5)+mean(rx)

# ____________labeling axes_______________

  panelSelect(panels,1,j)
  panelScale(rx,ry)
  mtext(lab1[j],side=3,line=line1,cex=cexText)
  mtext(lab2[j],side=3,line=line2,cex=cexText)
  axis(side=3,mgp=mgpTop,tick=F,cex.axis=cexText)

  panelSelect(panels,ng,j)
  panelScale(rx,ry)
  # padj in axis needed to make grid line label close
  axis(side=1,mgp=mgpBottom,padj=padjBottom,tick=F,cex.axis=cexText)
  mtext(side=1,lab3[j],line=line3,cex=cexText) 

#__________________drawing loop________________

  for (i in 1:ng){
     gsubs = ib[i]:ie[i]
     ke = length(gsubs)
     pen = if(i==6)6 else 1:ke
     laby = ke:1 
     panelSelect(panels,i,j)
     panelScale(rx,c(1-pad,ke+pad))
     panelFill(col=colFill)
     axis(side=1,tck=1,labels=F,col=colGrid,lwd=lwdGrid) # grid
     if(!is.na(refval))
       lines(rep(refval,2),c(1-padMinus,ke+padMinus),
            lty=ltyRefVal,lwd=lwdRefVal,col=colRefVal)
     panelOutline(colOutline)
     for (k in 1:ke){
        m = gsubs[k]
        if(good2[m]){
           lines(c(lower[m],upper[m]),rep(laby[k],2),
           col=colors[pen[k]],lwd=lwdConf)
        }
        if(good1[m]){
           points(x[m],laby[k],pch=pch,cex=cexDot,col=colors[pen[k]])
           if(OutlineDot){ 
              points(x[m],laby[k],pch=1,cex=cexDot,col=colDotOutline) 
           }
        }  
     }   
   }

# ____________________________PanelOutline____________________

   groupPanelOutline(j)

   if(!is.na(refval))rlStateRefVal(j,refval)
 }

# ID===============================================================

rlStateId = function(j){

  py = barht*c(-.5,-.5,.5,.5,NA)
  px = c(.04,.095,.095,.04,NA)
  idstart = .137
  dotstat = .0675
  rx = c(0,diff(panels$coltabs[j+1,])) # width in inches
  ry = c(0,1)

#______________________panel labels_____________

  panelSelect(panels,1,j)      # start at I = 1, but j= is the current column.
  panelScale(rx,ry)
  mtext('U.S.',side=3,line=line1,cex=cexText)
  mtext('States',side=3,line=line2,cex=cexText)

# Cycle thought the GROUPS (ng)
  for (i in 1:ng){
     gsubs = ib[i]:ie[i]           # first element of group to last element of group.
     ke = length(gsubs)            # number of elements.
     laby = ke:1
     pen = if(i==6)6 else 1:ke
     panelSelect(panels,i,j)
     npad = ifelse(i==6,.57,pad)
     panelScale(rx,c(1-npad,ke+npad))
     gnams = stateNames[gsubs]
     polygon(rep(px,ke),rep(laby,rep(5,ke))+ py,col=colors[pen])
     polygon(rep(px,ke),rep(laby,rep(5,ke))+py,col=colIdOutline,density=0)
     text(rep(idstart,ke),laby,gnams,adj=0,cex=cexText,xpd=T)
  }

}

# Id Dot================================================================

rlStateIdDot = function(j){

  py = barht*c(-.5,-.5,.5,.5,NA)
  rx = c(0,1)
  ry = c(0,1)

  #______________________panel labels_____________

  panelSelect(panels,1,j)
  panelScale(rx,ry)
  mtext('U.S.',side=3,line=line1,cex=cexText)
  mtext('States',side=3,line=line2,cex=cexText)
 
  for (i in 1:ng){
     gsubs = ib[i]:ie[i]
     ke = length(gsubs)
     laby = ke:1
     pen = if(i==6)6 else 1:ke
     panelSelect(panels,i,j)
     panelScale(rx,c(1-pad,ke+pad))
     gnams = stateNames[gsubs]
     points(dotstart,laby,pch=pch,col=colors[pen],cex=cexDot)
     points(dotstart,laby,pch=1,col=colDotOutline,cex=cexDot)
     text(rep(idstart,ke),laby+.1,gnams,adj=0,cex=cexText)
  }

}

#Map====================================================================

rlStateMap = function(j){

  # Works using state abbreviations
  # bnd.ord gives abbreviations in the
  #           the boundary are stored.
  # stateId give the abbreviations in the order plotted 

  bnd.ord = stateVBorders$st[is.na(stateVBorders$x)] # State abbrev
  rxpoly = range(stateVBorders$x,na.rm=T)
  rypoly = range(stateVBorders$y,na.rm=T)

  # ____________labeling and axes_______________
  
  panelSelect(panels,1,j)
  panelScale()
  par(xpd=T)
  mtext("Highlighted",side=3,line=line1,cex=cexText)
  mtext("States",side=3,line=line2,cex=cexText)

  # Drawing Loop

  for (i in 1:ng){

    if(i==6){                   # line break in maps.   Group 6 - middle group of 11.
      panelSelect(panels,6,j)
      panelScale()
      panelFill (col=colBackgr)
      panelOutline()
      text (.5,.55,'Median For Sorted Panel',cex= cexText*0.8)
      next
    }
    
    panelSelect(panels,i,j)     # Do map in - Panels by group...
    panelScale(rxpoly,rypoly)
    gsubs = ib[i]:ie[i]

    if(i==5) gsubs = c(gsubs,26)  # slot 5 - add 26 to this group
    if(i==7) gsubs = c(gsubs,26)  # slot 7 - add 26 to this group
  
    gnams = stateId[gsubs]
  
    # now find the state regions to plot
    back = is.na(match(stateVBorders$st,gnams))
    if(any(back)){
      polygon(stateVBorders$x[back], stateVBorders$y[back],
          density=-1, col=colBackgr, border=F)         # fill in states
      polygon(stateVBorders$x[back], stateVBorders$y[back],
          col=colLineBackgr, density=0, lwd=lwdBackGr) # outline states
    }

    fore = !back
    pen = match(bnd.ord,gnams,nomatch=0)
    pen = pen[pen>0]
    polygon(stateVBorders$x[fore], stateVBorders$y[fore],
          density=-1, col=colors[pen], border=F)        # fill in states
    polygon(stateVBorders$x[fore], stateVBorders$y[fore],
          density=0,  col=colLineForegr, lwd=lwdForeGr) # outline states
  
    polygon(nationVBorders$x, nationVBorders$y,
          density=0, col=colLineNation, lwd=lwdNation)  # outside US boundary
  
    # might be made a function
    if(i==1){
       text(135,31,'DC',cex=cexState,adj=.5, col=1)
       text(22, 17,'AK',cex=cexState,adj=.5, col=1)
       text(47, 8, 'HI',cex=cexState,adj=.5, col=1)
    }
  
  }  # i loop

}

#MapCum====================================================================

rlStateMapCum = function(j){

  # Works using state abbreviations
  # bnd.ord gives abbreviations in the
  #           the boundary are stored.
  # stateId give the abbreviations in the order plotted 

  bnd.ord = stateVBorders$st[is.na(stateVBorders$x)] # State abbrev
  rxpoly = range(stateVBorders$x,na.rm=T)
  rypoly = range(stateVBorders$y,na.rm=T)

  # ____________labeling and axes_______________

  panelSelect(panels,1,j)
  panelScale()

  box.x = rep(c(.14,.14,.208,.208,NA),2)-.04
  par(xpd=T)
  y.ht = c(.05,.172)
  y.sep = .19*legfactor             #  .185
  box.y = 1.025*legfactor +c(y.ht,rev(y.ht),NA) + 0.01  # was .07

  polygon(box.x,c(box.y,box.y+y.sep),col=c(colBackgr,colors[7]))
  polygon(box.x,c(box.y,box.y+y.sep),col=1,density=0)
  
  mtext("Cumulative Maps",side=3,line=line1,cex=cexText)
  mtext('States Featured Above',side=3,line=line2,at=.20,cex=cexText,adj=0)
  mtext('States Featured Below',side=3,line=lineTiclab,at=.20,cex=cexText,adj=0)

  # Drawing Loop

  for (i in 1:ng){

     if(i==6){
        panelSelect(panels,6,j)
        panelScale()
        panelFill (col=colBackgr)
        panelOutline()
        text (.5,.48,'Median For Sorted Panel',cex=cexText)
        next
     }
     panelSelect(panels,i,j)
     panelScale(rxpoly,rypoly)
     gsubs = ib[i]:ie[i]

     if(i < 5)  cont = stateId[1:(5*i)] else cont = stateId[1:(5*i-4)]
     if(i == 5) {gsubs = c(gsubs,26); cont = stateId[1:26]}
     if(i == 7) gsubs = c(gsubs,26) 

     gnams = stateId[gsubs]

     # now find the state regions to plot
     back = is.na(match(stateVBorders$st,cont))
     if(any(back)){
           polygon(stateVBorders$x[back],stateVBorders$y[back],
               density=-1, col=colBackgr,border=F)         # fill in states
           polygon(stateVBorders$x[back], stateVBorders$y[back],
               density=0,  col=colLineBackgr,lwd=lwdBackGr) # outline states
     }

     fore = !back
     pen = match(bnd.ord,gnams,nomatch=0)
     pen = ifelse(pen==0 & match(bnd.ord,cont,nomatch=0)>0,7, pen)
     pen = pen[pen>0]
     polygon(stateVBorders$x[fore], stateVBorders$y[fore],
        density=-1,col=colors[pen], border=F)           # fill in states
     polygon(stateVBorders$x[fore], stateVBorders$y[fore],
        density=0, col=colLineForegr, lwd=lwdForeGr)    # outline states

     polygon(nationVBorders$x,nationVBorders$y,
        col=colLineNation,density=0,lwd=lwdNation)      # US outside boundary

     # might be made a function
     if(i==1){
        text(135,31,'DC',cex=cexState,adj=.5, col=1)
        text(22,17,'AK',cex=cexState,adj=.5, col=1)
        text(47,8,'HI',cex=cexState,adj=.5, col=1)
     }

   }  # i loop
}


# MapMedian=======================================================

rlStateMapMedian = function(j){

  # Works using state abbreviations
  # bnd.ord gives abbreviations in the
  #           the boundary are stored.
  # stateId give the abbreviations in the order plotted
  # This MapMedian cream colors all states above and below the median state. 

  bnd.ord = stateVBorders$st[is.na(stateVBorders$x)] # State abbrev
  rxpoly = range(stateVBorders$x,na.rm=T)
  rypoly = range(stateVBorders$y,na.rm=T)

  # ____________labeling and axes_______________

  panelSelect(panels,1,j)
  panelScale()
  box.x = rep(c(.14,.14,.208,.208,NA),2)+.02   # a pair of boxes.
  par(xpd=T)
  y.ht = c(.05,.172)
  y.sep = .19*legfactor   # .185
  box.y = 1.025*legfactor +c(y.ht,rev(y.ht),NA) + 0.01
  
  polygon(box.x,c(box.y,box.y+y.sep),col=c(colBackgr,colors[7]))
  polygon(box.x,c(box.y,box.y+y.sep),col=1,density=0)

  mtext("Median Based Contours",side=3,line=line1,cex=cexText)
  mtext('States In This Half',side=3,line=line2,at=.26,cex=cexText,adj=0)
  mtext('States In Other Half',side=3,line=lineTiclab,at=.26,cex=cexText,adj=0)

  # Drawing Loop

  for (i in 1:ng){

     if(i==6){
        panelSelect(panels,6,j)
        panelScale()
        panelFill (col=colBackgr)
        panelOutline()
        text (.5,.48,'Median For Sorted Panel',cex=cexText)
        next  
     }
     panelSelect(panels,i,j)
     panelScale(rxpoly,rypoly)
     gsubs = ib[i]:ie[i]
     if(i <= 5) cont = stateId[1:26] else cont = stateId[26:51]
     if(i == 5) gsubs = c(gsubs,26)
     if(i == 7) gsubs = c(gsubs,26) 
     #  gsubs = current state list
     #  cont  = state list to be colored cream.

     gnams = stateId[gsubs]

     # now find the state regions to plot
     back = is.na(match(stateVBorders$st,cont))
     if(any(back)){
          polygon(stateVBorders$x[back],stateVBorders$y[back],
             density=-1,col=colBackgr,border=F)          # fill in states
          polygon(stateVBorders$x[back], stateVBorders$y[back],
             density=0, col=colLineBackgr,lwd=lwdBackGr) # outline states

     }

     fore = !back     # 
     pen = match(bnd.ord,gnams,nomatch=0)
     pen = ifelse(pen==0 & match(bnd.ord,cont,nomatch=0)>0,7, pen)
     pen = pen[pen>0]

     polygon(stateVBorders$x[fore], stateVBorders$y[fore],
        density=-1,col=colors[pen], border=F)       # fill in states
     polygon(stateVBorders$x[fore], stateVBorders$y[fore],
        density=0, col=colLineForegr, lwd=lwdForeGr) # outline states

     polygon(nationVBorders$x,nationVBorders$y,
        density=0, col=colLineNation,lwd=lwdNation)  # outside US boundary

     if(i==1){
        text(135,31,'DC',cex=cexState,adj=.5, col=1)
        text(22,17,'AK',cex=cexState,adj=.5, col=1)
        text(47,8,'HI',cex=cexState,adj=.5, col=1)
     }

   }   # i loop
}

# MapTail=========================================================


rlStateMapTail = function(j){

  # Works using state abbreviations
  # bnd.ord gives abbreviations in the
  #           the boundary are stored.
  # stateId give the abbreviations in the order plotted
  # MapTail shows current states in a group as colored and
  # a tail of states (in cream color) from the outside inward.  
  # 

  bnd.ord = stateVBorders$st[is.na(stateVBorders$x)] # State abbrev
  rxpoly = range(stateVBorders$x,na.rm=T)
  rypoly = range(stateVBorders$y,na.rm=T)

  # ____________labeling and axes_______________

  # column header titles and "box"
  panelSelect(panels,1,j)    #  Line 1 and Line 2 - panel 1
  panelScale()
  # JP - as column labels move around or are repositioned,
  #    the associated BOX below does not follow it.
  box.x = c(.14,.14,.208,.208,NA)+.00
  par(xpd=T)
  y.ht = c(.05,.172)
  y.sep = .185*legfactor
  
  box.y = 1.025*legfactor +c(y.ht,rev(y.ht),NA) + .01
  polygon(box.x,box.y+y.sep,col=colors[7])
  polygon(box.x,box.y+y.sep,col=1,density=0)

  mtext("Two Ended Cumulative Maps",side=3,line=line1,cex=cexText)
  mtext('States Highlighted',side=3,line=line2,at=.25,cex=cexText,adj=0)
  
  #  JP - removed - temp
  #  mtext('Further From Median',side=3,line=lineTiclab,at=.15,cex=cexText,adj=0)

  # Drawing Loop

  for (i in 1:ng){

     if(i==6){
        panelSelect(panels,6,j)
        panelScale()
        panelFill (col=colBackgr)
        panelOutline()
        text (.5,.48,'Median For Sorted Panel',cex=cexText)
        next
     }
     panelSelect(panels,i,j)  
     panelScale(rxpoly,rypoly)
     # get list of states in this group.
     gsubs = ib[i]:ie[i]
     if(i < 5) cont = stateId[1:(5*i)]
     if(i==5){gsubs = c(gsubs,26); cont = stateId[1:26]}
     if(i==7){gsubs = c(gsubs,26); cont = stateId[26:51]} 
     if(i > 7) cont = stateId[(5*i-8):51]
     # get list of group state names 
     gnams = stateId[gsubs]

     # now find the state regions to plot
     #   plot states with cream filling (reported states)
     back = is.na(match(stateVBorders$st,cont))
     if(any(back)){
         # paint fill
         polygon(stateVBorders$x[back],stateVBorders$y[back],
              density=-1,col=colBackgr,border=F)          # fill in states
         # paint lines
         polygon(stateVBorders$x[back], stateVBorders$y[back],
              density=0, col=colLineBackgr,lwd=lwdBackGr) # outline states
     }

     fore = !back
     #  current 5 states with colors.
     pen = match(bnd.ord,gnams,nomatch=0)
     pen = ifelse(pen==0 & match(bnd.ord,cont,nomatch=0)>0,7, pen)
     pen = pen[pen>0]

     polygon(stateVBorders$x[fore], stateVBorders$y[fore],
        density=-1,col=colors[pen], border=F)        # fill in states
     polygon(stateVBorders$x[fore], stateVBorders$y[fore],
        density=0, col=colLineForegr, lwd=lwdForeGr) # outline states

     #  The US border.
     polygon(nationVBorders$x,nationVBorders$y,
        density=0, col=colLineNation, lwd=lwdNation) # outside US boundary

     if(i==1){
        text(135,31,'DC',cex=cexState,adj=.5, col=1)
        text(22,17,'AK',cex=cexState,adj=.5, col=1)
        text(47,8,'HI',cex=cexState,adj=.5, col=1)
     }

   }   #  i loop
}  


#### end of micromap functions


#RefVal============================================================


rlStateRefVal= function(j,refval){
   par(xpd=T)
   panelSelect(panels,ng,j)
   panelScale()
   lines(c(.24,.37,NA,.63,.76),rep(line4,5),lty=ltyRefVal,col=colRefVal,lwd=lwdRefVal)
   text(.50,line4+.01,'US value',cex=cexText,adj=.5)
}

# Bring out parameter==============================================
# JP - copy global variables setup in stateMicromaps.Rbase into 
# the local variables this function expects.
#
   rlStateNamesFips = stateNamesFips
   assign('lab1',lab1)
   assign('lab2',lab2)
   assign('lab3',lab3)

# Save panelDesc for function use Set

   if(!is.null(panelDesc$col1))
      assign("col1",panelDesc$col1)
   if(!is.null(panelDesc$col2))
      assign("col2",panelDesc$col2)
   if(!is.null(panelDesc$col3))
      assign("col3",panelDesc$col3)

   if(is.null(panelDesc$refval))
      assign('refVals',rep(NA,nrow(panelDesc))) else
      assign('refVals',panelDesc$refval)
      
# check to see if columns are available for
# the type of plot and values are plausible

   if(!is.null(panelDesc$boxlist)) assign('boxlist',panelDesc$boxlist)

# Get state abbreviation as polygon link

   fullNames = row.names(stateNamesFips)    # List of full state names.

   curnam = row.names(SFrame)

   stateId = switch(rowNames,
      # if "ab", use current name
      "ab"=  curnam,
      # if "fips", convert to abrv name      
      "fips"= stateNamesFips$ab[match(as.integer(curnam),
                                  stateNamesFips$fips)],
      # if "full" state name, convert abrv name
      "full"= stateNamesFips$ab[match(curnam,fullNames)],
                stop("check rownames type")
   )

# Get statenames or abbreviations to plot_______________________
   stateNames = switch(plotNames,
          "ab"=stateId,
          "full"= fullNames[match(stateId,stateNamesFips$ab)],
          stop("check plotNames type")
   )

# sort and store stateframe, stateid, and stateNames____________
   if(is.null(sortVar) || is.character(sortVar))
      ord = order(stateNames) else
      ord = order(SFrame[,sortVar])
  
   if(!ascend)ord = rev(ord)

   assign("dat",SFrame[ord,])                       # data fields  
   assign("stateId",stateId[ord])                   # StateID
   assign("stateNames",stateNames[ord])             # StateNames

# ________________Detail defaults_______________________________

assign("colors",colors)

   nam = names(details)
   for (i in 1:length(details)){
      assign(nam[i],details[[i]])
   }


   dy = details[["dy"]]              # for debugging
   cexTitle = details[["cexTitle"]]  # Used in this function


# __________________________layout

   topMar = details[["topMar"]]
   botMar = details[["botMar"]]
   legfactor=1
   if(!is.null(panelDesc$refval)){
      if(any(!is.na(panelDesc$refval))){
         botMar = details[["botMarLegend"]]
         # revisit calculation below to be more precise
         legfactor= 9/(9-details[['botMardif']])
      }      
   }
   assign('legfactor',legfactor,sys.frame(which = -1))
   ncol   = length(type)
   colSep = c(0,rep(.1,ncol-1),0)

   # build panels from panelLayout and pieces of rlStateDefaults$Details
   assign("panels",panelLayout(nrow=11,ncol=ncol,
      topMar=topMar,leftMar=0,bottomMar=botMar,
         rowSep=details[["rowSep"]],
         rowSize=details[["rowSize"]],
         colSize=colSize,
         colSep=colSep))

   grounpedRowSize = details[["groupedRowSize"]]  
   groupedRowSep   = details[["groupedRowSep"]]

   assign("panelGroup",panelLayout(nrow=3,ncol=ncol,
      topMar=topMar,leftMar=0,bottomMar=botMar,
          rowSize=groupedRowSize,
          rowSep=groupedRowSep,
          colSize=colSize,
          colSep=colSep))

   assign("panelOne",panelLayout(nrow=3,ncol=1,
      topMar=topMar,leftMar=0,bottomMar=botMar,
          rowSize=groupedRowSize,
          rowSep=groupedRowSep))

# ____________________Main loop______________________________

   for (j in 1:ncol){
      # Test type of column to be built and call build routine.
      switch(type[j],
         "map"=      rlStateMap(j),
         "mapcum"=   rlStateMapCum(j),
         "maptail"=  rlStateMapTail(j),
         "mapmedian"=rlStateMapMedian(j),
         "id"=       rlStateId(j),
         "dot"=      rlStateDot(j),
         "dotse"=    rlStateDotSe(j),
         "dotconf"=  rlStateDotConf(j),
         "arrow"=    rlStateArrow(j),
         "bar"=      rlStateBar(j),
         "boxplot"=  rlStateBoxplot(j,as.character(panelDesc$boxplot[j])),
         "nomatch"
      )
   }

   # All columns are built and sitting in the panel.
   panelSelect(panelOne,margin="top")
   panelScale()

   if(length(title)==1){
      text(.5,.77,title,cex=cexTitle)
   } else {
      text(.5,.9,title[1],cex=cexTitle)
      text(.5,.65,title[2],cex=cexTitle)
   }

}

###
#
#  stateMicromapSetDefaults function
#
###


stateMicromapSetDefaults = function()
{

# usage 
# stateMicromapDefaults = stateMicromapSetDefaults()


# Candidate colors________________________________________
colorsRefRgb = matrix(c(
 1.00,1.00,1.00,  # white
  .90, .90, .90,  # lighter gray
  .80, .80, .80,  # light gray 
  .50, .50, .50,  # middle gray
  .30, .30, .30,  # dark gray
  .00, .00, .00,  # black
  .93,1.00, .93,  # light green
  .00, .50, .00,  # mid green
 1.00,1.00, .84,  # light yellow foreground  
  .90, .80,1.00,  # bright yellow foreground 
  .80, .90,1.00,  # light green blue
  .60, .70, .85), # mid green blue
  ncol=3,byrow=T)

colorsRef = rgb(colorsRefRgb[,1],colorsRefRgb[,2],colorsRefRgb[,3])
names(colorsRef) = c("white","lighter gray","light gray",
                     "mid gray","dark gray", "black",
                      "light green","mid green",
                      "light yellow","bright yellow",
                      "light green blue","mid green blue")           

# Region colors________________________________________________
colorsRgb = matrix(c(
 1.00, .15, .15,  #region 1: red
  .90, .55, .00,  #region 2: orange
  .00, .65, .00,  #region 3: green
  .20, .50,1.00,  #region 4: greenish blue
  .50, .20, .70,  #region 5: lavendar 
  .00, .00, .00,  #region 6: black for median
 1.00,1.00, .80), #non-highlighted foreground
  ncol=3,byrow=T)

colors = rgb(colorsRgb[,1],colorsRgb[,2],colorsRgb[,3])
names(colors) =c("red","orange","green","greenish blue",
                      "purple","black","light yellow")       

## JP added temp variables so function would read in in R 2.7
tempne = 5
tempcolGrid = colorsRef["white"]
tempcolFill = colorsRef["light gray"]

details = list(

# panel layout grouping 
    ne = tempne,                # number of item per group
    ng = ceiling(51/tempne),    # number of groups of states 
    ib =  c(1, 6,11,16,21,26,27,32,37,42,47), #group lower index
    ie =  c(5,10,15,20,25,26,31,36,41,46,51), #group upper index

# panel layout margin allocation
    # JP - changed median row size to 1.5.
    topMar = .95,       # margin panel height (inches)
    botMar = .5,        # no legend bottom margin
    botMarLegend = .5,
    botMardif = .2,     # maybe not needed
    #           1 2 3 4 5   6   7 8 9 10 11
    rowSep = c(0,0,0,0,0,.1,.1,0,0,0,0,0),
    #           1 2 3 4 5 6 7 8 9 10 11
    rowSize = c(7,7,7,7,7,1.5,7,7,7,7,7),
    #                 1-5 6 7-11
    groupedRowSize = c(35,1.5,35),
    #              1-5 5-6 6-7 7-11  
    groupedRowSep = c(0,.1,.1,0),

# panel column width allocation
             ## JP changed map width to 1.4
     mapWidth=1.4,    # map width should be set portionally to the height of the panel
     idWidth=c(.9,.30),
   
# panel scaling
     sc = 1.08,       # x axis scale expansion factor
     pad = .67,       # y axis padding for integer plotting locates
                      # ry = c(1-pad,ke+pad),ke = no. items in panel
     padex = .34,     # total panel padding
                      # (.67-.5)=.17 padding at top and bottom of panel
     padMinus = .63,  # .67 - .04 # keep reference line off panel edge

# mtext line placement
      ##  JP adjusted placement of lines (titles)
      line1 = 1.75,      # top panel 1st line placement    
      line2 = 1.05,      # top panel 2nd line placement
      lineTiclab =.2,    # lowest line for map legend text 
      line3 = .65,       # bottom panel line placement
      line4 = -.7,       # reference line (below panel)

# grid line parameters
      colFill = tempcolFill,
      colGrid = tempcolGrid,
      lwdGrid = 1,
      mgpTop = c(2,.1,0),      # gridline (tick) placement
      mgpBottom = c(2,0,0),    # gridline (tick) placement
      padjBottom=-.7,          # gridline (tick  placement


# refval
   # see padMinus above 
      ltyRefVal = 2,
      lwdRefVal = 2,
      colRefVal = colorsRef["mid green"],

# panel outline
      colOutline = "black",   # panel outline

#__________________________________________________________ 

# arrow plot parameters
      lengthArrow = .08,
      lwdArrow = 2.5,              ## JP decrease arrow width.

# bar plot parameters
      barht = 2/3,    # fraction of line spacing
      colBarOutline = colorsRef["mid gray"],

# box plot parameters
      thinBox=.2,     #.29            ## JP decreased line width
      thickBox=.60,   #.58
      useBlack=F,     # for outliners
      medianLine=.88,
      colDotMedian="white",
      pchMedian=19,
      cexMedian=.95, 
      lwdMedian = 2,
      colMedian="white",
      cexOutlier = .6, # see cexDot   ## JP decreased dot size
      lwdOutlier = .4,                ## JP decreased dot line width
      colBoxOutline = colorsRef["light gray"], 

# dot plot parameters
    pch    = 16,  # plotting character
    cexDot = .9,  # dot size            ## JP adjusted dot size.
    conf   = 95,  # % confidence interval
    colDotOutline = colorsRef["black"],
    lwdDotOutline = 1,
    lwdConf = 2,
    OutlineDot = F,    ## JP added option to NOT outline DOT.

# id link panel


# map parameters

    colLineBackgr = tempcolGrid,
    colLineForegr = "black", #colBarOutline,
    colLineNation = colorsRef["black"],
    cexState  = .32, # label size for AK, HI, DC in top map.  
    lwdBackGr = 1, 
    lwdForeGr = 1, 
    lwdNation = 1,

# cex for character size
    cexText  = .7,    ## JP decreased text size.
    cexTitle = 1.0,

    cexDotId = .6,
    cexId    = .9,    ## JP decreased ID text size.
    cexConf  = .55,
    cexOut   = .6,
    cexArrow = .08,
  
# colors for drawing
    colArrow     = colorsRef["black"],
    colIdOutline = colorsRef["dark gray"],
    colMedian    = colorsRef["dark gray"],
    colRef       = "black",
    colBackgr    = tempcolFill
)

return(list(colors=colors,details=details))

}

