#задачите за хи квадрат се ползват когато имаме някакви пропорции и хипотеза за тях

#1.Броят на починалите от коронавирус в България в последните две седмици на ноември,
#  разпределени по дни е следния
#  Една и съща ли е смъртността във всеки ден от седмицата?

#данните, които имаме
observed <- c(125, 410, 310, 300, 318, 298, 148)

#нулевата хипотеза
expected <- mean(observed)
#формулата
xsquared <- sum((observed - expected)^2 / expected)

#вероятността да е вярна хипотезата 
#степените на свобода df са бройката на данните - 1
pchisq(xsquared, lower.tail = FALSE, df = 6)

#има и друг начин
chisq.test(observed)


#2.В променливата р2000 са първите 2000 цифри на числото пи. От първите 200 цифри
# Вярно ли е всяка цифра се среща с една и съща вероятност.
library("UsingR")

#взимаме данните+
observed <- pi2000[1:200] %>% table() %>% unname()

chisq.test(observed)

#3
expected_probability <- c(0.127, 0.0956, 0.0817, 0.0751, 0.0697, 0.0675, 0.4834)
  
observed <- c(102, 108, 90, 95, 82, 40)

observed <- c(observed, 1036 - sum(observed))


xsquared <- sum((observed - 1036*expected_probability)^2 / (1036*expected_probability))

pchisq(xsquared, lower.tail = FALSE, df = length(observed) - 1)


#4
data <- c(12813, 657, 359, 42, 65963, 4000, 2642, 303)
data_matrix <- matrix(data, ncol = 4, byrow = TRUE)

chisq.test(data_matrix)

