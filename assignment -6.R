# Load necessary libraries
library(ggplot2)
library(plot3D)

# Load the dataset
file_path <- "C:/Users/chand/Downloads/Mall_Customers.csv"
mall_customers <- read.csv(file_path)
head(mall_customers)

# Plot Annual Income vs Spending Score to visualize the data
qplot(data=mall_customers, x=Annual.Income..k.., y=Spending.Score..1.100., main="Initial Data Visualization")

# Convert the necessary columns to a matrix
mat <- as.matrix(mall_customers[, c("Annual.Income..k..", "Spending.Score..1.100.")])

# Apply k-means clustering with 3 centers
set.seed(123) # Set seed for reproducibility
km <- kmeans(mat, centers=3)
mall_customers$cluster <- as.factor(km$cluster)
head(mall_customers)

# Plot the clusters using Annual Income and Spending Score
qplot(data=mall_customers, x=Annual.Income..k.., y=Spending.Score..1.100., color=cluster, main="K-Means Clustering Results")



# Calculate within-cluster sum of squares for different numbers of clusters
wss <- numeric(15)
for (k in 1:15) {
  wss[k] <- sum(kmeans(mat, centers=k, nstart=50)$tot.withinss)
}

# Plot the WSS to see the Elbow
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within-Cluster Sum of Squares", main="Elbow Method for Optimal Clusters")

# Apply k-means clustering with 5 centers (as identified by the Elbow method)
set.seed(123)
km_final <- kmeans(mat, centers=5)
mall_customers$final_cluster <- as.factor(km_final$cluster)

# Plot the final clusters using Annual Income and Spending Score
qplot(data=mall_customers, x=Annual.Income..k.., y=Spending.Score..1.100., color=final_cluster, main="Final K-Means Clustering Results")


# Install and load plot3D library
if(!require(plot3D)) install.packages("plot3D", dependencies=TRUE)
library(plot3D)

# 3D scatter plot of Age, Annual Income, and Spending Score
scatter3D(mall_customers$Age, mall_customers$Annual.Income..k.., mall_customers$Spending.Score..1.100., 
          colvar=as.numeric(mall_customers$final_cluster), pch=19, main="3D Scatter Plot with Final Clusters",
          xlab="Age", ylab="Annual Income (k$)", zlab="Spending Score (1-100)")


