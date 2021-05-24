# Хвърлят се 30 зара. Каква е вероятността да се паднат по-малко от 5 шестици?

#Примери за това как се работи с binomial functions

# pbinom
# This function gives the cumulative probability of an event. It is a single value representing the probability.
# Probability of getting 26 or less heads from a 51 tosses of a coin.
x <- pbinom(26,51,0.5)

print(x)

# qbinom
# This function takes the probability value and gives a number whose cumulative value matches the probability value.
# How many heads will have a probability of 0.25 will come out when a coin
# is tossed 51 times.
x <- qbinom(0.25,51,1/2)

print(x)


# rbinom
# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8,150,4)

print(x)

#задача 1. Хвърляме 30 зара. Каква е вероятността да се паднат по-малко от 5 шестици?

#вероятността от 30 хвърляния да се паднат под 5 шестици
pbinom(4, 30, 1/6)

#сто пъти хвърляме по 30 зара и ни връща колко шестици имаме на всяко хвърляне
x <- rbinom(100, 30, 1/6)

#теоритичната вероятност, която е броя успешни опити делено на общия брой опити
sum(x < 5) / 100

#колко шестици трябва да хвърлим за да има вероятност 25%
qbinom(0.25, 30, 1/6 )

#задача 2

# R function dnbinom(x, size, prob) is the probability of x failures prior to the rth success
# (note the difference) when the probability of success is prob
# точно 8 изтрела
dnbinom(5, 3, 0.2)

#повече от 6 изтрела
pnbinom(3, 3, 0.2, lower.tail = F )

#между 5 и 8 изтрела вкл
pnbinom( 5, 3, 0.2) - pnbinom( 1, 3, 0.2)

