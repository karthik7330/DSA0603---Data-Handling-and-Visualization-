jan <- c(24, 25, 26, 26, 27, 28)

apr <- c(30, 32, 33, 34, 35, 36)

jul <- c(28, 29, 30, 30, 31, 33)

oct <- c(26, 27, 28, 29, 29, 30)

months <- list(jan, apr, jul, oct)

month_names <- c("January", "April", "July", "October")

# Set plot layout
plot(0, 0,
     type = "n",
     xlim = c(20, 40),
     ylim = c(0.5, 4.5),
     yaxt = "n",
     xlab = "Temperature (°C)",
     ylab = "Months",
     main = "Ridgeline Plot of Monthly Temperatures")

axis(2, at = 1:4,
     labels = month_names,
     las = 1)

# Draw density curves with slight overlap
for (i in 1:4) {
  
  d <- density(months[[i]],
               from = 20,
               to = 40)
  
  # Scale density height
  scaled_density <- d$y / max(d$y) * 0.65
  
  polygon(c(d$x, rev(d$x)),
          c(i + scaled_density,
            rep(i, length(d$x))),
          col = c("lightblue", "lightgreen",
                  "lightpink", "lightyellow")[i],
          border = "black")
  
  lines(d$x, i + scaled_density,
        lwd = 2)
}