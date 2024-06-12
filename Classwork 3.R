# printing the normal distribution 
x <-rnorm(5) # 5 numbers normal around mean = 0 sd =1
3

# printing a three ways of vector
x
# R specific loop i takes the values
for( i in x)
{ print(i) }
#conventional loop
for (j in 1:5)
{ print( x[j] ) }
4

# printing the example on vector math
N <-100000
a <-rnorm(N)
b <- rnorm(N)
#Vectorized approach
c <- a * b
c
5

# printing the valid function calls
X <- rnorm(5)
X <- rnorm( 5, 10, 1)
X <- rnorm (5, 10)
X <- rnorm(5, mean=10, sd = 1)
X <- rnorm(5, sd=1, mean=10)
X <- rnorm(5, sd=1)
7

# printing the simple graphics
x <-rnorm(10)
plot(x)
hist(x)

# printing the basic R statistics tools
x <-rnorm(80000)
plot(x)
hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x)


