#loading ggplot 2 library#
library(ggplot2)
data('mpg')
mpgData = mpg
?mpg
#printing 1st 5 rows#
head(mpgData, 5)
#inititating ggplot fucntion & binding mpg data#
ggplot(data = mpgData)
#adding aes() data#
mpgPlot = ggplot(data = mpgData, aes(x=displ, y=hwy))
mpgPlot
#adding geom() function#
mpgPlot = ggplot(data = mpgData, aes(x=displ, y=hwy)) + geom_point()
#adding titles and labels#
mpgPlot = mpgPlot + labs(x = 'Displacement (litres)',y = 'Mileage (MPG)',
            title = 'Mileage vs Displacement')
mpgPlot

#mapping colors to the variables#
mpgPlot2 = ggplot(data = mpgData) + geom_point(
            mapping= aes(x = displ, y = hwy, color = class))
mpgPlot2

#mapping the size or alpha aesthetic to the class variable#
mpgPlot3 = ggplot(data = mpgData) + geom_point(
            mapping= aes(x = displ, y = hwy, size = class))
mpgPlot3
#using alpha#
mpgPlot4 = ggplot(data = mpgData) + geom_point(
            mapping= aes(x = displ, y = hwy, alpha = class))
mpgPlot4

#coloring everything in blue#
mpgPlot5 = ggplot(data = mpgData) + geom_point(aes(x = displ, y = hwy), color = 'blue',
            shape= 1, size=5)
mpgPlot5

#creating plots using facet_wrap function to add sub-plots#
ggplot(data = mpgData) + geom_point(
            mapping= aes(x = displ, y = hwy)) +
            facet_wrap(~class, nrow = 2)
ggplot(data = mpgData) + geom_point(
            mapping= aes(x = displ, y = hwy)) +
            facet_wrap(~class, nrow = 3)

#plotting mileage wrt drive train & no.of cylinders(2 variables)#
ggplot(data=mpgData) + geom_point(mapping = aes(x = displ, y = hwy))+
facet_grid(drv ~ cyl)

#quick filtering#
#identifying no.of levels in cylinder type feature#
factor(mpgData$cyl)
#how many types of cylinder types are there#
mpgData %>% count(cyl)
#filter samples with 5 cyinder cars#
mpgData = mpgData %>% filter(!(cyl %in% c(5))) 
mpgData

#adding cyl variable in color aesthetics#
ggplot(data = mpgData) + geom_point(mapping = aes(x=displ,y=hwy,
color=cyl))
#cyl are discrete in nature, so using factor function#
ggplot(data = mpgData) + geom_point(mapping = aes(x=displ,y=hwy,
color=factor(cyl)))
#adding class variable to shape aesthetic#
ggplot(data = mpgData) + geom_point(mapping = aes(x=displ,y=hwy,
color=factor(cyl), shape=class))

#Plotting smooth line plot using geom_smooth() of mileage wrt displacement#
ggplot(data = mpgData) + geom_smooth(mapping = aes(x=displ, y=hwy))
#removing std errors #
ggplot(data = mpgData) + geom_smooth(mapping = aes(x=displ, y=hwy), se = FALSE)

#plotting a smooth line plot of mlg wrt disp for each drv type#
ggplot(data = mpgData) + 
geom_smooth(mapping = aes(x=displ, y=hwy, linetype = drv), 
se = FALSE)

##specifying data for layers individually#
#plotting displ vs hwy for all cars but adding a smooth#
#line only for subcompact cars by filtering#
(ggplot(data = mpgData, mapping = aes(x=displ, y=hwy))+
geom_point(mapping = aes(color = factor(cyl)))+
geom_smooth(data = filter(mpgData, class == "subcompact"), se = FALSE)) 

## adding bar chart wrt no of cylinders ##
ggplot(data = mpgData) + geom_bar(mapping = aes(x=cyl))

#adding a box plot wrt no of cylinders & mileage#
ggplot(data = mpgData) +geom_boxplot(mapping = aes(x=factor(cyl),y=hwy))
ggplot(data = mpgData) +geom_boxplot(aes(x=factor(cyl),y=hwy), outlier.colour = "red", outlier.shape = 8, outlier.size = 4)
