install.packages("UsingR")
library("UsingR")
library(magrittr)

#factor се използва за категоризиране на данните, т.е да отдели 
#уникалните данни така, че да можем да ги ползваме
#връща данните на нива
gender_vector <- c("male", "female", "female", "male", "male")

#convert gender_factor to a factor
factor_gender_vector <- factor(gender_vector)

levels(factor_gender_vector) <- levels(factor_gender_vector)[c(2, 1)]

#table показва колко пъти се среща всеки един елемент
table(gender_vector)

#така можем да намерим честотата на срещане на всеки от елементите
table(gender_vector) / length(gender_vector)
#същото прави и 
prop.table(table(factor_gender_vector))

#можем да намерим броя комбинации на всеки два елемента:
table(c(1,1,3,4,5), c("pavel", "miro", "mitak", "blago", "lbj"))

#полезна ф-я е и pie, която ни показва pie chart за честотата например
factor_gender_vector%>%
  table() %>%
  prop.table() %>%
  pie()

#същото, но с колонки
factor_gender_vector %>%
  table() %>%
  prop.table() %>%
  barplot()

#exercise 2
install.packages("MASS")
library("MASS")

#да се окаже редовен пушач

survey$Smoke %>%
  table() %>%
  prop.table()


#да се окаже редовно пушещ мъж

table(survey$Smoke, survey$Sex)  %>%
  prop.table

#случаен мъж да се окаже редовен пушач
#сумата от вероятността да е мъж да се раздели на вероятността да е мъж редовен пушач
#случайно избран редовен пушач да се окаже мъж
prop.table(table(survey$Sex, survey$Smoke), 2)


#exercise 3
#представете графично данните за пушенето на студентите и в зависимост от пола
survey$Smoke %>%
  table() %>%
  pie()

prop.table(table(survey$Sex, survey$Smoke), 1) %>%
  barplot(beside = TRUE, legend = TRUE)

#exercise 4

#правим нова група и разделяме според възрастите
survey$Group <- ifelse(survey$Age <= 20, "Under 20", ifelse(survey$Age <= 25, "21-25", "25+"))

survey$Group

#правим таблицата според възрастите
table(survey$Group, survey$Smoke) %>%
  prop.table() %>%
  barplot(legend = TRUE, beside = TRUE)