## Descriptive Stats on in-built datasets ##
View(mtcars)
colnames(mtcars)
mtcars$mpg

## basic stats ##
mean(mtcars$mpg)
mode(mtcars$mpg)
median(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)
sd(mtcars$mpg)
var(mtcars$mpg)

##summary of a column##
summary(mtcars$mpg)

##summary of full tables##
summary(mtcars)

## similarly take other example of in-built dataset- iris##

View(iris)
colnames(iris)

summary(iris)


## adding ggplot2 ##

install.packages("ggplot2")
library(ggplot2)

view(mtcars)
View(mtcars)

p <- ggplot(mtcars, aes(x = wt, y = mpg) ) ##initalizing data layer
print(p) ##geometric layer addition is pending

p + geom_point()
p + geom_line()
p + geom_rect(xmin = min(mtcars$wt), xmax = max(mtcars$wt), ymin = min(mtcars$mpg), ymax = max(mtcars$mpg))

p + geom_boxplot()

## having different geometric object ##
p = ggplot(mtcars, aes(x = wt, y = mpg))
p + geom_point()+
    geom_line()+
    geom_smooth()

## adding 3rd variable ##
p = ggplot(mtcars, aes(x=wt, y=mpg,color=vs))
p+ geom_point()+
    geom_line()+
    geom_smooth()

p = ggplot(mtcars, aes(x=wt, y  =mpg,color=factor(vs)))
p+geom_point()
