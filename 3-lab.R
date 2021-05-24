#задача 5 от упр2 две

install.packages("tidyverse")

library(MASS)
library(magrittr)
library(dplyr)

m <- mean(survey$Height, na.rm = T)
s <- sd(survey$Height, na.rm = T)

#първи начин
survey %>%
  filter(Height >= m - s & Height <= m + s) %>%
  nrow() 

#втори начин
sum(between(survey$Height, m - s, m + s), na.rm = T) 

#трети начин
survey %>%
  filter(between(Height, m - s, m + s)) %>%
  nrow()

#четвърти начин
cut(survey$Height, c(-Inf, m - s, m + s, +Inf)) %>%
  table()

#Aко искаме да е за мъж само
m1 <- mean(survey$Height[survey$Sex == "Male"], na.rm = T)
s1 <- sd(survey$Height[survey$Sex == "Male"], na.rm = T)

sum(between(survey$Height[survey$Sex == "Male"], m1 - 2*s1, m1 + 2*s1), na.rm = T)


#histogram and density
survey$Height %>%
  hist(probability = T)
lines(density(survey$Height, na.rm = T))


#задача 2
split.screen(figs = c(3,2))
screen(1)
boxplot(survey$Height)

screen(2)
hist(survey$Height, probability = TRUE)
lines(density(survey$Height, na.rm = T))

screen(3)
boxplot(survey$Height[survey$Sex == "Male"])

screen(4)
boxplot(survey$Height[survey$Sex == "Female"])

screen(5)
hist(survey$Height[survey$Sex == "Male"], probability = T)
lines(density(survey$Height, na.rm = T))

screen(6)
hist(survey$Height[survey$Sex == "Male"], probability = T)
lines(density(survey$Height, na.rm = T))

#задача 3: Хистограма за пулса на студентите

hist(survey$Pulse, probability = TRUE)
lines(density(survey$Pulse, na.rm = T))


