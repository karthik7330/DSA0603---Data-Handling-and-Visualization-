income <- c(20, 22, 23, 24, 25, 25, 26, 28,
            30, 32, 35, 40, 48, 60, 85)

# Calculate mean and median
mean_income <- mean(income)
median_income <- median(income)

cat("Income values:\n")
print(income)

cat("Mean income:", mean_income, "\n")
cat("Median income:", median_income, "\n")

# Histogram with density curve
hist(income,
     freq = FALSE,
     main = "Income Distribution",
     xlab = "Income (Thousands)",
     ylab = "Density",
     col = "lightblue",
     border = "black")

# Add density curve
lines(density(income),
      col = "blue",
      lwd = 2)

# Mean line
abline(v = mean_income,
       col = "red",
       lwd = 2,
       lty = 2)

# Median line
abline(v = median_income,
       col = "darkgreen",
       lwd = 2,
       lty = 3)

legend("topright",
       legend = c("Density", "Mean", "Median"),
       col = c("blue", "red", "darkgreen"),
       lwd = 2,
       lty = c(1, 2, 3))