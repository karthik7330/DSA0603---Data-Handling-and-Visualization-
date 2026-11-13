library(dplyr)
library(ggplot2)

data(airquality)

# Count missing values in each column
missing_count <- colSums(is.na(airquality))

cat("Missing Values in Each Column:\n")
print(missing_count)

# Calculate median Ozone
ozone_median <- median(
  airquality$Ozone,
  na.rm = TRUE
)

# Impute missing Ozone values
airquality$Ozone_Imputed <- ifelse(
  is.na(airquality$Ozone),
  ozone_median,
  airquality$Ozone
)

# Convert data into long format for comparison
density_data <- data.frame(
  Value = c(
    airquality$Ozone,
    airquality$Ozone_Imputed
  ),
  Type = rep(
    c("Original Ozone", "Imputed Ozone"),
    each = nrow(airquality)
  )
)

ggplot(
  density_data,
  aes(x = Value, colour = Type)
) +
  geom_density(linewidth = 1) +
  labs(
    title = "Density Comparison of Original and Imputed Ozone",
    x = "Ozone",
    y = "Density",
    colour = "Data Type"
  ) +
  theme_minimal()