setwd("~/Desktop/Coursework/Comp Stats using R")
1+2
2+2
sqrt(-1)
x <- 2
class(x)
rm(x)
is.character("3")
as.numeric("3")
testvar <- as.Date("2016-01-11")
class(testvar)
#numeric, character, factor, date are different types of variables
1 == 2
# === what does it do

#vectors in R
v <- c(1,5,9,7,2)

#or 

r1 <- 1:10

r2 <- rep(3,5)

v[3] <- 100

v[c(1,2)] #get first and second numbers of v

v[3:5] <- c(100, 101, 102) 

v[v < 3] <- 5 #change everything inside v which is less than 3 by 5 

v <- v + 3 #add 3 to every number in v

v < 10 

v1 <- c("t1", "t2")

which(v < 100)

v[which(v<100)]

w <- v -4

v %*% w #works as v1*w1 + v2*w2 + v3*w3

#create matrix
#column binding to build matrices
m <- cbind(w,v)

#row binding to build matrices
m2 <- rbind(w,v)

#use the matrix function (always row, column)
m3 <- matrix(1:9, nrow = 3)

m3[2,3]

m3[,2] #everything in column 2
m3[2,] #everything in row 2

dim(m3) #rows , columns

str(m3) #structure of matrix

t(m3) #transpose

m2 %*% m #matrix multiplication

#data frames
df1 <- data.frame(1:4, rep(3,4), c(2,1,2,4))
df1
#change names
colnames(df1) <- c("c1", "c2", "c3")
colnames(df1)[2:3] <- c("w2","w3")

df1$w2 #$ references by name instead of by the position

df1$w2[1:3] #first 3 of w2

df1[2:3, c("w2", "w3")] 

df1 <- cbind(df1, c("a", "b", "c", "d")) #will make all these as factors with 4 levels
df1
colnames(df1)[4] <- "things"

str(df1)

df1$things <- as.character(df1$things) #change from factors to chars

View(df1) #shows GUI

#write dataframe into a table(csv)

write.table(df1, file = 'testdata.csv',row.names = FALSE, sep = ',') #saves file in the working directory

#read from csv
newdf <- read.table("testdata.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
#scrape from the web
landerfile <- read.table(file = "http://www.jaredlander.com/data/Tomato%20First.csv", header = T, sep = ",", stringsAsFactors = F)
head(landerfile) #first couple of rows
str(landerfile)

save(landerfile, file = "lander.RData") #RData saves metadata, R's own data filetype, also compresses, faster than csv, more useful for bigdata

#lists

list1 <- list(1:5, df1, 3)
list1
#double brackets only for elements in a list
list1[[2]][2,3]

list1[[1]]
names(list1) <- c("onetofive", "dataframe", "three")

list1$dataframe #reference list elements by names

save.image()
load(".RData")

