nz <- c(48, 50, 51, 52, 53, 54, 55, 56,
        57, 58, 59, 60, 62, 64, 66)

income <- c(20, 22, 23, 24, 25, 25, 26, 28,
            30, 32, 35, 40, 48, 60, 85)

# Generate Q-Q plots
par(mfrow = c(1, 2))

qqnorm(nz, main = "NZ Normality")
qqline(nz, col = "red", lwd = 2)

qqnorm(income, main = "Income Normality")
qqline(income, col = "red", lwd = 2)

par(mfrow = c(1, 1))

# Calculate correlations
cor_nz <- cor(sort(nz), qnorm(ppoints(length(nz))))

cor_income <- cor(sort(income),
                  qnorm(ppoints(length(income))))

cat("NZ correlation:", cor_nz, "\n")
cat("Income correlation:", cor_income, "\n")

cat("NZ is expected to show points approximately along the reference line.\n")
cat("Income is expected to show departure from the line in the upper tail.\n")
cat("Income is the vector that departs more clearly from normality.\n")