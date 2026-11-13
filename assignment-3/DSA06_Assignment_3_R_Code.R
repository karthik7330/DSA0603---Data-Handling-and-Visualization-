# DSA06 - DATA HANDLING AND VISUALIZATION
# R Programming Lab - Assignment 3 (CO3)
# Title: Analyzing Patterns, Trends and Associations
#
# Install required packages once:
# install.packages(c("ggplot2", "patchwork", "corrplot", "Rtsne",
#                    "umap", "hexbin", "gapminder", "dplyr"))
#
# Then run this script section by section in RStudio.

# Load packages
library(ggplot2)
library(patchwork)
library(corrplot)
library(Rtsne)
library(umap)
library(hexbin)
library(gapminder)
library(dplyr)

# Load datasets
data(iris)
data(mtcars)
data(diamonds, package = "ggplot2")
data(AirPassengers)

# ============================================================
# Q1. ADVANCED DISTRIBUTION ANALYSIS (10 MARKS)
# ============================================================

# Q1(a) ECDF of Sepal.Length for each iris species
ggplot(iris, aes(x = Sepal.Length, colour = Species)) +
  stat_ecdf(linewidth = 1) +
  labs(title = "ECDF of Sepal Length by Iris Species",
       x = "Sepal Length (cm)", y = "Cumulative Probability",
       colour = "Species") +
  theme_minimal()

# Interpretation:
# The ECDF shows the proportion of observations at or below each
# sepal length. Species with curves farther to the right generally
# have larger sepal lengths.

# Q1(b) Compute skewness of diamond prices and show linear/log10 distributions
# Moment coefficient of skewness: mean((x - mean(x))^3) / sd(x)^3
price_values <- diamonds$price
price_values <- price_values[!is.na(price_values)]

price_skewness <- mean((price_values - mean(price_values))^3) /
                  (sd(price_values)^3)
cat("Skewness of diamond prices:", price_skewness, "\n")

p_linear <- ggplot(diamonds, aes(x = price)) +
  geom_histogram(bins = 60, fill = "steelblue", colour = "white") +
  labs(title = "Diamond Prices - Linear Scale",
       x = "Price", y = "Frequency") +
  theme_minimal()

p_log <- ggplot(diamonds, aes(x = price)) +
  geom_histogram(bins = 60, fill = "darkorange", colour = "white") +
  scale_x_log10() +
  labs(title = "Diamond Prices - Log10 Scale",
       x = "Price (log10 scale)", y = "Frequency") +
  theme_minimal()

p_linear + p_log

# Interpretation:
# A positive skewness indicates a long right tail with a few expensive
# diamonds. The log10 scale compresses high prices and reveals more detail.

