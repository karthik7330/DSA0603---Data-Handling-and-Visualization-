marks <- c(65, 70, 72, 75, 78, 80, 82, 85, 88, 90, 92, 95)

# Compare histogram bin counts
hist3 <- hist(marks, breaks = 3, plot = FALSE)
hist6 <- hist(marks, breaks = 6, plot = FALSE)
hist12 <- hist(marks, breaks = 12, plot = FALSE)

cat("Counts for 3 breaks:\n")
print(hist3$counts)

cat("Counts for 6 breaks:\n")
print(hist6$counts)

cat("Counts for 12 breaks:\n")
print(hist12$counts)

# Compare bandwidths
default_bw <- bw.nrd0(marks)

cat("Default bandwidth:", default_bw, "\n")
cat("Small bandwidth:", 2, "\n")
cat("Large bandwidth:", 10, "\n")

# Recommended bandwidth and histogram
recommended_bw <- default_bw

hist(marks, breaks = 6,
     main = "Recommended Histogram",
     xlab = "Marks",
     col = "lightblue",
     border = "black")

lines(density(marks, bw = recommended_bw),
      col = "red", lwd = 2)

cat("Recommended histogram: 6 breaks\n")
cat("Recommended bandwidth:", recommended_bw, "\n")
cat("Reason: 3 breaks may hide details, while 12 breaks may create irregular bins.\n")
cat("The default bandwidth provides a balanced density curve.\n")