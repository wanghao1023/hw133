# ===================================================================
# Title: make-shot-charts-script.R
# Description: Code for hw06
# Input(s): data file 'andre-iguodala.csv', 'draymond-green.csv', 'kevin-durant.csv', 'klay-thompson.csv', 'stephen-curry.csv'
# Output(s): .txt, .csv
# Author: Hao Wang
# Date: 3-5-2018
# ===================================================================
library(ggplot2)
library(jpeg)
library(grid)
library(dplyr)

klay_scatterplot <- ggplot(data = klay_thompson) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))

curry_scatterplot <- ggplot(data = stephen_curry) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))

green_scatterplot <- ggplot(data = draymond_green) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))

durant_scatterplot <- ggplot(data = kevin_durant) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))

andre_scatterplot <- ggplot(data = andre_iguodala) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(readJPEG(court_file), 
                          width = unit(1, "npc"), 
                          height = unit(1, "npc")
                          )

klay_shot_chart <- ggplot(data = klay_thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()

curry_scatterplot <- ggplot(data = stephen_curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

green_scatterplot <- ggplot(data = draymond_green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()

durant_scatterplot <- ggplot(data = kevin_durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()

andre_scatterplot <- ggplot(data = andre_iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

pdf(file = "../images/andre-iguodala-shot-chart.pdf",
    width = 6.5,
    height  = 5
)
andre_scatterplot
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf",
    width = 6.5,
    height  = 5
)
green_scatterplot
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf",
    width = 6.5,
    height  = 5
)
durant_scatterplot
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf",
    width = 6.5,
    height  = 5
)
klay_scatterplot
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf",
    width = 6.5,
    height  = 5
)
curry_scatterplot
dev.off()


pdf(file = "../images/gsw-shot-charts.pdf",
    width = 8,
    height  = 7
)
ggplot(data = dat) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') + 
  theme_minimal() +
  facet_wrap(~ name)
dev.off()

