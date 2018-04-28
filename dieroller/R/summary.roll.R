# ===================================================================
#Title: summary.roll
#Author: Hao Wang
#Date: 04-22-2018
# ====================================================================

#' @title summary
#' @description for "roll" objects that returns an object "summary.roll" object
#' @param roll object of class \code{"roll"}
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{side}{the sides of the rolled die}
#' @return \item{count}{the frequency (count) of each side of the rolled die}
#' @return \item{prop}{the relative frequency (proportion) of each side of the rolled die}
#' @export



summary.roll <- function(x, ...) {
  
  side = x$side
  
  count = c(length(x$rolls[x$rolls == x$side[1]]),length(x$rolls[x$rolls == x$side[2]]),
            length(x$rolls[x$rolls == x$side[3]]),length(x$rolls[x$rolls == x$side[4]]),
            length(x$rolls[x$rolls == x$side[5]]),length(x$rolls[x$rolls == x$side[6]]))
  
  n <- x$total
  
  proportions <- c(
    count[1]/n,
    count[2]/n,
    count[3]/n,
    count[4]/n,
    count[5]/n,
    count[6]/n
  )
  
  freq = data.frame(side, count, prop=proportions)
  obj <- list(freq=freq)
  
  class(obj) <- "summary.roll"
  
  obj
}

print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(x$freq)
  invisible(x)
}