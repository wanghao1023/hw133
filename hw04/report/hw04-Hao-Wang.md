hw04-Hao-Wang
================

``` r
library(XML)
```

    ## Warning: package 'XML' was built under R version 3.4.3

``` r
library(stringr)
library(ggmap)
```

    ## Loading required package: ggplot2

``` r
library(plotly)
```

    ## 
    ## Attaching package: 'plotly'

    ## The following object is masked from 'package:ggmap':
    ## 
    ##     wind

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     last_plot

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    ## The following object is masked from 'package:graphics':
    ## 
    ##     layout

``` r
library(ggplot2)
```

``` r
source("../code/archive-functions.R")
```

    ## Warning: package 'dplyr' was built under R version 3.4.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
source("../code/regex-functions.R")
```

> 1.1 Read Archive Data Table

``` r
raw_data <- read_archive('stringr')
raw_data
```

    ##                      Name    Last modified Size Description
    ## 1                    <NA>             <NA> <NA>        <NA>
    ## 2        Parent Directory                     -            
    ## 3   stringr_0.1.10.tar.gz 2009-11-09 16:57 6.8K            
    ## 4      stringr_0.2.tar.gz 2009-11-16 20:25  10K            
    ## 5      stringr_0.3.tar.gz 2010-02-15 18:06  11K            
    ## 6      stringr_0.4.tar.gz 2010-08-24 16:33  16K            
    ## 7      stringr_0.5.tar.gz 2011-06-30 19:12  18K            
    ## 8    stringr_0.6.1.tar.gz 2012-07-25 21:59  20K            
    ## 9    stringr_0.6.2.tar.gz 2012-12-06 08:40  20K            
    ## 10     stringr_0.6.tar.gz 2011-12-08 20:02  20K            
    ## 11   stringr_1.0.0.tar.gz 2015-04-30 11:48  34K            
    ## 12   stringr_1.1.0.tar.gz 2016-08-19 21:02  62K            
    ## 13   stringr_1.2.0.tar.gz 2017-02-18 21:23  92K            
    ## 14                   <NA>             <NA> <NA>        <NA>

> 1.2 Data Cleaning

``` r
clean_data <- clean_archive(raw_data)
clean_data
```

    ##       name version       date size
    ## 1  stringr  0.1.10 2009-11-09  6.8
    ## 2  stringr     0.2 2009-11-16 10.0
    ## 3  stringr     0.3 2010-02-15 11.0
    ## 4  stringr     0.4 2010-08-24 16.0
    ## 5  stringr     0.5 2011-06-30 18.0
    ## 6  stringr   0.6.1 2012-07-25 20.0
    ## 7  stringr   0.6.2 2012-12-06 20.0
    ## 8  stringr     0.6 2011-12-08 20.0
    ## 9  stringr   1.0.0 2015-04-30 34.0
    ## 10 stringr   1.1.0 2016-08-19 62.0
    ## 11 stringr   1.2.0 2017-02-18 92.0

``` r
write.csv(clean_data,'../data/stringr_archive.csv')
```

> 1.3 Timeline Slot

``` r
plot_archive(clean_data)
```

![](../imagesunnamed-chunk-5-1.png)

> 1.4

``` r
raw_data <- read_archive('stringr')
clean_data <- clean_archive(raw_data)
plot_archive(clean_data)
```

![](../imagesunnamed-chunk-6-1.png)

> 1.5 Archives of 'dplyr', 'ggplot2', 'XML', and 'knitr'

``` r
stringr_raw <- read_archive('stringr')
stringr_clean <- clean_archive(stringr_raw)
write.csv(stringr_clean, '../data/stringr_archive.csv')
```

``` r
dplyr_raw <- read_archive('dplyr')
dplyr_clean <- clean_archive(dplyr_raw)
write.csv(dplyr_clean, '../data/dplyr_archive.csv')
```

``` r
ggplot2_raw <- read_archive('ggplot2')
ggplot2_clean <- clean_archive(ggplot2_raw)
write.csv(ggplot2_clean, '../data/ggplot2_archive.csv')
```

``` r
XML_raw <- read_archive('XML')
XML_clean <- clean_archive(XML_raw)
write.csv(XML_clean, '../data/XML_archive.csv')
```

``` r
knitr_raw <- read_archive('knitr')
knitr_clean <- clean_archive(knitr_raw)
write.csv(knitr_clean, '../data/knitr_archive.csv')
```

``` r
dplyr_dat <- time_in_yr(dplyr_clean)
ggplot2_dat <- time_in_yr(ggplot2_clean)
XML_dat <- time_in_yr(XML_clean)
knitr_dat <- time_in_yr(knitr_clean)
```

``` r
ggplot() + geom_step(data=dplyr_dat, aes(x=time, y=size, colour='pink')) + geom_point() + geom_step(data=ggplot2_dat, aes(x=time, y=size), colour='green') + geom_point() + geom_step(data=XML_dat, aes(x=time, y=size), colour='purple') + geom_point() + geom_step(data=knitr_dat, aes(x=time, y=size), colour='blue') + geom_point() + xlab('date') + ylab('size(Kilobytes)')
```

![](../imagesunnamed-chunk-13-1.png)

``` r
dat <- dplyr_dat %>%
  merge(ggplot2_dat,all=TRUE) %>%
  merge(XML_dat,all=TRUE) %>%
  merge(knitr_dat,all=TRUE)

