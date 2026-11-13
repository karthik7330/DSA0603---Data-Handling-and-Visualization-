library(leaflet)

data(quakes)

leaflet(quakes) %>%
  addProviderTiles("OpenStreetMap") %>%
  addCircleMarkers(
    lng = ~long,
    lat = ~lat,
    radius = ~mag * 1.5,
    color = ~ifelse(
      mag >= 5,
      "red",
      ifelse(mag >= 4, "orange", "blue")
    ),
    fillOpacity = 0.7,
    popup = ~paste(
      "Magnitude:", mag,
      "<br>Depth:", stations
    )
  )