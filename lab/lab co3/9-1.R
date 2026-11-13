nz <- c(48, 50, 51, 52, 53, 54, 55, 56,
        57, 58, 59, 60, 62, 64, 66)

income <- c(20, 22, 23, 24, 25, 25, 26, 28,
            30, 32, 35, 40, 48, 60, 85)

# Q-Q plots
par(mfrow = c(1, 2))

qqnorm(nz,
       main = "Q-Q Plot of NZ",
       col = "blue")

qqline(nz, col = "red", lwd = 2)

qqnorm(income,
       main = "Q-Q Plot of Income",
       col = "darkgreen")

qqline(income, col = "red", lwd = 2)

par(mfrow = c(1, 1))

# Calculate theoretical normal quantiles
theoretical_nz <- qnorm(ppoints(length(nz)))
theoretical_income <- qnorm(ppoints(length(income)))

# Sort observations
sorted_nz <- sort(nz)
sorted_income <- sort(income)

# Correlation calculations
cor_nz <- cor(sorted_nz, theoretical_nz)

cor_income <- cor(sorted_income,
                  theoretical_income)

cat("Correlation for NZ:", cor_nz, "\n")
cat("Correlation for Income:", cor_income, "\n")