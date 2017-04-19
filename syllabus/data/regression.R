# Example Linear Regression
weight_gain <- read.csv('santa.txt', sep = "")
attach(weight_gain)

# x = protein content (%)
# y = weight gain (g)
plot(x, y, 
     main = 'Weight gain',
     xlab = 'Protein content (%)',
     ylab = 'Weight gain (g)')
# Calculate regression (lm = "Linear Model")
regr <- lm(y ~ x)
abline(regr, col = 'red') # Plot regression line

# Manual calculation
xm <- mean(x)
ym <- mean(y)
beta1 <- sum((x - xm) * (y - ym)) / sum((x - xm) ^ 2)
beta2 <- ym - beta1 * xm

abline(a = beta2, b = beta1, col = 'green')
