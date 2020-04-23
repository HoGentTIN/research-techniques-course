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
