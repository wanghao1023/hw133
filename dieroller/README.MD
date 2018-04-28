{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf100
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 <!-- README.md is generated from README.Rmd. Please edit that file -->\
Overview\
--------\
\
`"dieroll"` is a minimal [R](http://www.r-project.org/) package that provides functions to simulate rolling a die.\
\
-   `die()` creates a die object (of class `"die"`)\
-   `roll()` rolles a die object, producing a `"roll"` object.\
-   `plot()` method for a `"roll"` object to plot frequencies of heads.\
-   `summary()` method for a `"roll"` object.\
\
Motivation\
----------\
\
This package has been developed to illustrate some of the concepts behind the creation of an R package.\
\
Installation\
------------\
\
Install the development version from GitHub via the package `"devtools"`:\
\
``` r\
# development version from GitHub:\
#install.packages("devtools") \
\
# install "dieroll" (without vignettes)\
devtools::install_github("gastonstat/dieroll")\
\
# install "dieroll" (with vignettes)\
devtools::install_github("gastonstat/dieroll", build_vignettes = TRUE)\
```\
\
Usage\
-----\
\
``` r\
library(dieroller)\
\
# default die\
die1 <- die()\
die1\
#> ##object "die"\
#> ## \
#> ## side prob \
#> ##1 "1", p = 0.166666666666667 \
#> ##2 "2", p = 0.166666666666667 \
#> ##3 "3", p = 0.166666666666667 \
#> ##4 "4", p = 0.166666666666667 \
#> ##5 "5", p = 0.166666666666667 \
#> ##6 "6", p = 0.166666666666667\
\
# 1 roll of die1\
roll(die1)\
#> ## object "roll"\
#> ##\
#> ## $rolls\
#> ## 6\
\
# 10 rolles of die1\
roll10 <- roll(die1, times = 10)\
roll10\
#> ## object "roll"\
#> ##\
#> ## $rolls\
#> ## 6 3 2 6 5 3 5 2 3 1\
\
# summary\
summary(roll10)\
#> summary "roll"\
#> \
#>   side count prop\
#> 1    1     1  0.1\
#> 2    2     2  0.2\
#> 3    3     3  0.3\
#> 4    4     0  0.0\
#> 5    5     2  0.2\
#> 6    6     2  0.2\
\
\
# 100 rolles\
roll100 <- roll(die1, times = 100)\
\
# summary\
summary(roll100)\
#> summary "roll"\
#> \
#>   side count prop\
#> 1    1    17 0.17\
#> 2    2    16 0.16\
#> 3    3    18 0.18\
#> 4    4    23 0.23\
#> 5    5    11 0.11\
#> 6    6    15 0.15\
```\
}