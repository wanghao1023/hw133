# ===================================================================
#Title: plot.roll
#Author: Hao Wang
#Date: 04-22-2018
# ====================================================================

#' @title summary
#' @description graph a barchart of frequencies (relative frequencies of 1’s, 2’s, 3’s, 4’s, 5’s, and 6’s)
#' @param roll object of class \code{"roll"}
#' @return barchart of frequencies (relative frequencies of 1’s, 2’s, 3’s, 4’s, 5’s, and 6’s)

#' @export

plot.roll <- function(x, side = 1, ...) {
  
  side = x$side
  n <- x$total
  
  count = c(length(x$rolls[x$rolls == x$side[1]]),length(x$rolls[x$rolls == x$side[2]]),
            length(x$rolls[x$rolls == x$side[3]]),length(x$rolls[x$rolls == x$side[4]]),
            length(x$rolls[x$rolls == x$side[5]]),length(x$rolls[x$rolls == x$side[6]]))
  
  proportions <- c(
    count[1]/n,
    count[2]/n,
    count[3]/n,
    count[4]/n,
    count[5]/n,
    count[6]/n
  )
  
  barplot(proportions, 
          names.arg = side, 
          xlab = "sides of die", 
          ylab = "relative frequencies",
          main = "Frequencies in a series of 50 die rolls"
          )
  
}