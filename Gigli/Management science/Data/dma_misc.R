# dma_misc.R

## Direct Marketing Analytics, Misc. functions

## RFM Exploratory plot 

rfm.plot <- function(x, type = c("Recency", "Frequency", "Monetary"), 
                     ylab = "# Customers", pct.include = 99, ...) {
  type1 <- toupper(substr(type, 1, 1))
  c.type <- switch(type1,
                   R = "Recency",
                   F = "Frequency",
                   M = "Monetary",
                   B = "Breadth",
                   "***")
  xlab <- switch(type1,
                 R = "Weeks Since Last Purchase",  ## need to generalize this
                 F = "Number of Orders",
                 M = "Total $'s Purchased",
                 B = "Number of Unique SKU's Purchased",
                 "***")
  bar.color = "yellow"
  xlim <- c(0, min(which(cumsum(table(x))/length(x) > pct.include/100.0)))
  xlim <- switch(type1,
                 R = xlim,
                 F = rev(xlim),
                 M = rev(xlim),
                 B = rev(xlim))
  xplot <- x[x <= max(xlim)]           

## plot histogram limited to pct.include range
op <- par(mar = c(5, 4, 4, 4) + 0.1)
  hp <- hist(xplot, right = FALSE, col = bar.color,
             xlim = xlim, 
             main = c.type, xlab = xlab, ylab = ylab)
  cumx0 <- table(x)
  cumx <- cumx0[which(as.integer(names(cumx0)) <= max(hp$breaks))]
  cumx[length(cumx)] <- cumx[length(cumx)] + 
                        sum(cumx0[which(as.integer(names(cumx0)) > max(hp$breaks))])
##  cumx <- cumsum(rev(cumx))
  cumx <- switch(type1,
                 R = cumsum(cumx),
                 F = cumsum(rev(cumx)),
                 M = cumsum(rev(cumx)),
                 B = cumsum(rev(cumx)))
  lines(as.integer(names(cumx)), max(hp$counts) * (cumx / max(cumx)),
        col = "darkblue")
  axis(side = 4, at = seq(0, max(hp$counts), length.out = 11), 
       labels = seq(0, 100, by = 10))
  mtext("Cumulative % Customers", side = 4, line = 3)
par(op)

}

## RFM/B Segment Builder
#seg_breaks <- data.frame(SegType = rep(c("Recency", "Frequency", "Monetary", "Bredth"), each = 5), Upper_Limit = NA, Break_Label = "")
#object.browser()
