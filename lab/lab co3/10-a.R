library(readxl)
# Import dataset
orders <- read_excel(file.choose(), sheet = "Orders")

# Display Profit summary
summary(orders$Profit)

# Create bins of width 500
lower_limit <- floor(min(orders$Profit, na.rm = TRUE) / 500) * 500
upper_limit <- ceiling(max(orders$Profit, na.rm = TRUE) / 500) * 500

profit_breaks <- seq(lower_limit, upper_limit, by = 500)

# Calculate histogram frequencies
profit_hist <- hist(orders$Profit,
                    breaks = profit_breaks,
                    plot = FALSE)

# Display bin counts
bin_results <- data.frame(
  Bin_Start = profit_hist$breaks[-length(profit_hist$breaks)],
  Bin_End = profit_hist$breaks[-1],
  Frequency = profit_hist$counts
)

print(bin_results)

# Identify tallest bin
tallest_bin <- bin_results[which.max(bin_results$Frequency), ]

cat("Tallest Profit Bin:\n")
print(tallest_bin)

# Draw histogram
hist(orders$Profit,
     breaks = profit_breaks,
     main = "Histogram of Profit",
     xlab = "Profit",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")