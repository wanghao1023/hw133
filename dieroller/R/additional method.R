# ===================================================================
#Title: Additional Methods
#Author: Hao Wang
#Date: 04-22-2018
# ====================================================================

#' @title Additional Methods
#' @description Additional Methods
#' @param die object of class \code{"die"}
#' @param times number of throws
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{throws}{vector of rolls}
#' @return \item{sides}{vector of die \code{"sides"}}
#' @return \item{prob}{vector of die \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export



# an extraction method "[" to extract the value of a given roll
"[.roll" <- function(x, i) {
  x$rolls[i]
}

# a replacement method "[<-" to replace the value of a given roll
"[<-.roll" <- function(x, i, value) {
  x$rolls[i] <- value
  make_roll(x$die, x$rolls)
}

# an addition "+" method to add more rolls
"+.roll" <- function(x, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament")
  }
  more_rolls <- toss(x$die, times = incr)
  make_roll(x$die, c(x$rolls, more_rolls))
}

