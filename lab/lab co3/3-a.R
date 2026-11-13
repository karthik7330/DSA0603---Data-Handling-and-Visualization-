wait <- c(54, 60, 62, 65, 68, 70, 71, 74,
          75, 78, 80, 82, 85, 88, 92)

# Summary
summary(wait)

# Histogram with bins of width 5
hist(wait,
     breaks = seq(50, 95, by = 5),
     main = "Customer Waiting Times",
     xlab = "Waiting Time (Minutes)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")