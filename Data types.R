## this is an introduction to the data types present in R ##

#Everything in R is an object#
#it is an entity which is used to store things for further manipulation#
--Basic data types in R are--
--Character--
--Numeric (real or decimal)
--Integer
--Logical
--Complex

## started creating objects ##
my_obj = 48
print(my_obj)
typeof(my_obj)
##character objects##
my_char = "a"
print(my_char)
typeof(my_char)
## integer data object ##
my_int = 10
print(my_int)
typeof(my_int)
#an integer needs to be assigned an L value in the end##
my_int1 = 10L
typeof(my_int1)

## Data structures in R ##
#5 data structures in R#
#Atomic vector#
#List#
#Matrix#
#Data Frame--
#Factor--

## Atomic vectors ## (collection of objects of the same type)
my_vec = c(1L, 2L, 3L, 4L)
print(my_vec)

my_vec1 = 1:4 #other method of assigning a vector#
print(my_vec1)

my_vec2 = seq(from = 1, to = 4, by = 1) #other method#
print(my_vec2)

#function#
length(my_vec)
typeof(my_vec)
class(my_vec)
class(my_vec1)
class(my_vec2)
typeof(my_vec2)
str(my_vec)
str(my_vec2)

#Access elements & modify elements of a vector#
my_vec[1]
my_vec[1] = 20
print(my_vec)

#Missing values#
my_vec3 = c(1,2,NA,4)
print(my_vec3)
is.na(my_vec3) #function for getting missing values position/boolean#
anyNA(my_vec3)

#Special values#
1/0
0/0

#### List data structure ####
my_list1 = list(5)
print(my_list1)
#List with values#
my_list2 = list(1, "Name", c("a","b","c"))
print(my_list2)
#assignning names to slots of List#
names(my_list2) = c("first","second","third")
str(my_list2)
class(my_list2)
typeof(my_list2)
#Assigning and modifying list objects#
my_list2[3]
my_list2$third
my_list2[1] = 10
print(my_list2)


#### Matrix is an atomic vector with 1 or 2 dimension ####
my_matrix1 = matrix(c(1,2,3,4), nrow = 2, ncol = 2)
print(my_matrix1)
class(my_matrix1)
typeof(my_matrix1)

my_matrix2 = matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
print(my_matrix2)
my_matrix3 = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
print(my_matrix3)
my_matrix4 = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)
print(my_matrix4)
#assigning names to rows and columns of matrix#
row.names(my_matrix4) = c('row1', 'row2')
print(my_matrix4)
colnames(my_matrix4) = c('col1', 'col2', 'col3')
print(my_matrix4)
str(my_matrix4)
#accessing a matrix object#
my_matrix4[1,2]


#### Data frame rectangular arrangement of lists with each sublists of same length ####
#creating a dataframe manually#
ID = c('A', 'B', 'C')
Age = c(21,22,23)
Height = c(150,160,170)
sData = data.frame(ID,Age,Height)
print(sData)
#Assigning names to the rows and columns of data frames#
rownames(sData) = c('John', 'Sam', 'Paul')
print(sData)
