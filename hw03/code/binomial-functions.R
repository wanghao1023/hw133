# ===================================================================
# Title: binomial-functions
# Author: Hao Wang
# Date: 3-20-2018
# ===================================================================

#' @title Fuction is_integer
#' @description test if a numeric value can be considered to be an integer number
#' @param x number (numeric)
#' @return TRUE if it is an interger or FALSE otherwise

is_integer = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else {
    if (x%%1==0){return(TRUE)}
    else {return(FALSE)}
  }
}

#' @title Fuction is_positive
#' @description test if a numeric value is positive
#' @param x number (numeric)
#' @return TRUE if it's positive or FALSE otherwise

is_positive = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else {
    if (x>0){return(TRUE)}
    else {return(FALSE)}
  }
}

#' @title Fuction is_nonnegative
#' @description test if a numeric value if nonnegative
#' @param x number (numeric)
#' @return TRUE if it's nonnegative or FALSE otherwise

is_nonnegative = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else {
    if (x>=0){return(TRUE)}
    else {return(FALSE)}
  }
}

#' @title Fuction is_positive_integer
#' @description test if a numeric value is a positive integer
#' @param x number (numeric)
#' @return TRUE if it's positive integer or FALSE otherwise

is_positive_integer = function(x){
  if (is_integer(x) == FALSE) {return(FALSE)}
  else {
    if (x>0){return(TRUE)}
    else {return(FALSE)}
  }
}

#' @title Fuction is_nonneg_integer
#' @description test if a numeric value is a nonnegative integer
#' @param x number (numeric)
#' @return TRUE if it's nonnegative integer or FALSE otherwise

is_nonneg_integer = function(x){
  if (is_integer(x) == FALSE) {return(FALSE)}
  else {
    if (x>=0){return(TRUE)}
    else {return(FALSE)}
  }
}

#' @title Fuction is_probability
#' @description test if a numeric value if a given number p is a valid probability value
#' @param x number (numeric)
#' @return TRUE if the input is valid probability or FALSE otherwise

is_probability = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else { if ((0<=x) & (x<=1)){return(TRUE)}
    else {return(FALSE)}
  }
}

#' @title Fuction bin_factorial
#' @description calculates the factorial of a nonnegative integer n
#' @param x number (numeric)
#' @return calculated factorial of a nonnegative integer n

bin_factorial = function(x){
  m=1
  t=1
  while (m<=x){
    t=t*m
    m=m+1
  }
  return(t)
}

#' @title Fuction bin_combination
#' @description calculates the the number of combinations in which k successes can occur in n trials
#' @param n number of trials (numeric)
#' @param k number of successes (numeric)
#' @return the binomial combination factor

bin_combination = function(n, k){
  a=bin_factorial(n)
  b=bin_factorial(k)
  c=bin_factorial(n-k)
  return(a/b/c)
}

#' @title Fuction bin_probability
#' @description calculates the binomial probability for give values of trial, success, and probability
#' @param trials number of trials (numeric)
#' @param successk number of successes (numeric)
#' @param prob given probability of success (numeric)
#' @return the probability for given variables

bin_probability= function(trials, success, prob){
  if (is_nonneg_integer(trials) == FALSE) stop('need to be correct number of trials')
  if (is_nonneg_integer(success) == FALSE) stop('need to be correct number of success')
  if (is_probability(prob) == FALSE) stop('need to be correct probability')
  chance = prob ^ success * (1-prob) ^(trials-success)
  return (chance * bin_combination(trials, success))
}

#' @title Fuction bin_distribution
#' @description calculates the distribution for given trials and probability
#' @param trials number of trials (numeric)
#' @param prob given probability of success (numeric)
#' @return the distribution for given values of trials and probability

bin_distribution = function(trials, prob){
  success_times = c(0:trials)
  probability = vector(mode = 'numeric', length = trials + 1)
  for (chance in 0:trials){
    probability[chance+1] = bin_probability(trials, chance, prob)}
  df = data.frame(success_times, probability)
  return(df)
}