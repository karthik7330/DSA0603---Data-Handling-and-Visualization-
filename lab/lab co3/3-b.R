wait <- c(54, 60, 62, 65, 68, 70, 71, 74,
          75, 78, 80, 82, 85, 88, 92)

# Number of classes using Sturges rule
sturges_classes <- nclass.Sturges(wait)

cat("Number of classes suggested by Sturges rule:",
    sturges_classes, "\n")

# Bin width 5
hist_width5 <- hist(wait,
                    breaks = seq(50, 95, by = 5),
                    plot = FALSE)

cat("Counts for bin width 5:\n")
print(hist_width5$counts)

# Bin width 10
hist_width10 <- hist(wait,
                     breaks = seq(50, 100, by = 10),
                     plot = FALSE)

cat("Counts for bin width 10:\n")
print(hist_width10$counts)