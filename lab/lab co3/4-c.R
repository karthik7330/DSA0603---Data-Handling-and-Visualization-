y <- c(2.1, 2.4, 2.5, 2.7, 3.0, 3.1, 3.3, 3.4,
       3.8, 4.1, 4.3, 4.5, 4.6, 4.8, 5.0, 5.2)

default_bw <- bw.nrd0(y)

cat("Half bandwidth:", default_bw / 2, "\n")
cat("Default bandwidth:", default_bw, "\n")
cat("Double bandwidth:", default_bw * 2, "\n")

# Compare the three density curves
plot(density(y, bw = default_bw / 2),
     main = "Bandwidth Evaluation",
     xlab = "Values",
     col = "red",
     lwd = 2)

lines(density(y, bw = default_bw),
      col = "blue",
      lwd = 2)

lines(density(y, bw = default_bw * 2),
      col = "darkgreen",
      lwd = 2)

legend("topright",
       legend = c("Too small", "Default", "Too large"),
       col = c("red", "blue", "darkgreen"),
       lwd = 2)

cat("A very small bandwidth produces a rough curve.\n")
cat("A very large bandwidth oversmooths the distribution.\n")
cat("The default bandwidth is recommended as a balanced choice.\n")