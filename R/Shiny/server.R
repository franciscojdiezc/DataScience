# Definición de la parte server

shinyServer(function(input, output) {
  
  output$calor <- renderPlot({
	ggmap(get_map(location = madridcoords,zoom = input$Zoom,color = "bw")) +
  stat_density2d(aes(x = Longitude, y = Latitude, alpha = ..level..),fill='red4',
                 size = 2, data = subset(zonacoords2, CANAL==input$Canal),
                 geom = "polygon", n=100) +
  geom_point(aes(x = Longitude, y = Latitude), data = subset(zonacoords2, CANAL==input$Canal), colour = 'black',size = 3.5,alpha=.5, shape=8) +
  theme(legend.position = 'None') +
  labs(title ="Mapa Calor", x = "", y = "")
	})
  
  output$calor2 <- renderPlot({
  ggmap(get_map(location = madridcoords,zoom = input$Zoom,color = "bw")) +
    stat_density2d(aes(x = Longitude, y = Latitude, alpha = ..level..),fill='red4',
                   size = 2, data = mercadoPartCoords2,
                   geom = "polygon", n=100) +
    geom_point(aes(x = Longitude, y = Latitude), data = mercadoPartCoords2, colour = 'Black',size = 3.5,alpha=.5, shape=4) +
    theme(legend.position = 'None') +
    labs(title ="Mapa Calor Particulares", x = "", y = "")
  })
})
	
