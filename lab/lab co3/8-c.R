jan <- c(24, 25, 26, 26, 27, 28)

apr <- c(30, 32, 33, 34, 35, 36)

jul <- c(28, 29, 30, 30, 31, 33)

oct <- c(26, 27, 28, 29, 29, 30)

months <- list(
  January = jan,
  April = apr,
  July = jul,
  October = oct
)

# Calculate means
monthly_means <- sapply(months, mean)

cat("Monthly means:\n")
print(monthly_means)

par(mfrow = c(1, 2))

# Boxplots
boxplot(months,
        main = "Monthly Temperature Boxplots",
        xlab = "Months",
        ylab = "Temperature (°C)",
        col = c("lightblue", "lightgreen",
                "lightpink", "lightyellow"))

# Ridgeline plot
plot(0, 0,
     type = "n",
     xlim = c(20, 40),
     ylim = c(0.5, 4.5),
     yaxt = "n",
     xlab = "Temperature (°C)",
     ylab = "Months",
     main = "Monthly Ridgeline Plot")

axis(2, at = 1:4,
     labels = names(months),
     las = 1)

for (i in 1:4) {
  
  d <- density(months[[i]],
               from = 20,
               to = 40)
  
  scaled_density <- d$y / max(d$y) * 0.65
  
  polygon(c(d$x, rev(d$x)),
          c(i + scaled_density,
            rep(i, length(d$x))),
          col = "lightblue",
          border = "black")
}

par(mfrow = c(1, 1))

cat("Ridgeline plots compare the shapes and locations of distributions.\n")
cat("Boxplots provide clearer medians and quartiles.\n")
cat("For these small samples, boxplots with individual observations are more reliable.\n")