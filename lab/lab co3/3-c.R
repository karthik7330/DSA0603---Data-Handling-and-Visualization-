wait <- c(54, 60, 62, 65, 68, 70, 71, 74,
          75, 78, 80, 82, 85, 88, 92)

# Width 5 histogram
hist(wait,
     breaks = seq(50, 95, by = 5),
     main = "Waiting Times - Bin Width 5",
     xlab = "Waiting Time",
     col = "lightblue")

# Width 10 histogram
hist(wait,
     breaks = seq(50, 100, by = 10),
     main = "Waiting Times - Bin Width 10",
     xlab = "Waiting Time",
     col = "lightgreen")

# Compare the bin counts
count5 <- hist(wait, breaks = seq(50, 95, by = 5),
               plot = FALSE)$counts

count10 <- hist(wait, breaks = seq(50, 100, by = 10),
                plot = FALSE)$counts

cat("Width 5 counts:\n")
print(count5)

cat("Width 10 counts:\n")
print(count10)

cat("Evaluation:\n")
cat("Width 5 shows more detail in the waiting-time distribution.\n")
cat("Width 10 combines observations into broader groups.\n")
cat("Recommended bin width: 5 minutes.\n")