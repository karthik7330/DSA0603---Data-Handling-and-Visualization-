classA <- c(65, 68, 70, 72, 74, 75, 78, 80, 82, 85)

classB <- c(72, 74, 76, 78, 80, 82, 84, 86, 88, 90)

classC <- c(60, 62, 68, 70, 75, 78, 80, 82, 85, 88)

# Combine the three classes
class_data <- list(
  ClassA = classA,
  ClassB = classB,
  ClassC = classC
)

# Boxplot
boxplot(class_data,
        main = "Marks Distribution of Three Classes",
        xlab = "Classes",
        ylab = "Marks",
        col = c("lightblue", "lightgreen", "lightpink"))

# Five-number summaries using boxplot statistics
stats_A <- boxplot(classA, plot = FALSE)$stats
stats_B <- boxplot(classB, plot = FALSE)$stats
stats_C <- boxplot(classC, plot = FALSE)$stats

cat("Class A Five Numbers:\n")
print(stats_A)

cat("Class B Five Numbers:\n")
print(stats_B)

cat("Class C Five Numbers:\n")
print(stats_C)