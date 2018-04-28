# ===================================================================
#Title: roll
#Author: Hao Wang
#Date: 04-22-2018
# ====================================================================

#' @title roll a die
#' @description Creates an object of class \code{"roll"}
#' @param die object of class \code{"die"}
#' @param times number of throws
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{throws}{vector of rolls}
#' @return \item{sides}{vector of die \code{"sides"}}
#' @return \item{prob}{vector of die \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export

# function to check vector of 'times'
check_times <- function(times) {
  if (times <= 0 | !is.numeric(times)) {
    stop("\nargument 'times' must be a positive integer")
  } else {
    TRUE
  }
}


throw <- function(x, times = 1) {
  sample(x$sides, size = times, replace = TRUE, prob = x$prob)
}

make_roll <- function(die, throws) {
  res <- list(
    rolls = throws,
    side = die$sides,
    prob = die$prob,
    total = length(throws))
  class(res) <- "roll"
  res
}

roll <- function(die, times = 1) {
  check_times(times)
  throws <- throw(die, times = times)
  make_roll(die, throws)
}

print.roll <- function(x, ...) {
  cat('object "roll"\n')
  cat('\n')
  cat('$rolls \n')
  print(x$rolls)
  invisible(x)
}

# Additional Methods

#replacement method
#'@export
"[<-.roll" <- function(x, i, value) {
  if ((value %in% x$side) == FALSE) {
    stop('\nreplacing value must be one of the sides')
  }
  if (i > x$total) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] <- value
  return(x)
}

#extraction method
#'@export
"[.roll" <- function(x, i) {
  as.numeric(x$rolls[i])
}

#addition method

#' @export
"+.roll" <- function(x, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament (must be positive)")
  }
  die_incr <- die(side = x$side, prob = x$prob)
  total2 <- x$total + incr
  x$total <- total2
  more_flips <- roll(die_incr, incr)
  rolls2 <- c(x$rolls,more_flips$rolls)
  x$rolls <- rolls2
  print(x$total)
  return(x)
}
