rm(list = ls())
#DAY 2 -- DATA MANIPLULATION, PROGRAMMING, GRAPHICS

#functions in R
v <- c(1,2,3,4)
mean(v)
#dealing with NA - mean of numbers with NA is NA
v[4] <- NA
mean(v)
mean(v, na.rm = TRUE)
is.na(v)
v[is.na(v)] <- 5

#packages
install.packages("ggplot2")
installed.packages()

library(ggplot2)

#USER DEFINED FUNCTIONS

meanfunc <- function(x){
  sumx <- sum(x)
  meanx <- sumx/length(x)
  return(meanx)
}

meanfunc(v)

sumdiff <- function(a,b){
  nsum <- a + b
  ndiff <- a - b
  return(c(nsum, ndiff))
}

sumdiff(7, 5)
#vairables are local inside a function 
#to make them global, use <<-

#PROGRAMMING

if(3 < 5){
  print("yup")
}

ifelse(3>4, 1, 0)

isitthree <- function(x){
  if(x==3){
    return(TRUE)
  }else{return(FALSE)}
}

isitthree(3)
#for loops
for(i in 1:3){ #any list in the for
  print(i*3)
}

#while loops

i <- 0
while(i <= 2){
  print(3*i)
  i <- i + 1
}

#apply (operations in parallel)

m <- matrix(1:6, nrow =2)
apply(m, 2, mean)
apply(m, 1, mean)

vout <- c()
for (i in 1:ncol(m)){
  vout <- c(vout, sum(m[,i]))
}
vout

#sapply, lapply

#AGGREGATION
head(airquality)
dim(airquality)
summary(airquality)

dfout <- aggregate(Temp ~ Month, data = airquality, mean)

aggregate(cbind(Temp, Ozone) ~ Month, data = airquality, mean) #the function here omits NA values

#merging data sets
crime <- data.frame(month = 5:9, crime = c(12, 20, 40, 11, 21))
crimetemp <- merge(dfout, crime, by.x = "Month", by.y = "month")
crimetemp

#######
authors <- data.frame(
  surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"), 
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  stringsAsFactors=FALSE)
books <- data.frame(
  name = c("Tukey", "Venables", "Tierney",
           "Ripley", "Ripley", "McNeil", "R Core"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
  stringsAsFactors=FALSE)

merge(authors, books, by.x = "surname", by.y = "name")

#Concat in R : paste

for(i in 1:3){
  filename <- paste("datafile", i, ".txt", sep = "")
  print(filename)
}

#split
split <- strsplit("good, bad, ugly", ", ")
split

#search
#searches for left in right (matches exact case)
c("fish", "dog", 2) %in% c("happy", "fish", 2)

#grep (finds parts of the word also)
grep("fish", c("fish and chips", "cheeseburger", "fried fish"))

gsub("fish", "chicken", c("fish and rice"))



#GRAPHICS 
##built in R graphics
#histogram 
hist(airquality$Temp, main = "Temperature Histogram of Air Quality", xlab = "Temperature")
#boxplots
boxplot(airquality$Temp)

airdate <- as.Date(paste("1972", "-", airquality$Month, "-", airquality$Day, sep = "")) #we do this to get a format of the dates that R understands
plot(airdate, airquality$Temp, xlab = "Date", ylab = "Temparature", main = "Temp by day")
plot(airquality$Day, airquality$Temp, xlab = "Date", ylab = "Temparature", main = "Temp by day")

##ggplot
library(ggplot2)
#aes (asthetics)
ggplot(data = airquality, aes(x = Temp)) + geom_histogram()

ggplot(data = airquality, aes(x = 2, y=Temp)) + geom_boxplot()
ggplot(data = airquality, aes(x= as.factor(Month), y= Temp)) + geom_boxplot() + xlab("Month")

airquality2 <- cbind(airquality,airdate)
head(airquality2)

ggplot(data = airquality2, aes(x=airdate , y= Temp))  + xlab("Date") + ylab("Temparature")  + geom_smooth()
summary(airquality2)
ggsave("samplegraphy.pdf", device = NULL, width = 6, height = 4)

?ggsave

summary(diamonds)
head(diamonds)

head(sunspots)
summary(sunspots)
sunspots
iris
iris[1,1:3]
