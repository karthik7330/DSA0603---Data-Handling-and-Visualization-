library(dplyr)
library(ggplot2)

data(mpg)

result <- mpg %>%
  filter(year == 2008) %>%
  group_by(manufacturer) %>%
  summarise(
    Average_Highway_Mileage = mean(hwy),
    Model_Count = n(),
    .groups = "drop"
  ) %>%
  filter(Model_Count >= 5) %>%
  arrange(desc(Average_Highway_Mileage))

print(result)

ggplot(
  result,
  aes(
    x = reorder(manufacturer, Average_Highway_Mileage),
    y = Average_Highway_Mileage
  )
) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Average Highway Mileage by Manufacturer (2008)",
    x = "Manufacturer",
    y = "Average Highway Mileage"
  ) +
  theme_minimal()