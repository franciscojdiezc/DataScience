library(tools)
library(rvest)
library(rlist)

sinrojas = read.csv('sinrojas.csv')
conrojas = read.csv('conrojas.csv')
rojaprimera = read.csv('rojaprimera.csv')

files <- list.files(path=".", pattern="*.html", all.files=T, full.names=T)

files

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
    
    partido = list(home,away,primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, fecha)
    
    nombres = html_nodes(html, "div.statText--titleValue") %>% html_text()
    
    nombrecasa = paste(nombres, '_home', sep = "")
    nombresfuera = paste(nombres, '_away', sep = "")
    
    columns = list(nombrecasa,nombresfuera,'goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha')
    
    columns = unlist(columns)
    
    df <- data.frame(matrix(unlist(partido), byrow=T))
    
    data<- as.data.frame(t(df))
    
    colnames(data) <- columns
    
    sinrojas = rbind(sinrojas,data)
    
  } else if (length(home) == 38) {
    print ('rojasegundaparte')
  } else {
    print('rojaprimeraparte')
  }
  
}











length(home)