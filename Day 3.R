#DAY 3
#intro to probability and stats
rm(list=ls())
#sample space
die1 <- c(1,2,3,4,5,6)
die2 <- c(1,2,3,4,5,6)
twodice <- outer(die1,die2, "+")

length(which(twodice == 5 | twodice == 7 | twodice == 9))
sum(twodice == 5 | twodice == 7 | twodice == 9)

#bayes theorem
#P(A/B) = (P(B/A).P(A))/P(B)

df1 <- sample(die1,999999,replace = TRUE)

library(ggplot2)             

ggplot(data = data.frame(df1), aes(x=df1)) + geom_histogram(aes(y =..count../sum(..count..)))

die3 <- c(1,1,3,3,3,3,3,7,7,7)
df3 <- sample(die3, 999999, replace = TRUE)

ggplot(data = data.frame(df3), aes(x=df3)) + geom_histogram(aes(y =..count../sum(..count..)))

random <- runif(9999999, min = 0, max = 1)

ggplot(data= data.frame(random), aes(x=random)) + geom_histogram(aes(y =..density..))


#function: y => 0 : x<0
#          y => 1 : 0<=x<=1
#          y => 0 : x>1

unifrom <- function(x){ifelse(x >= 0 & x <=1,1,0)}
ggplot(data=data.frame(x=c(-1,2)),aes(x)) + stat_function(fun = unifrom)

#cumulative density function
unifromcumu <- function(x){ifelse(x >= 0 & x <=1, x, ifelse(x<0, 0, 1))}
ggplot(data=data.frame(x=c(-1,2)),aes(x)) + stat_function(fun = unifromcumu)

#in R:
#1 random number between 2 and 5
runif(1,2,5)

#probabilty distribultion
dunif(0.5, 0, 1)

#cumulative distribution 
punif(3,2,5) #here the area under 2-5 has to be one, so the height of each uniform interval will be 
#1/(5-2)

#binomial distribution
#rolling a die: 2 2's in 3 rolls of a die
#also the same as 2 3's in 3 rolls of a die
dbinom(2,3,1/6)

#cumulative: cumulative probability of getting three or fewer heads out of four flips?
pbinom(3,4,0.5)

#flip n coins x number of times and count the number of heads (or tails) : rbinom(n, x, 0.5)
#
headcounts <- rbinom(99999, 100, 0.5)
ggplot(data=data.frame(headcounts),aes(x=headcounts)) +  geom_histogram(aes(y=..density..), binwidth = 2) +  xlim(-2, 102) + ylab("density") + xlab("outcome")

#http://www.nickbeauchamp.com/comp_stats_NB/compstats_03-03.html

#normal distribution

randnorms <- rnorm(10000,0,1)
ggplot(data=data.frame(randnorms),aes(x=randnorms)) +  geom_histogram(aes(y=..density..)) +  xlim(-4, 4) + ylab("density") + xlab("outcome")

normfun <- function(x){dnorm(x,0,1)}
ggplot(data = data.frame(x=c(-6,6)), aes(x)) + stat_function(fun = normfun)

pnorm(0,0,1)

?dnorm
