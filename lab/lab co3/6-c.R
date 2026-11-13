g1 <- c(60, 65, 70, 72, 75, 78, 80, 85)

g2 <- c(40, 50, 55, 58, 60, 62, 65, 70)

g3 <- c(70, 72, 75, 80, 82, 85, 90, 95)

groups <- list(g1, g2, g3)

group_names <- c("Group 1", "Group 2", "Group 3")

# Calculate common plotting range
all_values <- c(g1, g2, g3)

plot(0, 0,
     type = "n",
     xlim = c(0.5, 3.5),
     ylim = range(all_values),
     xaxt = "n",
     xlab = "Groups",
     ylab = "Values",
     main = "Violin Plot of Three Groups")

axis(1, at = 1:3, labels = group_names)

# Draw violin polygons
for (i in 1:3) {
  
  d <- density(groups[[i]], cut = 0)
  
  # Normalize density width
  d$y <- d$y / max(d$y) * 0.35
  
  polygon(c(i - d$y, rev(i + d$y)),
          c(d$x, rev(d$x)),
          col = c("lightblue", "lightgreen",
                  "lightpink")[i],
          border = "black")
  
  # Add median point
  points(i, median(groups[[i]]),
         pch = 19,
         col = "red",
         cex = 1.3)
}

legend("topright",
       legend = c("Group 1", "Group 2", "Group 3",
                  "Median"),
       fill = c("lightblue", "lightgreen",
                "lightpink", NA),
       pch = c(NA, NA, NA, 19),
       col = c("black", "black", "black", "red"))