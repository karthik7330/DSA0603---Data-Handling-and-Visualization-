y <- c(2.1, 2.4, 2.5, 2.7, 3.0, 3.1, 3.3, 3.4,
       3.8, 4.1, 4.3, 4.5, 4.6, 4.8, 5.0, 5.2)

default_bw <- bw.nrd0(y)

half_bw <- default_bw / 2
double_bw <- default_bw * 2

cat("Default bandwidth:", default_bw, "\n")
cat("Half bandwidth:", half_bw, "\n")
cat("Double bandwidth:", double_bw, "\n")

# Calculate density curves
d_half <- density(y, bw = half_bw)
d_default <- density(y, bw = default_bw)
d_double <- density(y, bw = double_bw)

# Plot comparison
plot(d_half,
     main = "Effect of Bandwidth on Density",
     xlab = "Values",
     ylab = "Density",
     col = "red",
     lwd = 2,
     ylim = c(0, max(d_half$y,
                     d_default$y,
                     d_double$y)))

lines(d_default, col = "blue", lwd = 2)
lines(d_double, col = "darkgreen", lwd = 2)

legend("topright",
       legend = c("Half bandwidth",
                  "Default bandwidth",
                  "Double bandwidth"),
       col = c("red", "blue", "darkgreen"),
       lwd = 2)