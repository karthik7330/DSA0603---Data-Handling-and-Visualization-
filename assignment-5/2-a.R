library(dplyr)
library(nycflights13)

data(flights)
data(airlines)

airline_delay <- flights %>%
  left_join(airlines, by = "carrier") %>%
  group_by(carrier, name) %>%
  summarise(
    Mean_Arrival_Delay = mean(arr_delay, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(Mean_Arrival_Delay)

print(airline_delay)

ggplot(
  airline_delay,
  aes(
    x = reorder(name, Mean_Arrival_Delay),
    y = Mean_Arrival_Delay
  )
) +
  geom_col(fill = "darkorange") +
  coord_flip() +
  labs(
    title = "Mean Arrival Delay by Airline",
    x = "Airline",
    y = "Mean Arrival Delay (Minutes)"
  ) +
  theme_minimal()