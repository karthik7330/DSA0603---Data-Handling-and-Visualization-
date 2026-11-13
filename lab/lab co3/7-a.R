g1 <- c(60, 65, 70, 72, 75, 78, 80, 85)

g2 <- c(40, 50, 55, 58, 60, 62, 65, 70)

g3 <- c(70, 72, 75, 80, 82, 85, 90, 95)

# Calculate medians
median_g1 <- median(g1)
median_g2 <- median(g2)
median_g3 <- median(g3)

cat("Group 1 median:", median_g1, "\n")
cat("Group 2 median:", median_g2, "\n")
cat("Group 3 median:", median_g3, "\n")

# Compare medians
medians <- c(median_g1, median_g2, median_g3)

cat("Lowest median:", min(medians), "\n")
cat("Group with lowest median:",
    names(which.min(medians)), "\n")