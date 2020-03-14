# The t-test

# We have a sample with
n <- 25      # sample size
sm <- 3.483  # sample mean
ss <- 0.55   # sample standard deviation
a <- 0.05    # significance level (selected by the researcher)
m0 <- 3.3    # hypothetical population mean (H0)

# Can we conclude from this sample that mu > 3.3?
# H0: mu = 3.3    -> null hypothesis, which we want to reject
# H1: mu > 3.3    -> alternative hypothesis to prove

#
# Method 1. Critical region
#
# What is the critical value for rejecting H0?
g <- m0 + qt(1-a, df = n-1) * ss / sqrt(n)

# If the resulting sample mean is below g, we cannot reject H0
if (sm < g) {
  print("H0 niet verwerpen")
} else {
  print("H0 verwerpen")
}

#
# Method 2. Probability Value
#
# What is the probability of obtaining this sample mean?
# P(M > sm) for a distribution M ~ T(m0, ss/sqrt(n), df=n-1)
p <- 1 - pt((sm - m0) / (ss/sqrt(n)), df = n-1)

# The resulting probability is very small, 
# smaller than the significance level
if(p < a) {
  print("Reject H0")
} else {
  print("Do not reject H0")
}

#
# Plot 
#

# boundary values of the plot (x values)
x <- seq(m0-4*ss/sqrt(n), m0+4*ss/sqrt(n), length=200)
# y-values (using the Gauss curve of the t-distribution)
dist <- dt((x-m0)/(ss/sqrt(n)), df = n-1) * ss/sqrt(n)
plot (x, dist, type = 'l', xlab = '', ylab = '')

# Plot the region of acceptance
i <- x <= g                    # x values left of g 
polygon(                       # plot these values
  c(x[i],    g,                              g),
  c(dist[i], dt((g-m0)/(ss/sqrt(n)),df=n-1), 0),
  col = 'lightgreen')

text(m0, 0.01, m0) # Hypothetical population mean
abline(v=m0)       #  -> Draw a vertical line

text(g+.025,.02,signif(g, digits=4)) # Show critical value

# Show the obtained sample mean using a vertical red line
abline(v=sm, col='red')
text(sm-.025, .005, sm, col = 'red')

text(m0, 0.02, 'region of acceptance (H0)')
