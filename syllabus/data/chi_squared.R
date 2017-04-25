# Research techniques. The chi-squared test

#
# Sample superhero types - goodness of fit test
#
hero_sample <- data.frame(
  num_sample = c( 127,      75,     98,      27,    73),
  row.names  = c("Mutant", "Mens", "Alien", "God", "Demon"))
expect_frqs <- c(.35,      .17,    .23,     .08,   .17)
result <- chisq.test(hero_sample$num_sample, p = expect_frqs)
df_heroes <- length(hero_sample$num_sample) - 1

X2 <- result$statistic
g <- qchisq(.95, df = df_heroes)

# Conclusion:
sprintf("Chi² = %f", X2)
sprintf("g    = %f", g)
if(X2 < g) {
  print("Accept H0, sample is representative")
} else {
  print("Reject H0, sample is NOT representative")
}

# Plot critical area
x <- seq(0, 20, length.out = 100)
y <- dchisq(x, df = df_heroes)
plot(x, y, type = 'l')  # Plot probability density of the chi²-distribution
abline(v = X2)          # Plot the value of the chi²

i <- x >= g
polygon(c(g, x[i]),     # Plot the critical area (where H0 is rejected)
        c(0, y[i]),
        col='red')

#
# Case families with 5 children
#
num_children <- 5
prob_boy <- .5
# Observed values (number of families with 0..5 boys)
obs <- c(58, 149, 305, 303, 162, 45)
# Expected values for the associated family size and probability of the number of boys
k <- 0:5
exp <- choose(num_children, k) * prob_boy ^ k * (1 - prob_boy) ^ (num_children - k)
df_children <- length(obs) -1

# Execute chi² test
results_children <- chisq.test(obs, p = exp)
# Which categories are most extreme? (i.e. standardised residuals outside of [-2, 2])
results_children$stdres

# Plot critical area
x <- seq(0,30,length.out=200)
y <- dchisq(x, df = df_children)
plot(x, y, type = 'l')  # Plot probability density of the chi²-distribution
abline(v = results_children$statistic) # Plot value of chi²
g <- qchisq(.95, df = df_children)
i <- x >= g
polygon(c(g, x[i]),     # Plot the critical area (where H0 is rejected)
        c(0, y[i]),
        col='red')

#
# The smoking doctors (Doll & Hill, 1954)
#
doll_hill <- read.csv("doll_hill.csv")
contingency_table <- table(doll_hill)
n <- sum(contingency_table)
alpha <- 0.05

X2_doctors <- chisq.test(contingency_table, correct = FALSE)
g <- qchisq(1 - alpha, df = 1)

# Plot critical area
x <- seq(0,30,length.out=200)
y <- dchisq(x, df = 1)
plot(x, y, type = 'l')  # Plot probability density of the chi²-distribution
abline(v = X2_doctors$statistic)          # Plot value of chi²

i <- x >= g
polygon(c(g, x[i]),     # Plot the critical area (where H0 is rejected)
        c(0, y[i]),
        col='red')
