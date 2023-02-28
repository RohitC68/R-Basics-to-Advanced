## Introduction to Tidy Verse library and GGPlot ##
install.packages('tidyverse')
install.packages('ggplot2')

--dplyr is a library for data wrangling--
--ggplot 2 is a library for data visualization--
## Loading tideverse library ##
library(tidyverse)

#loading motor trends car road tests(mtcars) dataset--
data() --checking all available datasets--
?mtcars --checking summary of data--
#using function data() to load an inbuilt dataset--
#carData = data("mtcars")
#reading any particular dataset in our working directory--
carData = read.csv('mtcars.csv')
#using this function will upload data into our program--
#if not in same directory, then use the path--
#printing 1st 5 rows of dataset#
head(carData, 5)
str(carData)
colnames(carData)
nrow(carData)

#Basic data management using tidyverse package#
#mutate() function is used to add new columns or modify existing#
#adding new column called cyltype#
carData %>% mutate(cyltype = 'High')
head(carData)
#modiying new added column with if-else function#
carData %>% mutate(cyltype = ifelse(cyl>6, 'High', 'Low'))
#adding wtton column#
carData %>% mutate(wtton = wt*0.45)
#adding cyltype & wtton into our DF permanentaly#
carData.new = carData %>% mutate(cyltype = ifelse(cyl>6, 'High', 'Low'),
                wtton = wt*0.45)
str(carData.new)
print(carData.new)

#summarize() function collapses all rows and returns a summary#
carData.new %>% summarize(mean(wtton))
carData.new %>% summarize(mean(wtton), mean(disp))

#groupby() function is used to group samples of same features#
carData.new %>% group_by(cyltype) %>% summarize(mean(wtton), mean(disp))

#filter() function filters as per the condition#
#filtering cars data whose wtton>2#
carData.new %>% filter(wtton>2)
#filtering cars data having wtton>2 & cyl>4#
carData.new %>% filter(wtton>2 & cyl>4)

#select() function is used to retain specific features#
#select only the wtton feature#
carData.new %>% select(wtton)
#select everything except wtton#
carData.new %>% select(-wtton)
#select only cyltpe & wtton column#
carData.new %>% select(wtton, cyltype)
#select everything except wtton & cyltype#
carData.new %>% select(-wtton, -cyltype)


### Moving to GGPLOT2 library ###
#initiating the ggplot() function for binding the DF#
ggplot(data = carData)
#saving this into an variable#
carPlot = ggplot(data = carData)
#using aes() function to specify mapping, which variables are being plotted#
carPlot = ggplot(data = carData, aes(x = wt, y = disp))
carPlot
#using geom_type function to add geometric elements like line, bar, histogram#
carPlot = carPlot + geom_point()
carPlot
#adding labels and title#
carPlot = carPlot + labs(x = 'weight (1000 lbs)', y = 'displacement(cu.in)',
            title = 'Weight vs Displacement')
carPlot
