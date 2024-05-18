# Load necessary libraries if not already loaded
# install.packages("ggplot2") # Uncomment and run if you haven't installed ggplot2
# install.packages("dplyr")   # Uncomment and run if you haven't installed dplyr
library(ggplot2)
library(dplyr)

# Load the heart disease dataset
heart_disease_data <- read.csv("C:/Users/chand/Downloads/heart disease.csv/heart disease.csv", header = TRUE)

# Summary of the data
summary(heart_disease_data)

# Perform linear regression
# Replace "dependent_var" with the name of the dependent variable column
# Replace "independent_var1" and "independent_var2" with the names of independent variables
linear_model <- lm(target ~ age + sex + cp + trestbps + chol + fbs + restecg + thalach + exang + oldpeak + slope + ca + thal, data = heart_disease_data)

# Summary of the linear regression model
summary(linear_model)

# Perform logistic regression
# Assuming "target" is the binary outcome variable
logistic_model <- glm(target ~ age + sex + cp + trestbps + chol + fbs + restecg + thalach + exang + oldpeak + slope + ca + thal, data = heart_disease_data, family = binomial)

# Summary of the logistic regression model
summary(logistic_model)

# Perform polynomial regression
# For example, let's create a quadratic polynomial model for age
polynomial_model <- lm(target ~ poly(age, 2) + sex + cp + trestbps + chol + fbs + restecg + thalach + exang + oldpeak + slope + ca + thal, data = heart_disease_data)

# Summary of the polynomial regression model
summary(polynomial_model)


# Visualize linear regression
# Actual vs. Predicted values
linear_predicted <- predict(linear_model)
plot(heart_disease_data$target, linear_predicted, main = "Linear Regression: Actual vs. Predicted", xlab = "Actual", ylab = "Predicted")
abline(0, 1)

# Diagnostic plots
par(mfrow = c(2, 2))
plot(linear_model)

# Visualize logistic regression
# Predicted probabilities
logistic_probs <- predict(logistic_model, type = "response")
plot(heart_disease_data$target, logistic_probs, main = "Logistic Regression: Actual vs. Predicted Probabilities", xlab = "Actual", ylab = "Predicted Probability")

# Diagnostic plots
par(mfrow = c(2, 2))
plot(logistic_model)

# Visualize polynomial regression
# Actual vs. Predicted values
polynomial_predicted <- predict(polynomial_model)
plot(heart_disease_data$target, polynomial_predicted, main = "Polynomial Regression: Actual vs. Predicted", xlab = "Actual", ylab = "Predicted")
abline(0, 1)

# Diagnostic plots
par(mfrow = c(2, 2))
plot(polynomial_model)
