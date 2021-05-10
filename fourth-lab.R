# функции
library(ggplot2)
library(tidyverse)

diamonds$price

boxplot(diamonds$price ~ diamonds$cut)


f <- function(x, y, z){
  paste("Hello world", x, y, z)
}

f(x="gaga", y="dsada", z="dsaDSA")


#задача 1: Вероятността двама човека да са родени в един ден
#може да се мисла като хора, които влизат в една стая 
# -итерира се бройката на хората които влизат
# -по лесно е да е пита обратното събитие - каква е вероятността
# рд да не съвпадат за никои двама при влизащите хора да е <= 1

find_n_people <- function(p){
  prob <- 1
  # 364/365 * 363/365 ...
  # P(A) > p
  # P(neg(A)) <= 1 - P
  for (index_entering in 1:365) {
      prob <- prob * (366 - index_entering) / 365
      if(prob <= 1 - p){
        break;
      }
      index_entering
  }
  index_entering
}

find_n_people(1 / 2)


#второ решение
find_n_people2 <- function(p){
  cumprod((366 - 1:365) / 365) %>%
    detect_index(~.x <= p)
}

find_n_people2(1/2)

#exercise 2
sample(1:6, size = 100, replace = T)

#направете ф-я, която симулира н хвърляния на зар
#може да се разшири с процента паднали се шестици
#извикайте ф-ята к пъти започвайте да взимате средното на първите ж генерирани проценти за ж = 1..к
#изчертайте графика с линии на това как се движи средното

generate_dices <- function(n = 100, side = 6){
  mean(sample(1:6, size = n , replace = T) == side) #dawa ni procenta 6ci
}

map(1:100, ~generate_dices()) %>%
  unlist() %>%
  cummean() %>%
  plot(type = "l")

abline(h = 1/6, col= "red")