ggplot(data = dat, aes(x = time, y = size, color = name)) + geom_step() + facet_wrap(~name, scales = 'free') 
```

![](../imagesunnamed-chunk-14-1.png)

> 2.1 Splitting Characters

``` r
split_chars('Go Bear!')
```

    ## [1] "G" "o" " " "B" "e" "a" "r" "!"

``` r
split_chars('Expecto Patronum')
```

    ##  [1] "E" "x" "p" "e" "c" "t" "o" " " "P" "a" "t" "r" "o" "n" "u" "m"

> 2.2 Number of Vowels

``` r
vec <- split_chars('Go Bear!')
num_vowels(vec)
```

    ## 
    ## a e i o u 
    ## 1 1 0 1 0

> 2.3 Counting Vowels

``` r
count_vowels('The quick brown fox jumps over the lazy dog')
```

    ## 
    ## a e i o u 
    ## 1 3 1 4 2

``` r
count_vowels('THE QUICK BROWN FOR JUMPS OVER THE LAZY DOG')
```

    ## 
    ## a e i o u 
    ## 1 3 1 4 2

> 2.4 Reversing Characters

``` r
reverse_chars('gattaca')
```

    ## [1] "acattag"

``` r
reverse_chars('Lumox Maxima')
```

    ## [1] "amixaM xomuL"

> 2.5 Reversing Sentence by Words

``` r
reverse_words('sentence! this reverse')
```

    ## [1] "reverse this sentence!"

``` r
reverse_words('string')
```

    ## [1] "string"

> 3.1 Numebr of characters per tweet

``` r
dat <- read.csv('../data/text-emotion.csv')
```

``` r
n <- 40000
length = rep(0, n)

for (k in 1:n){
  length[k]=nchar(as.character(dat[[4]][k]))
}

summary(length)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   43.00   69.00   73.41  103.00  167.00

``` r
hist(length, breaks = 50)
```

![](../imagesunnamed-chunk-22-1.png)

> 3.2 Number of mentions

``` r
v = rep(' ', n)
l = rep(' ', n)
m = rep(0, n)

# extract the tweet content
for(k in 1:n){
  v[k]=as.character(dat[[4]][k])
}

# separate the content by words
for(k in 1:n){
  l[k] = strsplit(v[k], ' ')
}

# count the number of mentions
for(k in 1:n){
  v=unlist(l[k])
    for (i in 1:length(v)){
    h = str_sub(v[i], 1, 1)
      if (h[1] == '@'){
        m[k] = m[k]+1
         }
    }
}
```

``` r
table(m)
```

    ## m
    ##     0     1     2     3     4     5     6     7     8     9    10 
    ## 20887 18249   709    96    34    15     5     1     2     1     1

``` r
summary(m)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   0.000   0.000   0.506   1.000  10.000

``` r
hist(m)
```

![](../imagesunnamed-chunk-26-1.png)

``` r
dat$mention_count <- m
dat$content[dat$mention_count == '10']
```

    ## [1] last #ff  @Mel_Diesel @vja4041 @DemonFactory @shawnmcguirt @SEO_Web_Design @ChuckSwanson @agracing @confidentgolf @tluckow @legalblonde31
    ## 39827 Levels: - arrggh kids that won't settle....need some Kava for Liam, that'll sort 'em... ...

> 3.3 Hashtags

``` r
# Count the number of hashtags in the tweet contents
d=rep(0,40000)
for(k in 1:40000){
  v1=unlist(l[k])
  for (f1 in 1:length(v1)){
    h1 = str_sub(v1[f1], 1, 1)
    if (h1[1] == '#'){
      d[k] = d[k]+1
    }
  }
}
```

``` r
# summaries
summary(d)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ## 0.00000 0.00000 0.00000 0.02368 0.00000 9.00000

``` r
# frequencies
table(d)
```

    ## d
    ##     0     1     2     3     4     5     7     8     9 
    ## 39203   701    72    17     1     1     1     1     3

``` r
# barplot of counts
hist(d)
```

![](../imagesunnamed-chunk-31-1.png)

``` r
# Count the number of hashtags in the tweet contents.
hashtags <- function(x){
  return(str_count(x, pattern = "#[A-z_][\\w]+" ))
}
```

``` r
sum(hashtags(dat$content))
```

    ## [1] 879

``` r
table(hashtags(dat$content))
```

    ## 
    ##     0     1     2     3     5     7     8     9 
    ## 39262   649    66    17     1     1     1     3

``` r
c <- str_extract(dat$content,pattern = "#[A-z][\\w]+")
c <- c[!is.na(c)]
```

``` r
# the average length
mean(nchar(c)-1) 
```

    ## [1] 7.775068

``` r
# the most common length
hash_mode <- table(nchar(c)-1)
names(hash_mode)[which(hash_mode==max(hash_mode))]
```

    ## [1] "4"
