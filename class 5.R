#Reads a CSV file named "Income.csv" using a file dialog 
inc <- read.csv(file.choose()) # Open Income.csv
head(inc) # 5 variables

# Lets look around first
qplot( x = inc$Age , y= inc$Income) # I guess income depends on Age
qplot( x = inc$Education , y= inc$Income) # A little bit on Education
qplot( x = inc$Gender , y= inc$Income) # not so much on gender
results = lm ( inc$Income~inc$Age+inc$Education+inc$Gender )
results
summary(results)
library(ggplot2)

Income = 7.2630 + 0.9952 x Age + 1.7579 x Education – 0.9343 x Gender

# creating a scatter plot
inc <- read.csv(file.choose())
head(inc) # 5 variables

# Lets look around first
qplot( x = inc$Age , y= inc$Income) # I guess income depends on Age
qplot( x = inc$Education , y= inc$Income) # A little bit on Education
qplot( x = inc$Gender , y= inc$Income) # not so much on gender
results2 = lm ( inc$Income~inc$Age+inc$Education )
results2
summary(results2)

# creating solution for non linearly data 
x <- runif(75,0,10) # 75 random numbers of uniform distribution
x <- sort(x)
y <- 20 + 10*x + rnorm(75,0,10) # y= 20+10x and a bit of variety

# see it!
plot(x,y)
# Now lets do the regression
lr <- lm(y~x)
lr # print out the deducted equation
# draw the linear regression line
points( x, lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )


x <- runif(75,0,10) # 75 random numbers of uniform distribution
x<- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)
plot(x,y)
lr <- lm(y~x)
lr
points(x,lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )


# Creating solution for non- linearly data
# 75 random numbers of uniform distribution
x <- runif(75,0,10) 
x<- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)
plot(x,y)
lr <- lm(y~x)
lr
poly <- loess(y~x) # Polynomial regression
fit <- predict(poly)
points(x,fit, type="l", col=2)
points(x,lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )

# reading # Reads a CSV file named "Churn.csv"
churn_input <- read.csv(file.choose()) # open the Churn.csv file on blackboard
head(churn_input)
sum(churn_input$Churned)

# Lets look around first at those who actually churned
ch <- churn_input[churn_input$Churned=="1",]
qplot( x = ch$Churned_contacts )
qplot( x = ch$Age )
qplot( x = ch$Married )
qplot( x = ch$Cust_years)

# Now let's see those who did not churn
nch <- churn_input[churn_input$Churned=="0",]
qplot( x = nch$Churned_contacts )
qplot( x = nch$Age )
qplot( x = nch$Married )
qplot( x = nch$Cust_years)

Churn_logistic1 <- glm (Churned~Age + Married + Cust_years + Churned_contacts,
                        data=churn_input, family=binomial(link="logit"))
Churn_logistic1
summary(Churn_logistic1) # Eliminate Married and Cust_years
Churn_logistic2 <- glm (Churned~Age + Churned_contacts,
                        data=churn_input, family=binomial(link="logit"))
Churn_logistic2
summary(Churn_logistic2)




