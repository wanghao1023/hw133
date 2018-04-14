# =================================================================
#Title: hw04
#Description: regex-functions
#Author: Hao Wang
#Date: 04-13-2018
# =================================================================

library(XML)
library(stringr)
library(ggmap)
library(plotly)
library(ggplot2)

#' @title split_chars
#' @description takes a character string, and splits the content into one single characte elements
#' @param x a character string
#' @return a single vector and each element is a single character

split_chars = function(x){
  n <- nchar(x)
  v = rep(0, n)
  for (k in (1:n)){
    v[k] = str_sub(x, start = k, end = k)
  }
  return(v)
}

#' @title num_vowels
#' @description takes the output of split_chars, and return a number of vowels in a charator vector
#' @param x a vector in which each element is a single character
#' @return a number of vowels in a charator vector

num_vowels = function(x){
  vowels = c('a', 'e', 'i', 'o', 'u')
  vec = casefold(x, upper = FALSE)
  y <- table(factor(unlist(vec, use.names=FALSE), levels=vowels))
  return(y)
}

#' @title count_vowels
#' @description takes a character string, and return a number of vowels in a charator vector
#' @param x a character string
#' @return a number of vowels in a charator vector

count_vowels = function(x){
  vec <- split_chars(x)
  y <- num_vowels(vec)
  return(y)
}

#' @title reverse_chars
#' @description reverses a string by character
#' @param x a character string
#' @return a charactor vector with reversed characters

reverse_chars = function(x){
  vec <- split_chars(x)
  n <- length(vec)
  y <- rep(0, n)
    for (k in 1:n){
      y[n - k + 1] <- vec[k]
    }
  return(paste(y, collapse=''))
}

#' @title reverse_words
#' @description reverses a string by words
#' @param x a character string
#' @return a charactor vector with reversed words

reverse_words = function(x){
    vec = strsplit( x, ' ')
    vec = unlist(vec)
    y = rep(' ', length(vec))
    n <- length(vec)
    for (k in 1:n){
      y[n - k + 1] <- vec[k]
    }
    y = unlist(y)
    return(paste(y, collapse = ' '))
  }