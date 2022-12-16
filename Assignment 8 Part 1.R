# 1.1: Introduction to R and RStudio
getwd()

##I am adding 3 and 5
3+5
x <- 5
y <- 10
y
x+y
number <- x + y 

#R syntax and data structure
#numeric vector
glengths <- c(4.6, 3000, 50000)
glengths

#character vector
species <- c("ecoli", "human", "corn")
species

#vector of numeric and character values
combined <- c(glengths, species)

# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)

#another example
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
samplegroup <- factor(samplegroup)

# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)

titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)
#create df of favorite books
favorite_books <- data.frame(titles, pages)

#create lists
list1 <- list(species, df, number)
list2 <- list(species, glengths, number)

#Basic functions
#add elements to an existing vector
glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning

#square root
sqrt(81)
sqrt(glengths)

#round numbers
round(3.14159)
round(3.14159, 2) #round to two digits

#finding mean
mean(glengths)

test <- c(1, NA, 2, 3, NA, 4)
mean(test, na.rm=TRUE)

#seeking help
?round
args(round)
example("round")

#sorting
sort(glengths, decreasing = TRUE)

#user defined functions
name_of_function <- function(argument1, argument2) {
  statements or code that does something
  return(something)
}
square_it <- function(x) {
  square <- x * x 
  return(square)
}
square_it(5)

multiply_it <- function(x,y) {
  product <- x * y
  return(product)
}

multiply_it(x=4,y=6)

#Reading in and Inspecting Data
#csv
read.csv()
read_csv()
#tsv
read.tsv()
#txt
read.table() #utils
read.table() #readr
read.delim() #readr

readdta() #stata version 13-14
read.dta()#stata version 7-12
read.spss() #spss
read.sas7bdat() #sas
read_excel() #excel 

#create dataframe by reading in the file
metadata <- read.csv(file="/Users/fizzahzaidi/Downloads/mouse_exp_design.csv")

#Exercise 1
proj_summary <- read.table(file = "/Users/fizzahzaidi/Downloads/project-summary.txt", header = TRUE, row.names = 1)

#inspecting data
head(metadata) #check first 6 lines
tail() #check last 6 lines
str() #compact display of data contents
class() #displays data type
summary() #display contents
length() #number of elements
dim() #dimensions
nrow() #number of rows
ncol() #number of columns
rownames() #get row names
colnames() #get column names

#Exercise 2
head(metadata)
class(glengths)
class(metadata)
summary(proj_summary)
length(samplegroup)
dim(proj_summary)
rownames(metadata)
length(colnames(proj_summary))
       
# 2.1: Data Wrangling-Subsetting Vectors and Factors
age <- c(15,22,45,52,73,81)
age[5] #get fifth element
age[-5] #get all elements except the fifth
age[c(3,5,6)] #get multiple values from age
age[1:4] #get sequence of continuous variables
alphabets <- c("C","D","X","L","E")
alphabets[c(1,2,5)]
alphabets[-3]
rev(alphabets) #get vector but in reverse
       
age > 50 #check if each element is >50
age>50 | age<18 #get values >50 OR <18
age[age>50 | age<18]#get actual values not "TRUE"/"FALSE" vector
idx <- age>50 | age<18
age[idx]
       
which(age>50 | age<18)
age[which(age>50 | age<18)]
idx_num <- which(age>50 | age<18)
age[idx_num]
       
expression[expression == "high"]
       
samplegroup[samplegroup != "KO"]

expression
str(expression)
       
expression <- factor(expression, levels=c("low","medium","high"))
expression
str(expression)
       
samplegroup <- factor(samplegroup,levels="KO","CTL","OE")
samplegroup
str(samplegroup)
       
# 2.2: Packages and Libraries
sessionInfo()
search()
       
install.packages("ggplot2")
install.packages("BiocManager")
BiocManager::install("ggplot2")
       
library(tidyverse)
       
# 2.3: Data Wrangling-dataframes, matrices, and lists
metadata[1,1] # extract value from dataframe
metadata[1,3]
metadata[3,] # get third row
metadata[,3] #get third column
metadata[,3,drop=FALSE]#extract third column as a dataframe
metadata[,1:2] #get first two columns
metadata[c(1,3,6),]#get first,third,sixth columns
metadata[c("sample1","sample2","sample3"),"celltype"] #get celltype for first three samples
colnames(metadata)#column names of df
rownames(metadata)#row names of df
metadata$genotype #extract genotype column
metadata$genotype[1:5]#extract first five values/elements of the genotype column
       
metadata[c(1,3)] #get genotype and replicate column
metadata[4,3]
metadata[9,3]
metadata$replicate
       
metadata$celltype == "typeA"
logical_idx <- metadata$celltype == "typeA"
logical_idx
metadata[logical_idx,]#extract rows that correspond to TRUE values
 which(metadata$celltype=="typeA")#return indices where logical expression is TRUE
idx <- which(metadata$celltype == "typeA")
metadata[idx,]
which(metadata$replicate >1)
idx <- which(metadata$replicate>1)#return indices for rows in replicate column that have a value of 2 or 3
metadata[idx,] #use indices to extract corresponding rows from table
metadata[which(metadata$replicate >1),]
sub_meta <- metadata[which(metadata$replicate >1),]

KO <- metadata$genotype =="KO"
metadata[KO,]
       
list1
list1[[2]]
       
comp2 <- list1[[2]]
class(comp2)
list1[[1]]
list1[[1]][1]
       
random <- list(metadata,age,list1,samplegroup,number)
random
random[[4]]
       
names(list1)
names(list1) <- c("species","df","number")
names(list1)
list1$df
names(random)<- c("metadata","age","list1","samplegroup","number")
random$age    
       
       