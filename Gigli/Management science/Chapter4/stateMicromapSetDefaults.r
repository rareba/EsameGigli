# File  stateMicromapSetDefaults function
# By    Dan Carr,converted from my old Splus functions
#       Make colors and graphics parameters accessible

# Usage 
# stateMicromapDefaults = stateMicromapSetDefaults()
#
# stateMicromap() defaults arguments include
#          colors=stateMicromapDefaults$colors,
#          details= stateMicromapDefaults$details)

# I often edit the SetDefaults function to make changes
# rather than the stateMicromap object itself.  
# A could GUI to define the layout and modify parameters would be nice.   

stateMicromapSetDefaults = function()
{

# Candidate colors________________________________________
colorsRefRgb = matrix(c(
 1.00,1.00,1.00,  # white
  .90, .90, .90,  # lighter gray
  .86, .86, .86,  # light gray 
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
    rowSep = c(0,0,0,0,0,.07,.07,0,0,0,0,0),
    #           1 2 3 4 5 6 7 8 9 10 11
    rowSize = c(7,7,7,7,7,1.5,7,7,7,7,7),
    #                 1-5 6 7-11
    groupedRowSize = c(35,1.5,35),
    #              1-5 5-6 6-7 7-11  
    groupedRowSep = c(0,.07,.07,0),

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
      line1 = 1.50,      # top panel 1st line placement    
      line2 =  .80,      # top panel 2nd line placement
      lineTiclab =.2,    # lowest line for map legend text 
      line3 = .65,       # bottom panel line placement
      line4 = -.7,       # reference line (below panel)

# grid line parameters
      colFill = tempcolFill,
      colGrid = tempcolGrid,
      lwdGrid = 1,
      mgpTop = c(2,.02,0),      # gridline (tick) placement
      mgpBottom = c(2,.07,0),    # gridline (tick) placement
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

