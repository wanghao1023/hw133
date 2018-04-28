# ===================================================================
#Title: die
#Author: Hao Wang
#Date: 04-22-2018
# ====================================================================

#' @title die
#' @description takes two arguments, sides and prob, in order to return a "die" object
#' @param sides vector of six elements, by default numbers 1, 2, 3, 4, 5, 6.
#' @param prob vector of probabilities for each side (all equal to 1/6 by default)
#' @return the class of the object, and a tabular display of the sides and the associated probabilities

die = function(sides = c(1:6), prob = rep(1/6, 6)) {
  check_sides(sides)
  check_prob(prob)
  
  object <- list(
    sides = sides,
    prob = prob)
  
  class(object) <- "die"
  object
}

# auxiliary function to check vector of sides
check_sides <- function(sides) {
  if (length(sides) != 6) {
    stop("\n'prob' must be a vector of length 6")
  } 
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  TRUE
}

# auxiliary function to check vector of probabilities
check_prob <- function(prob) {
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }
  if (any(is.na(prob))) {
    stop("\n'prob' cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}

#' @export
print.die <- function(x, ...) {
  y <- data.frame(x$sides, x$prob)
  colnames(y) <- c("sides", "prob")
  cat('object "die"\n')
  cat('\n')
  print(y)
  invisible(x)
}