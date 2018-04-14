# =================================================================
#Title: hw04
#Description: archive-functions
#Author: Hao Wang
#Date: 04-12-2018
# =================================================================

library(XML)
library(dplyr)
library(stringr)

#' @title read_archive
#' @description takes name of package, and returns the data frame from reading the HTML table with the archive data
#' @param x name of package
#' @return tbl_html the data frame from reading the HTML table with the archive data

read_archive <- function(name){
  tbl_html <- readHTMLTable(paste0("http://cran.r-project.org/src/contrib/Archive/",name))
  tbl <- tbl_html[[1]]
}

#' @title version_name
#' @description takes the output of read_archive, and returns a clean version of the name column
#' @param x the output of read_archive 
#' @return a clean version of the name column

version_names <-function(x){
  name <- gsub("\\_.*","",x)
  return(name) 
}

#' @title version_number
#' @description takes the output of read_archive, and returns a clean version of the version column
#' @param x the output of read_archive 
#' @return a clean version column

version_numbers <- function(x){
  version <- gsub(".*_","",x)
  version <- str_replace(version, pattern = '.tar.gz', replacement = '')
  return(version)
}

#' @title version_date
#' @description takes the output of read_archive, and returns a clean version of the date column
#' @param x the output of read_archive 
#' @return a clean date column

version_dates <- function(x){
  date <- str_sub(x, start = 1, end = 10)
  return(date) 
}

#' @title version_size
#' @description takes the output of read_archive, and returns a clean version of the size column
#' @param x the output of read_archive 
#' @return a clean size column

version_sizes <- function(size_raw){
  for(i in 1:length(size_raw)){
    if(str_detect(size_raw[i],pattern = "K") == TRUE){
      size_raw[i] <- str_replace_all(size_raw[i],pattern = "K",replacement = '')
    }else{
      size_raw[i] <- as.numeric(str_replace_all(size_raw[i],pattern = "M",replacement = ""))*1000
    }
  }
  return(size_raw)
}

#' @title clean_archive
#' @description  takes the output of read_archive, and returns a "tidy" table with column names
#' @param x the output of read_archive 
#' @return a "tidy" table (e.g. data.frame or tibble) with column names (e.g. name, version, data, size)

clean_archive <- function(raw){
  raw <- raw[complete.cases(raw),]
  raw <- filter(select(raw,2:4),Name!="Parent Directory")
  name <- version_names(as.vector(raw$Name))
  version <- version_numbers(as.vector(raw$Name))
  date <- version_dates(as.vector(raw$`Last modified`))
  size <- as.numeric(version_sizes(as.vector(raw$Size)))
  cleaned <- data.frame(name,version,date,size,stringsAsFactors = FALSE)
  return(cleaned)
}

#' @title time_in_yr
#' @description  takes the output of clean_archive, add one column of date in terms of years to the input
#' @param x the output of clean_archive 
#' @return a new data with one column of date in terms of years

time_in_yr = function(x){
  date <- x$date
  year <- str_sub(date, start = 1, end = 4)
  month <- str_sub(date, start = 6, end = 7)
  day <- str_sub(date, start = 9, end = 10)
  month_in_yr <- as.numeric(month)
  month_in_yr <- ( month_in_yr - 1 ) / 12
  month_in_yr
  day_in_yr <- as.numeric(day)
  day_in_yr <- day_in_yr / 365
  day_in_yr
  year <- as.numeric(year)
  time <- year + month_in_yr + day_in_yr
  x$time <- time
  return(x)
}

#' @title plot_archive
#' @description  takes the output of clean_archive, and returns a timeline of size for different versions
#' @param x the output of clean_archive 
#' @return a timeline of size for different versions

plot_archive = function(x){
  date <- x$date
  year <- str_sub(date, start = 1, end = 4)
  month <- str_sub(date, start = 6, end = 7)
  day <- str_sub(date, start = 9, end = 10)
  month_in_yr <- as.numeric(month)
  month_in_yr <- ( month_in_yr - 1 ) / 12
  month_in_yr
  day_in_yr <- as.numeric(day)
  day_in_yr <- day_in_yr / 365
  day_in_yr
  year <- as.numeric(year)
  time <- year + month_in_yr + day_in_yr
  x$time <- time
  return(ggplot(data = x, aes(x = time, y = size)) + xlab('date') + ylab('size(Kilobytes)') + geom_step() + geom_point())
}