# ===================================================================
# Title: binomial-functions
# Author: Hao Wang
# Date: 3-20-2018
# ===================================================================

is_integer = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else {
    if (x%%1==0){return(TRUE)}
    else {return(FALSE)}
  }
}
is_positive = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else {
    if (x>0){return(TRUE)}
    else {return(FALSE)}
  }
}

is_nonnegative = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else {
    if (x>=0){return(TRUE)}
    else {return(FALSE)}
  }
}

is_positive_integer = function(x){
  if (is_integer(x) == FALSE) {return(FALSE)}
  else {
    if (x>0){return(TRUE)}
    else {return(FALSE)}
  }
}

is_nonneg_integer = function(x){
  if (is_integer(x) == FALSE) {return(FALSE)}
  else {
    if (x>=0){return(TRUE)}
    else {return(FALSE)}
  }
}

is_probability = function(x){
  if (is.numeric(x) == FALSE) {return(FALSE)}
  else { if ((0<=x) & (x<=1)){return(TRUE)}
    else {return(FALSE)}
  }
}

bin_factorial = function(x){
  m=1
  t=1
  while (m<=x){
    t=t*m
    m=m+1
  }
  return(t)
}

bin_combination = function(n, k){
  a=bin_factorial(n)
  b=bin_factorial(k)
  c=bin_factorial(n-k)
  return(a/b/c)
}

bin_probability= function(trials, success, prob){
  if (is_nonneg_integer(trials) == FALSE) stop('need to be correct number of trials')
  if (is_nonneg_integer(success) == FALSE) stop('need to be correct number of success')
  if (is_probability(prob) == FALSE) stop('need to be correct probability')
  chance = prob ^ success * (1-prob) ^(trials-success)
  return (chance * bin_combination(trials, success))
}

bin_distribution = function(trials, prob){
  success_times = c(0:trials)
  probability = vector(mode = 'numeric', length = trials + 1)
  for (chance in 0:trials){
    probability[chance+1] = bin_probability(trials, chance, prob)}
  df = data.frame(success_times, probability)
  return(df)
}