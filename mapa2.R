library(ggmap)
library(ggplot2)
library(dplyr)
require(raster) 

#1. Cargamos los datos y depuramos

ventas = read.csv('ventas.csv', sep = ';' , stringsAsFactors = FALSE)

ventasSinNa<-ventas[!is.na(ventas$CPOS),]

ventasSinNa$CPOS <- as.character(ventasSinNa$CPOS)

codigospostales <- read.csv('PostalCodesSpain.csv', sep = ';', stringsAsFactors = FALSE)

codigos <- codigospostales[,c(1,2,3,4)]

zonacoords = left_join(ventasSinNa,codigos,by=c("CPOS"="Postal.Code"))

zonacoords$Latitude <- as.numeric(zonacoords$Latitude)
zonacoords$Longitude <- as.numeric(zonacoords$Longitude)

zonacoords2 <- zonacoords[!is.na(zonacoords$Latitude),]

#2. Fijamos las coordenadas centrales del mapa y lo creamos

madridcoords = c(lon=-3.705416,lat= 40.43242)
mapa <- get_map(location = madridcoords,zoom = 11,color = "bw")

#·. Mapa de calor

ggmap(mapa) +
  stat_density2d(aes(x = Longitude, y = Latitude, alpha = ..level..),fill='red4',
                 size = 2, data = zonacoords2,
                 geom = "polygon", n=100) +
  geom_point(aes(x = Longitude, y = Latitude), data = subset(zonacoords2, CANAL=='Particulares'), colour = 'black',size = 3.5,alpha=.5, shape=19) +
  theme(legend.position = 'None') +
  labs(title ="Mapa Calor", x = "", y = "")





