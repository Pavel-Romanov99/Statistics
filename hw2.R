install.packages("tidyverse")

#зад1.
#правим матрица 500х1000, която да съдържа 1000 наблюдения на 500 сл.в
samples <- matrix(rexp(1000, 1/3), nrow = 1, ncol = 1000)


for(i in 1:499)
{
  samples <- rbind(samples, c(rexp(1000, 1/3)))
}

#емпирични квартили
quantile(samples[1,])

#теоритични квартили
qexp(1/3, 0.25)

qexp(1/3, 0.5)

qexp(1/3, 0.75)


#б)
Y <- c()

for (i in 1:1000)
{
  Y <- c(Y, samples[1,] / (samples[1,] + samples[2,]))
}

#проверяваме дали е нормално разпределена
qqnorm(Y)
qqline(Y)
#изглежда че е нормално разпределена. Сега ще проверим
chisq.test(Y)

#p-value е 1 следователно е нормално разпределна

#в)

#правим вектор от 1000 елем, и всеки елемент е сумата от съответната колона
Z <- c()
 
for(i in 1:1000){
 Z <- c(Z, sum(samples[,i]))
}
 
#правим проверка за нормално разпределение - от нея изглежда че е
qqnorm(Z)
qqline(Z)

#проверяваме  - p.value = 0.75 > 0.05 следователно можем да твърдим, че е норм разпр.
shapiro.test(Z)


#зад2

#взимаме данните за скоростта на светлината от 4тия експреримент
data1 <- morley$Speed[morley$Expt == 4]

#гледаме дали е нормално разпределена
qqnorm(data1)
qqline(data1)

#и от графиката и от теста изглежда че е нормално разпределена
shapiro.test(data1)

t.test(data1, conf.level = 0.97)

#зад3
library("MASS")

#Нулевата хипотеза ще бъде да видим дали пушенето на родителя влияе на теглото на бебето
#Иначе ще е вярно обратното - че двете са зависими
  
#взимаме данните дали родителите са пушачи
smokers <- birthwt$smoke
#взимаме данните дали бебетата са под необходимото тегло
underweight_babies <- birthwt$low

table1 <- data.frame(smokers, underweight_babies)

barplot(table(df), names.arg = c("smokers", "non-smokers"), legend.text = T)

chisq.test(smokers, underweight_babies)
#от теста p-value < 0.05 следователно отхвърляме нулевата хипотеза и имаме, че 
#тютюнопушенето и теглото на бебето са зависими

#зад4


#a)
#взимате данните за дължината и широчината на венчелистчетата
#нулевата хипотеза ще е дължините на венчелистчетата да са 3 пъти колкото ширините им
#H1 съотв ще бъде дължините на венчелистчетата не са 3 пъти колкото ширините им

petals_length <- iris$Petal.Length

petals_width <- iris$Petal.Width

#проверяваме дали са нормално разпределени - не са
qqnorm(petals_width)
qqline(petals_width)

qqnorm(petals_length)
qqline(petals_length)

#следователно можем да ползваме wilcox.test
wilcox.test(petals_length, petals_width * 3, alternative = "two.sided")
#приемаме хипотеза 0 

#б)
versi <- iris$Sepal.Width[iris$Species == "versicolor"]
virgi <- iris$Sepal.Width[iris$Species == "virginica"]

#нулевата ни хипотеза ще бъде, че ширината на versi > тази на virgi
#Н1: ще ни е обратното

#проверяваме дали е нормално разпределена
qqnorm(versi)
qqline(versi)

qqnorm(virgi)
qqline(virgi)
#изглеждат нормално разпределени следователно ще ползваме t.test
t.test(versi, virgi, alternative = "less")
#отхвърляме нулевата хипотеза


#в)
#H0: setosa с дължина на венчелистчетата <= 1.4 има ширина на венчелистчетата
#H1: setosa с дължина на венчелистчетата <= 1.4 има ширина на венчелистчетата

setos <- iris$Petal.Width[iris$Species =="setosa" & iris$Petal.Length <= 1.4]

#не е нормално разпределението
qqnorm(setos)
qqline(setos)

wilcox.test(setos, mu = 0.26)
#oтхвърляме нулевата хипотеза следователно е варна Н1
