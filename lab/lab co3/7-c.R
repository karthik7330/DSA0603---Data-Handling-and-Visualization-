g1 <- c(60, 65, 70, 72, 75, 78, 80, 85)

g2 <- c(40, 50, 55, 58, 60, 62, 65, 70)

g3 <- c(70, 72, 75, 80, 82, 85, 90, 95)

groups <- list(g1, g2, g3)

# Violin plot with individual observations
plot(0, 0,
     type = "n",
     xlim = c(0.5, 3.5),
     ylim = range(c(g1, g2, g3)),
     xaxt = "n",
     xlab = "Groups",
     ylab = "Values",
     main = "Violin Plot with Individual Data Points")

axis(1, at = 1:3,
     labels = c("Group 1", "Group 2", "Group 3"))

for (i in 1:3) {
  
  d <- density(groups[[i]], cut = 0)
  d$y <- d$y / max(d$y) * 0.3
  
  polygon(c(i - d$y, rev(i + d$y)),
          c(d$x, rev(d$x)),
          col = "lightblue",
          border = "black")
  
  # Add actual observations
  points(rep(i, length(groups[[i]])),
         groups[[i]],
         pch = 16,
         col = "darkblue")
  
  # Add median
  points(i, median(groups[[i]]),
         pch = 19,
         col = "red",
         cex = 1.4)
}

cat("Each group contains only 8 observations.\n")
cat("The violin density may be sensitive to bandwidth selection.\n")
cat("Individual data points and a boxplot should be added for better reliability.\n")