jan <- c(24, 25, 26, 26, 27, 28)

apr <- c(30, 32, 33, 34, 35, 36)

jul <- c(28, 29, 30, 30, 31, 33)

oct <- c(26, 27, 28, 29, 29, 30)

# Calculate monthly means
monthly_means <- c(
  January = mean(jan),
  April = mean(apr),
  July = mean(jul),
  October = mean(oct)
)

cat("Monthly mean temperatures:\n")
print(monthly_means)

cat("Hottest month:",
    names(which.max(monthly_means)), "\n")

cat("Highest mean temperature:",
    max(monthly_means), "degrees Celsius\n")