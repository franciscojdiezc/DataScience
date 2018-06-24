require(ggplot2)
require(tidyverse)
library(ggmap)
library(dplyr)
require(raster) 
require(gapminder)

madridcoords = c(lon=-3.705416,lat= 40.43242)

mapaempresas <- get_map(location = madridcoords,zoom = 9,color = 'bw')

mapamercado <- get_map(location = madridcoords,zoom = 10,color = 'bw')

#Datos para cálculo

ventas = read.csv('data/ventas.csv', sep = ';' , stringsAsFactors = FALSE)

ventasSinNa<-ventas[!is.na(ventas$CPOS),]

ventasSinNa$CPOS <- as.character(ventasSinNa$CPOS)

codigospostales <- read.csv('data/PostalCodesSpain.csv', sep = ';', stringsAsFactors = FALSE)

codigos <- codigospostales[,c(1,2,3,4)]

zonacoords = left_join(ventasSinNa,codigos,by=c("CPOS"="Postal.Code"))

zonacoords$Latitude <- as.numeric(zonacoords$Latitude)
zonacoords$Longitude <- as.numeric(zonacoords$Longitude)

zonacoords2 <- zonacoords[!is.na(zonacoords$Latitude),]

mercadoPart = read.csv('data/mercadoPart.csv', sep = ';')
mercadoPart$CP <- as.character(mercadoPart$CP)

mercadoPartCoords = left_join(mercadoPart,codigos,by=c("CP"="Postal.Code"))

mercadoPartCoords2 <- mercadoPartCoords[!is.na(mercadoPartCoords$Latitude),]

mercadoPartCoords2$Latitude <- as.numeric(mercadoPartCoords2$Latitude)
mercadoPartCoords2$Longitude <- as.numeric(mercadoPartCoords2$Longitude)

 	
