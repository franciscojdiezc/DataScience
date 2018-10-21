library(tools)
library(rvest)
library(rlist)

sinrojas = read.csv('sinroja.csv')
conrojas = read.csv('conroja.csv')
rojaprimera = read.csv('rojaprimera.csv')
sinamarillas = read.csv('sinamarillas.csv')
sinamarillaprimera = read.csv('sinamarillasprimeraparte.csv')

files <- list.files(path="spain", pattern="*.html", all.files=T, full.names=T)

files
count = 0

for (file in files) {
  
  html = read_html(file)
  home = html_nodes(html, "div.statText--homeValue") %>% html_text()
  
  if (length(home) == 36) {
    home = html_nodes(html, "div.statText--homeValue") %>% html_text()
    away = html_nodes(html, "div.statText--awayValue") %>% html_text()
    primerapartehome = html_nodes(html, "span.p1_home") %>% html_text()
    primerapartehome = gsub('\n','',primerapartehome)
    primeraparteaway = html_nodes(html, "span.p1_away") %>% html_text()
    primeraparteaway = gsub('\n','',primeraparteaway)
    segundapartehome = html_nodes(html, "span.p2_home") %>% html_text()
    segundapartehome = gsub('\n','',segundapartehome)
    segundaparteaway = html_nodes(html, "span.p2_away")%>% html_text()
    segundaparteaway = gsub('\n','',segundaparteaway)
    fecha = html_nodes(html,"div.mstat-date") %>% html_text()
    ligajornada = html_nodes(html, "div.fleft") %>% html_text()
    ligajornada = gsub('\t','',ligajornada)
    ligajornada = gsub('\n','',ligajornada)
    teams = html_nodes(html, "div.tname__text") %>% html_text()
    teams = gsub('\t','',teams)
    teams = gsub('\n','',teams)
    equipolocal = teams[1]
    equipovisitante = teams[2]
    cuotas = html_nodes(html, "div.odds-wrapper") %>% html_text()
    cuotas = gsub('\t', '', cuotas)
    cuotas = gsub('\n', ' ', cuotas)
    partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha,
                   ligajornada, equipolocal, equipovisitante, cuotas)
    nombres = html_nodes(html, "div.statText--titleValue") %>% html_text()
    nombrecasa = paste(nombres, '_home', sep = "")
    nombresfuera = paste(nombres, '_away', sep = "")
    columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha',
                   'ligajornada','equipolocal', 'equipovisitante', 'cuotas')
    columns = unlist(columns)
    df <- data.frame(matrix(unlist(partido), byrow=T))
    data<- as.data.frame(t(df))
    colnames(data) <- columns
    sinrojas = rbind(sinrojas,data)
  } else if (length(home) == 38) {
    home = html_nodes(html, "div.statText--homeValue") %>% html_text()
    away = html_nodes(html, "div.statText--awayValue") %>% html_text()
    primerapartehome = html_nodes(html, "span.p1_home") %>% html_text()
    primerapartehome = gsub('\n','',primerapartehome)
    primeraparteaway = html_nodes(html, "span.p1_away") %>% html_text()
    primeraparteaway = gsub('\n','',primeraparteaway)
    segundapartehome = html_nodes(html, "span.p2_home") %>% html_text()
    segundapartehome = gsub('\n','',segundapartehome)
    segundaparteaway = html_nodes(html, "span.p2_away")%>% html_text()
    segundaparteaway = gsub('\n','',segundaparteaway)
    fecha = html_nodes(html,"div.mstat-date") %>% html_text()
    ligajornada = html_nodes(html, "div.fleft") %>% html_text()
    ligajornada = gsub('\t','',ligajornada)
    ligajornada = gsub('\n','',ligajornada)
    teams = html_nodes(html, "div.tname__text") %>% html_text()
    teams = gsub('\t','',teams)
    teams = gsub('\n','',teams)
    equipolocal = teams[1]
    equipovisitante = teams[2]
    cuotas = html_nodes(html, "div.odds-wrapper") %>% html_text()
    cuotas = gsub('\t', '', cuotas)
    cuotas = gsub('\n', ' ', cuotas)
    partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha,
                   ligajornada, equipolocal, equipovisitante, cuotas)
    nombres = html_nodes(html, "div.statText--titleValue") %>% html_text()
    nombrecasa = paste(nombres, '_home', sep = "")
    nombresfuera = paste(nombres, '_away', sep = "")
    columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha',
                   'ligajornada','equipolocal', 'equipovisitante', 'cuotas')
    columns = unlist(columns)
    df <- data.frame(matrix(unlist(partido), byrow=T))
    data<- as.data.frame(t(df))
    colnames(data) <- columns
    conrojas = rbind(conrojas,data)
  } else if (length(home) == 39) {
    home = html_nodes(html, "div.statText--homeValue") %>% html_text()
    away = html_nodes(html, "div.statText--awayValue") %>% html_text()
    primerapartehome = html_nodes(html, "span.p1_home") %>% html_text()
    primerapartehome = gsub('\n','',primerapartehome)
    primeraparteaway = html_nodes(html, "span.p1_away") %>% html_text()
    primeraparteaway = gsub('\n','',primeraparteaway)
    segundapartehome = html_nodes(html, "span.p2_home") %>% html_text()
    segundapartehome = gsub('\n','',segundapartehome)
    segundaparteaway = html_nodes(html, "span.p2_away")%>% html_text()
    segundaparteaway = gsub('\n','',segundaparteaway)
    fecha = html_nodes(html,"div.mstat-date") %>% html_text()
    ligajornada = html_nodes(html, "div.fleft") %>% html_text()
    ligajornada = gsub('\t','',ligajornada)
    ligajornada = gsub('\n','',ligajornada)
    teams = html_nodes(html, "div.tname__text") %>% html_text()
    teams = gsub('\t','',teams)
    teams = gsub('\n','',teams)
    equipolocal = teams[1]
    equipovisitante = teams[2]
    cuotas = html_nodes(html, "div.odds-wrapper") %>% html_text()
    cuotas = gsub('\t', '', cuotas)
    cuotas = gsub('\n', ' ', cuotas)
    partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha,
                   ligajornada, equipolocal, equipovisitante, cuotas)
    nombres = html_nodes(html, "div.statText--titleValue") %>% html_text()
    nombrecasa = paste(nombres, '_home', sep = "")
    nombresfuera = paste(nombres, '_away', sep = "")
    columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha',
                   'ligajornada','equipolocal', 'equipovisitante', 'cuotas')
    columns = unlist(columns)
    df <- data.frame(matrix(unlist(partido), byrow=T))
    data<- as.data.frame(t(df))
    colnames(data) <- columns
    rojaprimera = rbind(rojaprimera,data)
  } else if (length(home) == 35) {
    home = html_nodes(html, "div.statText--homeValue") %>% html_text()
    away = html_nodes(html, "div.statText--awayValue") %>% html_text()
    primerapartehome = html_nodes(html, "span.p1_home") %>% html_text()
    primerapartehome = gsub('\n','',primerapartehome)
    primeraparteaway = html_nodes(html, "span.p1_away") %>% html_text()
    primeraparteaway = gsub('\n','',primeraparteaway)
    segundapartehome = html_nodes(html, "span.p2_home") %>% html_text()
    segundapartehome = gsub('\n','',segundapartehome)
    segundaparteaway = html_nodes(html, "span.p2_away")%>% html_text()
    segundaparteaway = gsub('\n','',segundaparteaway)
    fecha = html_nodes(html,"div.mstat-date") %>% html_text()
    ligajornada = html_nodes(html, "div.fleft") %>% html_text()
    ligajornada = gsub('\t','',ligajornada)
    ligajornada = gsub('\n','',ligajornada)
    teams = html_nodes(html, "div.tname__text") %>% html_text()
    teams = gsub('\t','',teams)
    teams = gsub('\n','',teams)
    equipolocal = teams[1]
    equipovisitante = teams[2]
    cuotas = html_nodes(html, "div.odds-wrapper") %>% html_text()
    cuotas = gsub('\t', '', cuotas)
    cuotas = gsub('\n', ' ', cuotas)
    partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha,
                   ligajornada, equipolocal, equipovisitante, cuotas)
    nombres = html_nodes(html, "div.statText--titleValue") %>% html_text()
    nombrecasa = paste(nombres, '_home', sep = "")
    nombresfuera = paste(nombres, '_away', sep = "")
    columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha',
                   'ligajornada','equipolocal', 'equipovisitante', 'cuotas')
    columns = unlist(columns)
    df <- data.frame(matrix(unlist(partido), byrow=T))
    data<- as.data.frame(t(df))
    colnames(data) <- columns
    sinamarillaprimera = rbind(sinamarillaprimera,data)
  } else if (length(home) == 33) {
    home = html_nodes(html, "div.statText--homeValue") %>% html_text()
    away = html_nodes(html, "div.statText--awayValue") %>% html_text()
    primerapartehome = html_nodes(html, "span.p1_home") %>% html_text()
    primerapartehome = gsub('\n','',primerapartehome)
    primeraparteaway = html_nodes(html, "span.p1_away") %>% html_text()
    primeraparteaway = gsub('\n','',primeraparteaway)
    segundapartehome = html_nodes(html, "span.p2_home") %>% html_text()
    segundapartehome = gsub('\n','',segundapartehome)
    segundaparteaway = html_nodes(html, "span.p2_away")%>% html_text()
    segundaparteaway = gsub('\n','',segundaparteaway)
    fecha = html_nodes(html,"div.mstat-date") %>% html_text()
    ligajornada = html_nodes(html, "div.fleft") %>% html_text()
    ligajornada = gsub('\t','',ligajornada)
    ligajornada = gsub('\n','',ligajornada)
    teams = html_nodes(html, "div.tname__text") %>% html_text()
    teams = gsub('\t','',teams)
    teams = gsub('\n','',teams)
    equipolocal = teams[1]
    equipovisitante = teams[2]
    cuotas = html_nodes(html, "div.odds-wrapper") %>% html_text()
    cuotas = gsub('\t', '', cuotas)
    cuotas = gsub('\n', ' ', cuotas)
    partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha,
                   ligajornada, equipolocal, equipovisitante, cuotas)
    nombres = html_nodes(html, "div.statText--titleValue") %>% html_text()
    nombrecasa = paste(nombres, '_home', sep = "")
    nombresfuera = paste(nombres, '_away', sep = "")
    columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha',
                   'ligajornada','equipolocal', 'equipovisitante', 'cuotas')
    columns = unlist(columns)
    df <- data.frame(matrix(unlist(partido), byrow=T))
    data<- as.data.frame(t(df))
    colnames(data) <- columns
    sinamarillas = rbind(sinamarillas,data)
  } else {
    count = count + 1}
}

#GUARDAR

{
write.csv(sinrojas, file = "datos/sinrojas.csv")
write.csv(conrojas, file = "datos/conrojas.csv")
write.csv(rojaprimera, file = "datos/rojaprimera.csv")
write.csv(sinamarillas, file = "datos/sinamarillas.csv")
write.csv(sinamarillaprimera, file = "datos/sinamarillasprimeraparte.csv")
}



