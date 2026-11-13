marks <- c(65, 70, 72, 75, 78, 80, 82, 85, 88, 90, 92, 95)

# Summary statistics
summary(marks)

# Standard deviation
sd(marks)

# Five-number summary
fivenum(marks)

# Three histograms side by side
par(mfrow = c(1, 3))

hist(marks, breaks = 3,
     main = "Histogram - 3 Breaks",
     xlab = "Marks",
     col = "lightblue",
     border = "black")

hist(marks, breaks = 6,
     main = "Histogram - 6 Breaks",
     xlab = "Marks",
     col = "lightgreen",
     border = "black")

hist(marks, breaks = 12,
     main = "Histogram - 12 Breaks",
     xlab = "Marks",
     col = "lightpink",
     border = "black")

par(mfrow = c(1, 1))