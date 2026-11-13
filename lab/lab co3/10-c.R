# Calculate mean and median Profit
mean_profit <- mean(orders$Profit, na.rm = TRUE)
median_profit <- median(orders$Profit, na.rm = TRUE)

cat("Mean Profit:", mean_profit, "\n")
cat("Median Profit:", median_profit, "\n")

# Calculate quartiles
profit_quartiles <- quantile(
  orders$Profit,
  probs = c(0.25, 0.50, 0.75),
  na.rm = TRUE
)

cat("Profit Quartiles:\n")
print(profit_quartiles)

# Boxplot to identify extreme values
boxplot(orders$Profit,
        main = "Profit and Outlier Analysis",
        ylab = "Profit",
        col = "lightblue")

# Compare mean and median
if (mean_profit > median_profit) {
  cat("Profit distribution may be positively skewed.\n")
} else if (mean_profit < median_profit) {
  cat("Profit distribution may be negatively skewed.\n")
} else {
  cat("Mean and median are approximately equal.\n")
}

cat("Recommended summary: Median Profit\n")