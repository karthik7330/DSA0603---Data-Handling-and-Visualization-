morning <- c(5, 8, 12, 15, 18, 22, 25, 28,
             33, 41, 47, 55)

evening <- c(10, 14, 18, 22, 25, 29, 33, 36,
             40, 44, 52, 58)

# Use identical breaks
common_breaks <- seq(0, 60, by = 10)

# Calculate histograms
hist_morning <- hist(morning,
                     breaks = common_breaks,
                     plot = FALSE)

hist_evening <- hist(evening,
                     breaks = common_breaks,
                     plot = FALSE)

# Draw overlapping histograms
hist(morning,
     breaks = common_breaks,
     col = rgb(0, 0, 1, 0.4),
     main = "Morning and Evening Histograms",
     xlab = "Values",
     ylab = "Frequency",
     ylim = c(0, max(hist_morning$counts,
                     hist_evening$counts)))

hist(evening,
     breaks = common_breaks,
     col = rgb(1, 0, 0, 0.4),
     add = TRUE)

legend("topright",
       legend = c("Morning", "Evening"),
       fill = c(rgb(0, 0, 1, 0.4),
                rgb(1, 0, 0, 0.4)))