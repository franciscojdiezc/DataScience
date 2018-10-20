library(tools)
library(rvest)
library(rlist)

files <- list.files(path=".", pattern="*.html", all.files=T, full.names=T)
length(home)
files

## SIN ROJA ##
sinroja = read_html('sinamarillaprimeraparte.html')

home = html_nodes(sinroja, "div.statText--homeValue") %>% html_text()

length(home)

away = html_nodes(sinroja, "div.statText--awayValue") %>% html_text()
primerapartehome = html_nodes(sinroja, "span.p1_home") %>% html_text()
primerapartehome = gsub('\n','',primerapartehome)
primeraparteaway = html_nodes(sinroja, "span.p1_away") %>% html_text()
primeraparteaway = gsub('\n','',primeraparteaway)
segundapartehome = html_nodes(sinroja, "span.p2_home") %>% html_text()
segundapartehome = gsub('\n','',segundapartehome)
segundaparteaway = html_nodes(sinroja, "span.p2_away")%>% html_text()
segundaparteaway = gsub('\n','',segundaparteaway)
fecha = html_nodes(sinroja,"div.mstat-date") %>% html_text()

ligajornada = html_nodes(sinroja, "div.fleft") %>% html_text()
ligajornada = gsub('\t','',ligajornada)
ligajornada = gsub('\n','',ligajornada)

teams = html_nodes(sinroja, "div.tname__text") %>% html_text()
teams = gsub('\t','',teams)
teams = gsub('\n','',teams)

equipolocal = teams[1]
equipovisitante = teams[2]

  
partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, 
               fecha, ligajornada, equipolocal, equipovisitante)

nombres = html_nodes(sinroja, "div.statText--titleValue") %>% html_text()

nombrecasa = paste(nombres, '_home', sep = "")
nombresfuera = paste(nombres, '_away', sep = "")

columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha',
               'ligajornada','equipolocal', 'equipovisitante')

columns = unlist(columns)

df <- data.frame(matrix(unlist(partido), byrow=T))

data<- as.data.frame(t(df))

colnames(data) <- columns

sinrojas = data[FALSE,]

write.csv(sinrojas, file = "sinamarillasprimeraparte.csv")

## CON ROJA ##

conroja = read_html('conroja.html')

home = html_nodes(conroja, "div.statText--homeValue") %>% html_text()
away = html_nodes(conroja, "div.statText--awayValue") %>% html_text()
primerapartehome = html_nodes(conroja, "span.p1_home") %>% html_text()
primerapartehome = gsub('\n','',primerapartehome)
primeraparteaway = html_nodes(conroja, "span.p1_away") %>% html_text()
primeraparteaway = gsub('\n','',primeraparteaway)
segundapartehome = html_nodes(conroja, "span.p2_home") %>% html_text()
segundapartehome = gsub('\n','',segundapartehome)
segundaparteaway = html_nodes(conroja, "span.p2_away")%>% html_text()
segundaparteaway = gsub('\n','',segundaparteaway)
fecha = html_nodes(conroja,"div.mstat-date") %>% html_text()

partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha)

nombres = html_nodes(conroja, "div.statText--titleValue") %>% html_text()

nombrecasa = paste(nombres, '_home', sep = "")
nombresfuera = paste(nombres, '_away', sep = "")

columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha')

columns = unlist(columns)

df <- data.frame(matrix(unlist(partido), byrow=T))

data<- as.data.frame(t(df))

colnames(data) <- columns

conrojas = data[FALSE,]

write.csv(conrojas, file = "conrojas.csv")

## CON ROJA PRIMERA PARTE ##

rojaprimera = read_html('rojaprimera.html')

home = html_nodes(rojaprimera, "div.statText--homeValue") %>% html_text()
away = html_nodes(rojaprimera, "div.statText--awayValue") %>% html_text()
primerapartehome = html_nodes(rojaprimera, "span.p1_home") %>% html_text()
primerapartehome = gsub('\n','',primerapartehome)
primeraparteaway = html_nodes(rojaprimera, "span.p1_away") %>% html_text()
primeraparteaway = gsub('\n','',primeraparteaway)
segundapartehome = html_nodes(rojaprimera, "span.p2_home") %>% html_text()
segundapartehome = gsub('\n','',segundapartehome)
segundaparteaway = html_nodes(rojaprimera, "span.p2_away")%>% html_text()
segundaparteaway = gsub('\n','',segundaparteaway)
fecha = html_nodes(rojaprimera,"div.mstat-date") %>% html_text()

partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha)

nombres = html_nodes(rojaprimera, "div.statText--titleValue") %>% html_text()

nombrecasa = paste(nombres, '_home', sep = "")
nombresfuera = paste(nombres, '_away', sep = "")

columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha')

columns = unlist(columns)

df <- data.frame(matrix(unlist(partido), byrow=T))

data<- as.data.frame(t(df))

colnames(data) <- columns

rojaprimera = data[FALSE,]

test = read.csv('rojaprimera.csv')

test = rbind(test,data)

write.csv(rojaprimera, file = "rojaprimera.csv")


## SIN AMARILLAS ##
sinroja = read_html('sinamarillaprimeraparte.html')

home = html_nodes(sinroja, "div.statText--homeValue") %>% html_text()

length(home)

away = html_nodes(sinroja, "div.statText--awayValue") %>% html_text()
primerapartehome = html_nodes(sinroja, "span.p1_home") %>% html_text()
primerapartehome = gsub('\n','',primerapartehome)
primeraparteaway = html_nodes(sinroja, "span.p1_away") %>% html_text()
primeraparteaway = gsub('\n','',primeraparteaway)
segundapartehome = html_nodes(sinroja, "span.p2_home") %>% html_text()
segundapartehome = gsub('\n','',segundapartehome)
segundaparteaway = html_nodes(sinroja, "span.p2_away")%>% html_text()
segundaparteaway = gsub('\n','',segundaparteaway)
fecha = html_nodes(sinroja,"div.mstat-date") %>% html_text()

partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha)

nombres = html_nodes(sinroja, "div.statText--titleValue") %>% html_text()

nombrecasa = paste(nombres, '_home', sep = "")
nombresfuera = paste(nombres, '_away', sep = "")

columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha')

columns = unlist(columns)

df <- data.frame(matrix(unlist(partido), byrow=T))

data<- as.data.frame(t(df))

colnames(data) <- columns

sinrojas = data[FALSE,]

write.csv(sinrojas, file = "sinamarillasprimeraparte.csv")





