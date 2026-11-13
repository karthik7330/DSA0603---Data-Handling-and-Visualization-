nz <- c(48, 50, 51, 52, 53, 54, 55, 56,
        57, 58, 59, 60, 62, 64, 66)

income <- c(20, 22, 23, 24, 25, 25, 26, 28,
            30, 32, 35, 40, 48, 60, 85)

# Q-Q plots
par(mfrow = c(1, 2))

qqnorm(nz,
       main = "NZ Q-Q Plot")

qqline(nz, col = "red", lwd = 2)

qqnorm(income,
       main = "Income Q-Q Plot")

qqline(income, col = "red", lwd = 2)

par(mfrow = c(1, 1))

# Shapiro-Wilk tests
cat("Normality test for NZ:\n")
print(shapiro.test(nz))

cat("Normality test for Income:\n")
print(shapiro.test(income))

# Compare means and medians
cat("NZ mean:", mean(nz), "\n")
cat("NZ median:", median(nz), "\n")

cat("Income mean:", mean(income), "\n")
cat("Income median:", median(income), "\n")

# Log transformation for positively skewed income
log_income <- log(income)

cat("Normality test after log transformation:\n")
print(shapiro.test(log_income))

qqnorm(log_income,
       main = "Q-Q Plot of Log-Transformed Income",
       col = "blue")

qqline(log_income, col = "red", lwd = 2)

cat("The Q-Q plot should be supported by a normality test.\n")
cat("The income distribution contains high values and positive skewness.\n")
cat("A log transformation can be considered before further analysis.\n")