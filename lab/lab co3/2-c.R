set.seed(1)

x_norm <- rnorm(100, 50, 10)

x_skew <- rexp(100, 1/10)

# Display normal data Q-Q plot
par(mfrow = c(1, 2))

qqnorm(x_norm,
       main = "Q-Q Plot of Normal Data",
       col = "blue")

qqline(x_norm, col = "red", lwd = 2)

# Display skewed data Q-Q plot
qqnorm(x_skew,
       main = "Q-Q Plot of Skewed Data",
       col = "darkgreen")

qqline(x_skew, col = "red", lwd = 2)

par(mfrow = c(1, 1))

# Shapiro-Wilk normality tests
cat("Normal data Shapiro-Wilk Test:\n")
print(shapiro.test(x_norm))

cat("Skewed data Shapiro-Wilk Test:\n")
print(shapiro.test(x_skew))

cat("Conclusion:\n")
cat("x_norm is expected to approximately follow a normal distribution.\n")
cat("x_skew is positively skewed and departs from normality.\n")