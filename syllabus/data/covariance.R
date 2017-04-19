# Covariance

families <- read.csv('families.txt', sep='')

plot(families)
abline(v = mean(families$x))
abline(h = mean(families$y))

cov(families$x, families$y)
# cov = 2 => increasing/direct relationship
cor(families$x, families$y, method = 'pearson')
# R = 0.7533708 => 

families2 <- read.csv('families2.txt', sep='')

plot(families2)
abline(v = mean(families2$x))
abline(h = mean(families2$y))

cov(families2$x, families2$y)
# cov = -3.225, decreasing/inverse relationship