medicines <- read.csv(file.choose()) # Open Income.csv
head(inc)

# Load required libraries
library(readr)

# Unzip the dataset if it's in a zip file
unzip("C:/Users/chand/Downloads/heart disease.csv.zip", exdir = "C:/Users/chand/Downloads/")

# Read the CSV file into a dataframe
data <- read.csv("C:/Users/chand/Downloads/heart disease.csv")

# Perform linear regression
# Replace "dependent_var" with the name of the dependent variable column
# Replace "independent_var1" and "independent_var2" with the names of independent variables
model <- lm(age ~ education, data = data)

# Print the summary of the linear regression model
summary(model)

# Load required libraries
library(readr)

# Unzip the dataset if it's in a zip file
unzip("C:/Users/chand/Downloads/heart disease.csv.zip", exdir = "C:/Users/chand/Downloads/")

# Read the CSV file into a dataframe
data <- read.csv("C:/Users/chand/Downloads/heart disease.csv")

# Perform linear regression
# Replace "dependent_var" with the name of the dependent variable column
# Replace "independent_var1" and "independent_var2" with the names of independent variables
model <- lm(age~ gender,education data = data)

# Print the summary of the linear regression model
summary(model)

# Perform linear regression
# Replace "dependent_var" with the name of the dependent variable column
# Replace "independent_var1" and "independent_var2" with the names of independent variables
model <- lm(d ~ independent_var1 + independent_var2, data = data)
# Perform linear regression
# Replace "dependent_var" with the name of the dependent variable column
# Replace "independent_var1" and "independent_var2" with the names of independent variables
model <- lm(Income ~ education+ gender, data = data)