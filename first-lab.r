x <- 12

vector1 <- c(1, 2, 3, 4)
vector2 <- c(1, 2, 3, 4)

vector1 + vector2

mask <- vector1 > 2
mask

vector1[mask]

#matrices
my_m <- matrix(data = c(1:9), nrow = 3, ncol = 3, byrow=TRUE)

my_m[c(1,2), ]

my_vector <- c(3213,1,2313,21,32, 13)
my_vector[order(my_vector)]

which.max(my_vector)
which.min(my_vector)

which(my_vector > 5)


install.packages("UsingR")

library("UsingR")

#exercise1 
vec <- c(8,3,8,7,15,9,12,4,9,10,5,1)

matrix1 <- matrix(vec, nrow=4, ncol=3)

rownames(c("a", "b", "c"))

#добавяне на нова колона към матрицата
new_matrix <- cbind(matrix1, c(1, 3, 5, 7))
new_matrix

new_matrix2 <- rbind(new_matrix, c(2,2,2,2))
new_matrix2

#сортиране по първа колона
order_first_row <- order(new_matrix[ ,1])

#пренарежда номера на редовете според индексите, които са върнати от order
new_matrix[order_first_row, ]

#същото, но с пренареждане според ред
order_first_col <- order(new_matrix[1,])
final <- new_matrix[ ,order_first_col]
final

#ако искаме по първите две колони order_first_row <- order(new_matrix[ ,1], new_matrix[, 2])


#exercise 2
#можем да разгледаме данните чрез view(homedata)
?homedata
View(homedata)

#чрез оператора homedata$y1970 можем да вземем съотв колона от датата

#най-скъпата и най-евтината къща
most_expensive <- homedata$y1970[which.max(homedata$y2000)]
most_expensive

least_expensive <- homedata$y1970[which.min(homedata$y2000)]
least_expensive

#цените на петте най-скъпи къщи през 2000г
orders <- order(homedata$y2000, decreasing = TRUE)

#така взимаме 5 от тях
homedata$y2000[orders[1:5]]

#броят на къщите по-скъпи от 750 000
length(which(homedata$y2000 > 750000))

#средната цена на къщите по-скъпи от 750 000
houses <- homedata$y1970[which(homedata$y2000 > 750000)]
mean(houses)

#цената през 2000г на тези къщи, чиято цена е намаляла
decrease <- which(homedata$y1970 > homedata$y2000)
homedata$y2000[decrease]

#десетте къщи с най-голямо процентно увеличение в цената
increasing <- order((homedata$y2000 - homedata$y1970) / homedata$y1970, decreasing =TRUE)

homedata[increasing[1:10],]


#exercise 3
install.packages("MASS")
library("MASS")

?survey

length(survey$Sex[survey$Sex == "Male"])

survey[survey$Sex == "Male" & survey$Smoke != "Never", ]

mean(survey$Height[survey$Sex == "Male"], na.rm = TRUE)

youngest <- order(survey$Age)

survey[youngest[1:10], ]

survey$Height[youngest[1:6]]
survey$Sex[youngest[1:6]]
  

sorted <- survey[order(survey[,1], survey[,2], survey[,3]), ]
head(sorted, 5)
  