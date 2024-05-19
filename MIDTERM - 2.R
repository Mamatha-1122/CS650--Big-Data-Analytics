data <- read.csv(file.choose())
head(data)


# Data Exploration
summary(data)
str(data)
head(data)

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("C:/Users/konga/Downloads/winequality-red.csv")

# Data Exploration
summary(data)
str(data)
head(data)

# Linear Regression
linear_model <- lm(quality ~ ., data = data)
summary(linear_model)

# Visualization for Linear Regression
plot_linear <- ggplot(data, aes(x = quality, y = fitted(linear_model))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Linear Regression: Observed vs Fitted", x = "Observed Quality", y = "Fitted Quality")

# Logistic Regression (example with binary quality)
data$quality_binary <- ifelse(data$quality >= 6, 1, 0)  # Example threshold for binary quality
logistic_model <- glm(quality_binary ~ ., data = data, family = binomial)
summary(logistic_model)

# Visualization for Logistic Regression
fitted_values <- predict(logistic_model, type = "response")
plot_logistic <- ggplot(data, aes(x = fitted_values, y = quality_binary)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE, color = "green") +
  labs(title = "Logistic Regression: Observed vs Fitted", x = "Fitted Probability", y = "Observed Quality")

# Polynomial Regression (example with quadratic term)
poly_model <- lm(quality ~ poly(pH, 2), data = data)  # Example with pH squared
summary(poly_model)

# Visualization for Polynomial Regression
plot_poly <- ggplot(data, aes(x = pH, y = quality)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "red") +
  labs(title = "Polynomial Regression: pH vs Quality", x = "pH", y = "Quality")

# Display the plots
plot_linear
plot_logistic
plot_poly


# Residuals vs. Fitted Values Plot
residuals_vs_fitted <- ggplot(data, aes(x = fitted(linear_model), y = resid(linear_model))) +
  geom_point() +
  geom_hline(yintercept = 0, color = "red") +
  labs(title = "Residuals vs. Fitted Values", x = "Fitted Values", y = "Residuals")

# Q-Q Plot
qq_plot <- ggplot(data, aes(sample = resid(linear_model))) +
  geom_qq() +
  geom_qq_line() +
  labs(title = "Q-Q Plot of Residuals")

# Display the plots
residuals_vs_fitted
qq_plot


