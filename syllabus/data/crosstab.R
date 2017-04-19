# Contingency table example: appreciation of products between
# women and men.
# 
# Source: http://www.cyclismo.org/tutorial/R/tables.html#creating-a-table-directly

# Construct the contingency table. This would normally be calculated 
# from the frequencies of ordinal/nominal variables, e.g.
# table(observations$appreciation, observations$gender)

appreciation_m <- matrix(c(9,8,5,0,8,10,5,4), ncol = 2)
rownames(appreciation_m) <- 
  c("Good", "Sufficient", "Insufficient", "Bad")
colnames(appreciation_m) <- c("Women", "Men")
appreciations <- as.table(appreciation_m)

# Calculate marginal totals:
margin.table(appreciations, 1)  # Row totals
margin.table(appreciations, 2)  # Column totals
margin.table(appreciations)     # General total (# observatios)

# Percentages w.r.t. row totals
prop.table(appreciations, 2)

# Calculation of chi-squared, the hard way
# Expected values (calculated with matrix product)
expected <- as.array(margin.table(appreciations,1)) %*%
  t(as.array(margin.table(appreciations,2))) / 
  margin.table(appreciations)
# Squared differences, normalised
differences <- (appreciations - expected) ^ 2 / expected
# Chi-square:
sum(differences)

# Direct calculation chi-square
summ <- summary(appreciations)
chi_sq <- summ$statistic

# Cramér's V
k <- min(nrow(appreciations), ncol(appreciations))
V <- sqrt(chi_sq/
            (margin.table(appreciations) *
               (k - 1)))
