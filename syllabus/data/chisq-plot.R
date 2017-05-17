# Chi-squared distribution plot for some values of df

degf <- c(10:1)
x <- seq(0, 20, length=100)
colors <- heat.colors(length(degf))
legend_labels <- c('')

plot(x, dchisq(x, 1), 
     type = 'l',
     ylim = c(0, .6),
     col= colors[1],
     main = 'Chi-square distribution',
     ylab = 'density')

for (i in degf) {
  lines(x, dchisq(x, i), type = 'l',
        col=colors[i])
  legend_labels[i] <- paste("df =", i)
  abline(v = qchisq(.95, df = i),
         col = colors[i])
}
legend("topright", inset=.005,
       legend_labels,
       lty=1, lwd=2,
       y.intersp = 0.1,
       cex = 0.6,
       bty = 'n',
       col=colors)
