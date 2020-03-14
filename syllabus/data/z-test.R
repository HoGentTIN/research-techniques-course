# The z-test

# We have a sample with
n <- 30      # sample size
sm <- 3.483  # sample mean
s <- 0.55    # standard deviation (assumed to be known)
a <- 0.05    # significance level (selected by the researcher)
m0 <- 3.3    # hypothetical population mean (H0)

# Can we conclude from this sample that mu > 3.3?
# H0: mu = 3.3    -> null hypothesis, which we want to reject
# H1: mu > 3.3    -> alternative hypothesis to prove

#
# Method 1. Probability Value
#
# What is the probability of obtaining this sample mean?
# P(M > sm) for a distribution M ~ Nor(m0, s/sqrt(n))
p <- 1 - pnorm(sm, m0, s/sqrt(n))  # => 0.03419546

# The resulting probability is very small, 
# smaller than the significance level
if(p < a) {
  print("Reject H0")
} else {
  print("Do not reject H0")
}

#
# Method 2. Critical Region
#
# What is the critical value for rejecting H0?
g <- m0 + qnorm(1-a) * s / sqrt(n)

# If the resulting probability is below g, we cannot reject H0
if (sm < g) {
  print("Do not reject H0")
} else {
  print("Reject H0")
}

#
# Plot 
#

# boundary values of the plot (x values)
x <- seq(m0-4*s/sqrt(n), m0+4*s/sqrt(n), length=200)
# y-values (using a normal distribution)
dist <- dnorm(x, m0, s/sqrt(n))
plot (x, dist, type = 'l', xlab = '', ylab = '')

# Show the obtained sample mean using a vertical red line
abline(v=sm, col='red')
text(sm, 2, sm)

# Plot the region of acceptance
i <- x <= g                    # x values left of g 
polygon(                       # plot these values
  c(x[i],    g,                       g),
  c(dist[i], dnorm(g, m0, s/sqrt(n)), 0),
  col = 'lightgreen')
text(g,.5,signif(g, digits=4)) # show critical value

text(m0, 0.1, m0)              # Hypothetical population mean
abline(v=m0)                   #  -> Draw a vertical line

text(m0, 1.5, 'region of acceptance (H0)')
