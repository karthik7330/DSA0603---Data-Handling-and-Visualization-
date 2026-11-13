income <- c(20, 22, 23, 24, 25, 25, 26, 28,
            30, 32, 35, 40, 48, 60, 85)

# Calculate mean
mean_income <- mean(income)

# Calculate second central moment
m2 <- mean((income - mean_income)^2)

# Calculate third central moment
m3 <- mean((income - mean_income)^3)

# Calculate skewness
skewness <- m3 / (m2^(1.5))

cat("Mean:", mean_income, "\n")
cat("Second central moment (m2):", m2, "\n")
cat("Third central moment (m3):", m3, "\n")
cat("Skewness:", skewness, "\n")

# Identify skewness direction
if (skewness > 0) {
  cat("Distribution is positively skewed.\n")
} else if (skewness < 0) {
  cat("Distribution is negatively skewed.\n")
} else {
  cat("Distribution is approximately symmetric.\n")
}