# Q1(c) Normal Q-Q plot and Shapiro-Wilk test for mtcars mpg
qqnorm(mtcars$mpg,
       main = "Normal Q-Q Plot of mtcars Mileage",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(mtcars$mpg, col = "red", lwd = 2)

shapiro_result <- shapiro.test(mtcars$mpg)
print(shapiro_result)

# Interpretation:
# If Shapiro-Wilk p-value is below 0.05, reject the normality assumption.
# Points far from the reference line also indicate departures from normality.


# ============================================================
# Q2. ANALYZING ASSOCIATIONS BETWEEN VARIABLES (10 MARKS)
# ============================================================

# Q2(a) Scatterplot matrix of four numeric iris variables, coloured by species
iris_numeric <- iris[, 1:4]

# Base R pairs plot with species-specific colours
species_colours <- c("setosa" = "steelblue",
                     "versicolor" = "darkorange",
                     "virginica" = "darkgreen")
point_colours <- species_colours[as.character(iris$Species)]

pairs(iris_numeric,
      col = point_colours,
      pch = 19,
      main = "Scatterplot Matrix of Iris Measurements")

legend("topright",
       legend = names(species_colours),
       col = species_colours,
       pch = 19,
       cex = 0.8)

# Correlation matrix of the four numeric variables
iris_cor <- cor(iris_numeric)
print(round(iris_cor, 3))

# Interpretation:
# Correlations close to +1 indicate strong positive linear association.
# Petal measurements generally show strong positive relationships.

# Q2(b) Correlogram of mtcars: upper triangle and hierarchical clustering
mtcars_cor <- cor(mtcars)

corrplot(mtcars_cor,
         method = "color",
         type = "upper",
         order = "hclust",
         addCoef.col = "black",
         tl.col = "black",
         tl.srt = 45,
         number.cex = 0.55,
         title = "Hierarchically Clustered Correlogram of mtcars",
         mar = c(0, 0, 2, 0))

# Interpretation:
# The upper-triangle correlogram avoids duplicate correlations.
# Hierarchical clustering places variables with similar correlation
# patterns close together.


# ============================================================
# Q3. DIMENSION REDUCTION (10 MARKS)
# ============================================================

# Prepare and standardize iris measurements
iris_scaled <- scale(iris[, 1:4])

# Q3(a) Principal Component Analysis (PCA)
iris_pca <- prcomp(iris[, 1:4], center = TRUE, scale. = TRUE)

pca_scores <- data.frame(
  PC1 = iris_pca$x[, 1],
  PC2 = iris_pca$x[, 2],
  Species = iris$Species
)

# Plot first two principal components
ggplot(pca_scores, aes(x = PC1, y = PC2, colour = Species)) +
  geom_point(size = 2.5, alpha = 0.8) +
  labs(title = "PCA of Iris Measurements",
       x = "Principal Component 1",
       y = "Principal Component 2",
       colour = "Species") +
  theme_minimal()

# Scree plot
pca_variance <- iris_pca$sdev^2
variance_percent <- pca_variance / sum(pca_variance) * 100

scree_data <- data.frame(
  Component = factor(paste0("PC", 1:length(variance_percent)),
                     levels = paste0("PC", 1:length(variance_percent))),
  Variance = variance_percent
)

ggplot(scree_data, aes(x = Component, y = Variance)) +
  geom_col(fill = "steelblue") +
  geom_point(size = 2) +
  labs(title = "PCA Scree Plot",
       x = "Principal Component",
       y = "Percentage of Explained Variance") +
  theme_minimal()

cat("PCA variance explained (%):\n")
print(round(variance_percent, 2))

# Interpretation:
# PCA combines the original measurements into uncorrelated components.
# The first two components usually retain most of the variation and
# help visualize separation among iris species.

# Q3(b) t-SNE and UMAP 2D embeddings
set.seed(123)

tsne_result <- Rtsne(
  iris_scaled,
  dims = 2,
  perplexity = 30,
  check_duplicates = FALSE,
  pca = TRUE,
  verbose = FALSE
)

tsne_data <- data.frame(
  Dimension1 = tsne_result$Y[, 1],
  Dimension2 = tsne_result$Y[, 2],
  Species = iris$Species
)

p_tsne <- ggplot(tsne_data,
                 aes(x = Dimension1, y = Dimension2, colour = Species)) +
  geom_point(size = 2.5) +
  labs(title = "t-SNE Embedding of Iris",
       x = "t-SNE 1", y = "t-SNE 2", colour = "Species") +
  theme_minimal()

# UMAP
set.seed(123)
umap_config <- umap::umap.defaults
umap_config$n_neighbors <- 15
umap_config$min_dist <- 0.1

umap_result <- umap::umap(
  iris_scaled,
  config = umap_config
)

umap_data <- data.frame(
  Dimension1 = umap_result$layout[, 1],
  Dimension2 = umap_result$layout[, 2],
  Species = iris$Species
)

p_umap <- ggplot(umap_data,
                 aes(x = Dimension1, y = Dimension2, colour = Species)) +
  geom_point(size = 2.5) +
  labs(title = "UMAP Embedding of Iris",
       x = "UMAP 1", y = "UMAP 2", colour = "Species") +
  theme_minimal()

# PCA, t-SNE and UMAP comparison
p_pca <- ggplot(pca_scores, aes(x = PC1, y = PC2, colour = Species)) +
  geom_point(size = 2.5) +
  labs(title = "PCA", x = "PC1", y = "PC2") +
  theme_minimal()

p_pca + p_tsne + p_umap

# Interpretation:
# PCA preserves global linear variation, while t-SNE emphasizes local
# neighbourhoods and UMAP often preserves both local and some global structure.
# Embedding positions and orientations can vary between runs.


# ============================================================
# Q4. RELATIONSHIPS IN LARGE AND MULTIVARIATE DATA (10 MARKS)
# ============================================================

# Q4(a) Hexbin plot for all 53,940 diamonds
cat("Number of diamond records:", nrow(diamonds), "\n")

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(bins = 45) +
  scale_fill_viridis_c(name = "Number of diamonds") +
  labs(title = "Hexbin Plot: Diamond Carat vs Price",
       x = "Carat", y = "Price") +
  theme_minimal()

# Interpretation:
# Hexagonal bins show the concentration of observations.
# Price generally increases with carat, while dense regions indicate
# combinations of carat and price occurring frequently.

# Q4(b) Gapminder 2007 bubble chart
gapminder_2007 <- gapminder %>%
  filter(year == 2007)

ggplot(gapminder_2007,
       aes(x = gdpPercap,
           y = lifeExp,
           size = pop,
           colour = continent)) +
  geom_point(alpha = 0.7) +
  scale_x_log10() +
  scale_size(range = c(2, 16), name = "Population") +
  labs(title = "GDP per Capita vs Life Expectancy (2007)",
       x = "GDP per Capita (log10 scale)",
       y = "Life Expectancy (years)",
       colour = "Continent") +
  theme_minimal()

# Interpretation:
# The bubble chart compares economic status and life expectancy.
# Bubble size represents population and colour distinguishes continents.
# A general positive association can be observed between GDP per capita
# and life expectancy, although variation exists within continents.


# ============================================================
# Q5. TIME SERIES AND TRENDS (10 MARKS)
# ============================================================

# Q5(a) AirPassengers with 12-month centred moving average
ap <- AirPassengers

moving_average <- stats::filter(
  ap,
  filter = rep(1 / 12, 12),
  sides = 2
)

plot(ap,
     main = "AirPassengers with 12-Month Centred Moving Average",
     xlab = "Year",
     ylab = "Number of Passengers",
     col = "grey40",
     lwd = 1)

lines(moving_average,
      col = "red",
      lwd = 2)

legend("topleft",
       legend = c("AirPassengers", "12-month moving average"),
       col = c("grey40", "red"),
       lty = 1,
       lwd = c(1, 2))

# Interpretation:
# The moving average smooths short-term seasonal fluctuations.
# The upward movement indicates increasing passenger numbers over time.

# Q5(b) STL decomposition of log(AirPassengers), then plot detrended series
log_ap <- log(ap)

stl_result <- stl(
  log_ap,
  s.window = "periodic",
  robust = TRUE
)

plot(stl_result, main = "STL Decomposition of log(AirPassengers)")

# Detrended series = observed log series minus estimated trend
trend_component <- stl_result$time.series[, "trend"]
detrended_series <- log_ap - trend_component

plot(detrended_series,
     main = "Detrended log(AirPassengers) Series",
     xlab = "Year",
     ylab = "Log Passengers - Trend",
     col = "blue",
     lwd = 1.5)
abline(h = 0, lty = 2, col = "red")

# Interpretation:
# STL separates the log-transformed series into trend, seasonal and remainder.
# Removing the trend helps examine the remaining seasonal fluctuations
# and irregular movements.

# Q5(c) Holt-Winters forecast for the next 24 months
hw_model <- HoltWinters(ap)

hw_forecast <- predict(
  hw_model,
  n.ahead = 24,
  prediction.interval = TRUE,
  level = 0.95
)

plot(
  hw_model,
  hw_forecast,
  main = "Holt-Winters Forecast of AirPassengers",
  xlab = "Year",
  ylab = "Number of Passengers"
)

# Display forecast values and prediction intervals
print(hw_forecast)

# Interpretation:
# Holt-Winters uses level, trend and seasonal components to forecast
# passenger numbers. The prediction intervals represent forecast uncertainty,
# which generally increases further into the future.

# END OF ASSIGNMENT 3
