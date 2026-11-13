morning <- c(5, 8, 12, 15, 18, 22, 25, 28,
             33, 41, 47, 55)

evening <- c(10, 14, 18, 22, 25, 29, 33, 36,
             40, 44, 52, 58)

common_breaks <- seq(0, 60, by = 10)

hist_morning <- hist(morning,
                     breaks = common_breaks,
                     plot = FALSE)

hist_evening <- hist(evening,
                     breaks = common_breaks,
                     plot = FALSE)

# Create comparison table
comparison <- data.frame(
  Bin = c("0-10", "10-20", "20-30",
          "30-40", "40-50", "50-60"),
  Morning = hist_morning$counts,
  Evening = hist_evening$counts
)

comparison$Difference <- abs(comparison$Morning -
                               comparison$Evening)

print(comparison)

cat("Bin with the greatest difference:\n")
print(comparison[which.max(comparison$Difference), ])