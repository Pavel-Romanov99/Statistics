library(ggplot2)
library(magrittr)
library(dplyr)
library(tidyverse)
install.packages('tinytex')
tinytex::install_tinytex()

#Задача 1
#а)
#брой диаманти с цена над 15 000 
diamonds
expensive <- diamonds[diamonds$price > 15000, ] %>%
  nrow()

expensive

#б)
#каква част от диамантите над 15 000 са под 2 карата
carats <- diamonds[diamonds$carat < 2 & diamonds$price > 15000, ] %>%
  nrow()

#съотношение
carats / expensive

#в)
#колко са с цена (mean - sd, mean + sd)
m <- mean(diamonds$price)
s <- sd(diamonds$price)

diamonds %>%
  filter(between(price, m - s, m + s)) %>%
  nrow()

#г)
#диамантите с идеална шлифовка
ideal_carats <- diamonds$carat[diamonds$cut == "Ideal"]

#средно
mean(ideal_carats)

#медиана
median(ideal_carats)

#квартили
quantile(ideal_carats)

#д)
#такава цена, че 80 процента от диамантите да са под нея
quantile(diamonds$price, 0.8)

#е)
#сортиране по x, y, z
sorted_diamonds <- diamonds[order(diamonds$x, diamonds$y, diamonds$z), decreasing = T,]

head(sorted_diamonds, 5)

#Задача 2

# а)
#хистограма за цената на диамантите и плътността

hist(diamonds$price, probability = T)
lines(density(diamonds$price, na.rm = T))

#б)
plot(diamonds$clarity , diamonds$cut)
#заключение: колкото е по-добре шлифован един диамант, толкова е по-чист той

#в) 
#от графиката се вижда, че колкото по-голям е карата на диаманта, толкова е 
# по-скъп той
plot(diamonds$price , diamonds$carat)


#г)
under_one <- diamonds[diamonds$carat > 1, ]

split.screen(figs = c(2,2))

#от графиката виждаме, че колкото по-добре шлифован е един диамант,
#толкова е по-скъп
screen(1)
boxplot(under_one$price ~ under_one$cut)

#колкото по-чист/прозрачен е един диамант, толково е по-скъп
screen(2)
boxplot(under_one$price ~ under_one$clarity)

#няма голяма връзка между цвета на един диамант и неговата цена
screen(3)
boxplot(under_one$price ~ under_one$color)

#Най-голямо въздействие върху цената на диаманта има неговата чистота/прозрачност

#задача 3

balls <- function(){

  num_white = 2
  num_black = 2
  
  result = 0

  
  for (i in 1:20) {
      
      total = num_white + num_black
      
      white_percentage = num_white/total
      black_percentage = num_black/total
      
      x <- sample(c("black", "white"), 1, replace = T, prob = c(black_percentage, white_percentage))
      
      if(x == c("white")){
        num_white = num_white + 2
        result = result + 1
      }
      else {
        num_black = num_black + 1
      }
  }
  result

}

balls()


fifteen = function(n){
  result = 0
  
  for (i in 1:n) {
    if(balls() == 15){
      result = result + 1
      print("fifteen")
    }
  }
  result
}

under_ten = function(n){
  result = 0
  
  for (i in 1:n) {
    if(balls() < 10){
      result = result + 1
      print("ten")
    }
  }
  result
}

under_ten(1000)/ 1000

fifteen(1000) / 1000

replicated <- replicate(1000, balls())

median(replicated)

quantile(replicated)

floor(mean(replicated))
  
balls2 <- function(){
  
  num_white = 2
  num_black = 4
  
  result = 0
  
  for (i in 1:3) {
    
    total = num_white + num_black
    
    white_percentage = num_white/total
    black_percentage = num_black/total
    
    x <- sample(c("black", "white"), 1, replace = T, prob = c(black_percentage, white_percentage))
    
    if(x == c("white")){
      num_white = num_white + 2
      result = result + 1
    }
    else {
      num_black = num_black + 1
    }
  }
  
  if(x == "white"){
    1
  }
  else 0
}

sum(replicate(1000, balls2())) / 1000
