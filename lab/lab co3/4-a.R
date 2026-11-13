y <- c(2.1, 2.4, 2.5, 2.7, 3.0, 3.1, 3.3, 3.4,
       3.8, 4.1, 4.3, 4.5, 4.6, 4.8, 5.0, 5.2)

# Calculate default bandwidth
default_bw <- bw.nrd0(y)

cat("Default bandwidth:", default_bw, "\n")

# Density calculation
density_y <- density(y, bw = default_bw)

# Density plot
plot(density_y,
     main = "Density Plot of Y",
     xlab = "Values",
     ylab = "Density",
     col = "blue",
     lwd = 2)

# Add rug
rug(y, col = "red")