maths <- c(30, 32, 35, 38, 40, 75, 78, 80, 82, 85)

science <- c(55, 58, 60, 60, 62, 63, 65, 65, 68, 70)

# Display values
cat("Maths values:\n")
print(maths)

cat("Science values:\n")
print(science)

# Boxplot
par(mfrow = c(1, 2))

boxplot(maths, science,
        names = c("Maths", "Science"),
        main = "Boxplot Comparison",
        ylab = "Marks",
        col = c("lightblue", "lightgreen"))

# Density plot
maths_density <- density(maths)
science_density <- density(science)

plot(maths_density,
     main = "Density Plot Comparison",
     xlab = "Marks",
     col = "red",
     lwd = 2,
     xlim = range(c(maths, science)))

lines(science_density,
      col = "blue",
      lwd = 2)

legend("topright",
       legend = c("Maths", "Science"),
       col = c("red", "blue"),
       lwd = 2)

par(mfrow = c(1, 1))