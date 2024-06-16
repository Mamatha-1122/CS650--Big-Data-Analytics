install.packages("tidytext")

# Install the necessary libraries (uncomment if not already installed)
# install.packages("tidyverse")
# install.packages("tidytext")
# install.packages("syuzhet")
# install.packages("ggplot2")

# Load the libraries
library(tidyverse)
library(tidytext)
library(syuzhet)
library(ggplot2)

# Load the dataset
file_path <- "C:/Users/badda/Downloads/amazon_vfl_reviews.csv"
reviews <- read.csv(file_path)

# Display the first few rows of the dataset
head(reviews)

# Convert reviews to character type
reviews$review <- as.character(reviews$review)

# Clean and preprocess the text data
reviews_clean <- reviews %>%
  mutate(review = str_to_lower(review)) %>%
  mutate(review = str_replace_all(review, "[^[:alnum:][:space:]]", " ")) %>%
  mutate(review = str_replace_all(review, "\\s+", " "))

# Get sentiment scores using the syuzhet package
reviews_clean$sentiment <- get_sentiment(reviews_clean$review, method = "syuzhet")

# Categorize sentiment
reviews_clean <- reviews_clean %>%
  mutate(sentiment_category = case_when(
    sentiment > 0.1 ~ "positive",
    sentiment < -0.1 ~ "negative",
    TRUE ~ "neutral"
  ))

# Sentiment distribution bar plot
sentiment_plot <- ggplot(reviews_clean, aes(x = sentiment_category, fill = sentiment_category)) +
  geom_bar() +
  labs(title = "Sentiment Distribution", x = "Sentiment Category", y = "Count") +
  theme_minimal()

# Print the plot
print(sentiment_plot)

# Convert date column to Date type
reviews_clean$date <- as.Date(reviews_clean$date, format = "%Y-%m-%d")

# Aggregate sentiment by date
sentiment_over_time <- reviews_clean %>%
  group_by(date) %>%
  summarize(mean_sentiment = mean(sentiment))

# Plot sentiment over time
sentiment_time_plot <- ggplot(sentiment_over_time, aes(x = date, y = mean_sentiment)) +
  geom_line(color = "blue") +
  labs(title = "Sentiment Over Time", x = "Date", y = "Mean Sentiment") +
  theme_minimal()

# Print the plot
print(sentiment_time_plot)
