marks <- c(65, 70, 72, 75, 78, 80, 82, 85, 88, 90, 92, 95)

# Default bandwidth
default_bw <- bw.nrd0(marks)
cat("Default bandwidth:", default_bw, "\n")

# Density with bandwidth = 2
density_small <- density(marks, bw = 2)

# Density with default bandwidth
density_default <- density(marks)

# Density with bandwidth = 10
density_large <- density(marks, bw = 10)

# Plot all density curves
plot(density_small,
     main = "Density Curves with Different Bandwidths",
     xlab = "Marks",
     col = "red",
     lwd = 2,
     ylim = c(0, max(density_small$y,
                     density_default$y,
                     density_large$y)))

lines(density_default, col = "blue", lwd = 2)
lines(density_large, col = "darkgreen", lwd = 2)

legend("topright",
       legend = c("bw = 2", "Default bandwidth", "bw = 10"),
       col = c("red", "blue", "darkgreen"),
       lwd = 2)