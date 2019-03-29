######################### Data wrangling in R ######################
#### Based on the data carpentry ecology lessons: 
####       http://www.datacarpentry.org/R-ecology-lesson/03-dplyr.html

#installing packages
#install.packages("tidyverse")

#loading packages
library("tidyverse")

#read the data as a data frame
surveys_dot <- read.csv("data/raw_surveys.csv")
surveys_dot
str(surveys_dot)

#read the data as a 'tibble'
surveys <- read_csv('data/raw_surveys.csv')
surveys
str(surveys)

############################## The Verbs! ################################

### Select
select(surveys,      #the data
       weight)       #selects the weight column

#same as
tibble(surveys$weight)

#select multiple columns
select(surveys,      #the data
       plot_id,      #selects the plot_id column
       species_id,   #selects the species_id column
       weight)       #selects the weight column


### Filter
filter(surveys, year == 1995) 

#same as 
surveys[surveys$year == 1995, ]

#filter by multiple attributes

filter(surveys,          #the data
       year == 1995 &    #filter for rows that have 1995 in year column
         sex == "F")       #filter for rows that have F in the sex column

#same as 
surveys[surveys$year == 1995 & surveys$sex == "F", ]

###pipes
surveys %>%                             #the data then
  filter(weight < 5) %>%             #filter for rows where weight is less than 5 then
  select(species_id, sex, weight)  #select the species_id, sex, and weight columns


#Exercise #1: 
### Using pipes, subset the survey data to include individuals collected 
###     before 1995 and retain only the columns year, sex, and weight.

surveys %>%
  filter(year == 1995) %>%
  select(year, sex, weight)

#                   OR
surveys %>%
  select(year, sex, weight) %>%
  filter(year == 1995)

### Mutate
mutate(surveys,                          #the data
       weight_kg = weight / 1000)          #a new column definition
#creates a new column called weight_kg
#that holds the corresponding weight value / 1000

#same as
surveys %>%                              #the data
  mutate(weight_kg = weight / 1000) #see above 

# add 2 new columns at once
surveys %>%                              #the data
  mutate(weight_kg = weight / 1000, #see above
         weight_kg2 = weight_kg *2) #creates a column called weight_kg2
#that holds the value weight_kg*2
