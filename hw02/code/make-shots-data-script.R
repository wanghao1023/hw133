# ===================================================================
# Title: make-shots-data-script
# Description: make-shots-data-script
# Input(s): data file 'andre-iguodala.csv', 'draymond-green.csv', 'kevin-durant.csv', 'klay-thompson.csv', 'stephen-curry.csv'
# Output(s): .txt, .csv
# Author: Hao Wang
# Date: 3-5-2018
# ===================================================================

library("dplyr")
library("ggplot2")

download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-spring-2018/master/data/andre-iguodala.csv", destfile =  "andre-iguodala.csv")
andre_iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)

download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-spring-2018/master/data/draymond-green.csv", destfile =  "draymond-green.csv")
draymond_green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)

download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-spring-2018/master/data/kevin-durant.csv", destfile =  "kevin-durant.csv")
kevin_durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)

download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-spring-2018/master/data/klay-thompson.csv", destfile =  "klay-thompson.csv")
klay_thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)

download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-spring-2018/master/data/stephen-curry.csv", destfile =  "stephen-curry.csv")
stephen_curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

andre_iguodala <- mutate(andre_iguodala, name = "Andre Iguodala")
draymond_green <- mutate(draymond_green, name = "Draymond Green")
kevin_durant <- mutate(kevin_durant, name = "Kevin Durant")
klay_thompson <- mutate(klay_thompson, name = "Klay Thompson")
stephen_curry <- mutate(stephen_curry, name = "Stephen Curry")

ç

draymond_green$shot_made_flag [which(draymond_green$shot_made_flag == "y")] <- "made shot"
draymond_green$shot_made_flag [which(draymond_green$shot_made_flag == "n")] <- "missed shot"

kevin_durant$shot_made_flag [which(kevin_durant$shot_made_flag == "y")] <- "made shot"
kevin_durant$shot_made_flag [which(kevin_durant$shot_made_flag == "n")] <- "missed shot"

klay_thompson$shot_made_flag [which(klay_thompson$shot_made_flag == "y")] <- "made shot"
klay_thompson$shot_made_flag [which(klay_thompson$shot_made_flag == "n")] <- "missed shot"

stephen_curry$shot_made_flag [which(stephen_curry$shot_made_flag == "y")] <- "made shot"
stephen_curry$shot_made_flag [which(stephen_curry$shot_made_flag == "n")] <- "missed shot"

andre_iguodala <- mutate(andre_iguodala, minute = 12 * period - minutes_remaining)
draymond_green <- mutate(draymond_green, minute = 12 * period - minutes_remaining)
kevin_durant <- mutate(kevin_durant, minute = 12 * period - minutes_remaining)
klay_thompson <- mutate(klay_thompson, minute = 12 * period - minutes_remaining)
stephen_curry <- mutate(stephen_curry, minute = 12 * period - minutes_remaining)

sink(file = '../output/andre-iguodala-summary.txt')
summary(andre_iguodala)
sink()

sink(file = '../output/draymond_green-summary.txt')
summary(draymond_green)
sink()

sink(file = '../output/kevin_durant-summary.txt')
summary(kevin_durant)
sink()

sink(file = '../output/klay_thompson-summary.txt')
summary(klay_thompson)
sink()

sink(file = '../output/stephen_curry-summary.txt')
summary(stephen_curry)
sink()

dat <- rbind(andre_iguodala, draymond_green, kevin_durant, klay_thompson, stephen_curry)

write.csv(dat, file = "shots-data.csv")

sink(file = '../output/shots-data-summary.txt')
summary(dat)
sink()

