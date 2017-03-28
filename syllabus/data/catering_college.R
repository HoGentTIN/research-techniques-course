# Case restaurant visits - Bivariate analysis

library(dplyr)

# Load data from an SPSS .sav file
library(foreign)
resto <- read.spss("catering_college.sav", to.data.frame = TRUE)
attach(resto)

# 
# What's the number of days per week that people go to the restaurant?
#
summary(Bezoek)  # Average, median, quantiles, ...

# Box plot, shows the dispersion of the data
boxplot(Bezoek, horizontal = TRUE)

# Frequency table (crosstab)
visits_frq <- table(Bezoek)

# Bar chart with labels
visits_plot <- barplot(visits_frq,
        main = "Restaurant visits",
        xlab = "Number of days per week",
        ylab = "Frequency",
        ylim = c(0, 16))
text(x = visits_plot, 
     y = visits_frq + 1,
     labels = as.character(visits_frq))

#
# Is there a difference in spending between students and staff?
#

# Group the data by customer type (Klanttype), then calculate average amount
# spent (Bedrag). This uses the `dplyr` package that a.o. provides the "%>%"
# operator, which is similar to a Bash pipe.
amount_type <- resto %>%
  group_by(Klanttype) %>%
  summarize_each(funs(mean(., na.rm=T)), Bedrag)

# Bar chart of averages
amount_type_plot <- barplot(
  amount_type$Bedrag, 
  main = 'Average amount spent per customer type',
  names = c('student', 'staff'), # Should be "amount_type$Klanttype", but that's in Dutch...
  ylim = c(0, 15))
text(x = amount_type_plot, 
     y = amount_type$Bedrag + 1,
     labels = as.character(amount_type$Bedrag))

# Box plot
boxplot(Bedrag ~ Klanttype, horizontal = T)

#
# Is there a difference in the appreciation of the basic product range
# (Keuze_basis) between men and women (Geslacht)?
# In other words, is there a link between gender (Geslacht) and the appreciation?
#
appreciation_gender_xtab <- table(Geslacht, Keuze_basis)
summary(appreciation_gender_xtab)

# Plot of the frequency table. The frequencies of each category are represented
# by rectangles with a size that is proportional w.r.t. the relative frequency.
plot(appreciation_gender_xtab,
     main = "Appreciation basic prodect range by gender",
     xlab = "Gender",
     ylab = "Appreciation basic prodect range")

# Bar chart for the same data
appreciation_gender_plot <- barplot(
  appreciation_gender_xtab, 
  col = c('grey60', 'grey90'),
  beside = TRUE, 
  legend = TRUE)
text(x = appreciation_gender_plot, 
     y = 1,
     labels = appreciation_gender_xtab)

# A stacked percentage bar plot for the same data. The data is grouped by
# gender now (by transposing the contingency table with t()), and values
# are scaled to 100% (with prop.table)
appreciation_gender_props <- prop.table(t(appreciation_gender_xtab),2)
barplot(
  appreciation_gender_props,
  xlim = c(0, ncol(appreciation_gender_props) + 1.5),
  legend.text = T,
  args.legend = list(
    x = ncol(appreciation_gender_props) + 1.5,
    y = max(colSums(appreciation_gender_props))
  ))
# A simpler version of this plot (where the legend overlaps with the chart):
# barplot(appreciation_gender_props, legend.text = T)

#
# Is there a link between the number of visits and the total amount spent?
#
plot(Bezoek, Bedrag)
visits_amount_lm <- lm(Bedrag ~ Bezoek)  # Linear model
abline(visits_amount_lm, col='red')      # Regression line
