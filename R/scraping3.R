library(tools)
library(rvest)
library(rlist)
library(dplyr)
library(plyr)

plantilla = read.csv('plantilla.csv')

plantilla = data.frame()

files <- list.files(path="spain/1314", pattern="*.html", all.files=T, full.names=T)

files
count = 0

for (file in files) {
  
  html = read_html(file)
  x <- data.frame()

try(
  
  if (length(html) > 1) {
    
    #LOCAL PARTIDO COMPLETO
    
    local_stats_fm = html_nodes(html, "div#tab-statistics-0-statistic") %>% 
      html_nodes("div.statText--homeValue") %>% html_text()
    
    names_fm_home = html_nodes(html, "div#tab-statistics-0-statistic") %>% 
      html_nodes("div.statText--titleValue") %>% html_text()
    
    names_fm_home = paste(names_fm_home, '_fm_home', sep = "")
    
    fm_home <- data.frame(local_stats_fm)
    
    fm_home<- as.data.frame(t(fm_home))
    
    colnames(fm_home) <- names_fm_home
    
    x <- rbind(x,fm_home)
    
    #LOCAL PRIMERA PARTE
    
    local_stats_ft = html_nodes(html, "div#tab-statistics-1-statistic") %>% 
      html_nodes("div.statText--homeValue") %>% html_text()
    
    names_ft_home = html_nodes(html, "div#tab-statistics-1-statistic") %>% 
      html_nodes("div.statText--titleValue") %>% html_text()
    
    names_ft_home = paste(names_ft_home, '_ft_home', sep = "")
    
    ft_home <- data.frame(local_stats_ft)
    
    ft_home<- as.data.frame(t(ft_home))
    
    colnames(ft_home) <- names_ft_home
    
    x <- cbind(x,ft_home)
    
    
    #LOCAL SEGUNDA PARTE
    
    local_stats_st = html_nodes(html, "div#tab-statistics-2-statistic") %>% 
      html_nodes("div.statText--homeValue") %>% html_text()
    
    names_st_home = html_nodes(html, "div#tab-statistics-2-statistic") %>% 
      html_nodes("div.statText--titleValue") %>% html_text()
    
    names_st_home = paste(names_st_home, '_st_home', sep = "")
    
    st_home <- data.frame(local_stats_st)
    
    st_home<- as.data.frame(t(st_home))
    
    colnames(st_home) <- names_st_home
    
    x <- cbind(x,st_home)
    
    
    #VISITANTE PARTIDO COMPLETO
    
    away_stats_fm = html_nodes(html, "div#tab-statistics-0-statistic") %>% 
      html_nodes("div.statText--awayValue") %>% html_text()
    
    names_fm_away = html_nodes(html, "div#tab-statistics-0-statistic") %>% 
      html_nodes("div.statText--titleValue") %>% html_text()
    
    names_fm_away = paste(names_fm_away, '_fm_away', sep = "")
    
    fm_away <- data.frame(away_stats_fm)
    
    fm_away<- as.data.frame(t(fm_away))
    
    colnames(fm_away) <- names_fm_away
    
    x <- cbind(x,fm_away)
    
    #VISITANTE PRIMERA PARTE
    
    away_stats_ft = html_nodes(html, "div#tab-statistics-1-statistic") %>% 
      html_nodes("div.statText--awayValue") %>% html_text()
    
    names_ft_away = html_nodes(html, "div#tab-statistics-1-statistic") %>% 
      html_nodes("div.statText--titleValue") %>% html_text()
    
    names_ft_away = paste(names_ft_away, '_ft_away', sep = "")
    
    ft_away <- data.frame(away_stats_ft)
    
    ft_away<- as.data.frame(t(ft_away))
    
    colnames(ft_away) <- names_ft_away
    
    x <- cbind(x,ft_away)
    
    #VISITANTE SEGUNDA PARTE
    
    away_stats_st = html_nodes(html, "div#tab-statistics-2-statistic") %>% 
      html_nodes("div.statText--awayValue") %>% html_text()
    
    names_st_away = html_nodes(html, "div#tab-statistics-2-statistic") %>% 
      html_nodes("div.statText--titleValue") %>% html_text()
    
    names_st_away = paste(names_st_away, '_st_away', sep = "")
    
    st_away <- data.frame(away_stats_st)
    
    st_away<- as.data.frame(t(st_away))
    
    colnames(st_away) <- names_st_away
    
    x <- cbind(x,st_away)
    
    #DATOS DEL PARTIDO
    
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
    
    partido = list(primerapartehome,primeraparteaway,segundapartehome,segundaparteaway, 
                   fecha, ligajornada, equipolocal, equipovisitante, cuotas)
    
    columns = list('goleshomep1', 'golesawayp1','goleshomep2','golesawayp2','fecha',
                   'ligajornada','equipolocal', 'equipovisitante',"cuotas")
    
    columns = unlist(columns)
    
    df <- data.frame(matrix(unlist(partido), byrow=T))
    
    data<- as.data.frame(t(df))
    
    colnames(data) <- columns
    
    x <- cbind(x,data)
    
    plantilla = rbind.fill(plantilla,x)

  } else {
    count = count + 1
    print(file)}
, silent = TRUE)
  
}
