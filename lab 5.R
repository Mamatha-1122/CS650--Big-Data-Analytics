# read a csv file
# method 1 : select manually
stats <- read.csv(file.choose())
stats

# exploring the data
nrow(stats) # number of rows
ncol(stats) # number of columns
head(stats) # first 6 rows
tail(stats) # last 6 rows
str(stats) #structure, Factor W/4 means 4 different values 1,2,3,4
# you can factorize a column by using factor()
summary(stats)


#---------using the $ sign in a data frame
stats[3,3] # row 3 col 3
stats[3,3, drop=F] # row 3 col 3, remember this from last week?
stats[3, "Birth.rate"] #rows do not have names in a data frame
stats$Internet.users # extract a column vector
stats[, "Internet.users"] # same thing, but not as elegant
stats$Internet.users[3] # Angola
levels(stats$Income.Group)
summary(stats$Birth.rate)

# creating new columns
stats[1:10,]
stats[2:7,]
stats[c(4,16,100),]
stats$Birth.rate * stats$Internet.users # meaningless, just testing math
stats$Birth.rate + stats$Internet.users # meaningless, just testing math
# Add a column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
stats
stats$xyz <- 1:5 # add another column
stats
# remove a column
stats$xyz <-NULL
stats$MyCalc <- NULL
stats

# creating data filtering
# -----------------------------filtering data frames
# Slow way of doing it
filter <- stats$Internet.users < 2 # which one less than 2 percent
stats[filter,]
#Better way of filtering
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,] # one step
stats[stats$Income.Group == "High income", ]
stats[stats$Country.Name == "Egypt", ]

#classwork 
# 1. Show the data of France
France_data <- stats[stats$Country == "France", ]
print(France_data)

# 2. Show the countries with birthrate > 20 and High income (5)
selected_countries <- stats[stats$Birth.rate > 20 & stats$Income.Group == "High income", ]
print(selected_countries)

# 3. Show the data of the country with the highest internet users (Iceland)
country_highest_internet <- stats[which.max(stats$Internet.users), ]
print(country_highest_internet)

# 4. Average Birthrate (21.46)
average_birthrate <- mean(stats$Birth.rate)
print(average_birthrate)

# 5. Standard Deviation of birthrate (10.6)
sd_birthrate <- sd(stats$Birth.rate)
print(sd_birthrate)

# 6. Countries whose birth rate is two SDs above the mean
birthrate_threshold <- average_birthrate + 2 * sd_birthrate
countries_above_threshold <- stats[stats$Birth.rate > birthrate_threshold, ]
print(countries_above_threshold)

# 7. IQR of the birthrate (17.6)
iqr_birthrate <- IQR(stats$Birth.rate)
print(iqr_birthrate)

# creating simple qplot
?qplot
# One variable
qplot(stats$Birth.rate) #ok but not prefered
qplot(data=stats,x=Internet.users) #better method, you get a histogram
qplot(data=stats,x=Internet.users, bins=10) #better method
# Two variables
qplot(data=stats, x = Income.Group, y= Birth.rate)
qplot(data=stats, x = Income.Group, y= Internet.users)
# Test the different sizes
qplot(data=stats, x = Income.Group, y= Birth.rate, size=I(10)) #default size is 1
# Test the different Colors
qplot(data=stats, x = Income.Group, y= Birth.rate, size=I(6), color=I("blue")
      
 
# Test the different charts qplot can draw
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="boxplot")
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="path")
#qplot(data=stats, x = Income.Group, y= Birth.rate, geom="dotplot")
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="point") # default

qplot(data=stats, x = Internet.users, y= Birth.rate, geom="boxplot")
qplot(data=stats, x = Internet.users, y= Birth.rate, geom="path")
#qplot(data=stats, x = Internet.users, y= Birth.rate, geom="dotplot")
qplot(data=stats, x = Internet.users, y= Birth.rate, geom="point") # default


# Three variables
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, color=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate, color= Income.Group)
qplot(data=stats, x=Internet.users, y=Birth.rate, color= Income.Group, size=I(4))
qplot(data=stats, y=Internet.users, x=Birth.rate, color= Income.Group, size=I(2))


# creating a data frame from vectors
cont <-
  data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
cont
head(cont)
colnames(cont) <- c("Country", "Code", "Region")
head(cont)
# another way to do it, one step
rm(cont)
cont <-data.frame(Country= Countries_2012_Dataset,Code=
                    Codes_2012_Dataset,Region=Regions_2012_Dataset)
head(cont)


# Merging two data frames
tot <- cbind(stats, cont) # assuming same ordering
head(tot)
#better merging, more clever
merged <- merge(stats, cont, by.x= "Country.Code", by.y="Code")
head(merged)
merged$Country <- NULL
head(merged)

qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region)
#shapes 0-25
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(17))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(2))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(15))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(23))
# Transparency 0---1
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.7))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.3))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.5))

# All four variables
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=Income.Group, alpha=I(0.5))
# Add a title
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.7),
      main="Birth rate vs Internet Users")


                 