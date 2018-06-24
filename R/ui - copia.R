# Definción del UI
shinyUI(fluidPage(
  

titlePanel("Madrid"), # Titulo

sidebarPanel(width = 3,
  selectInput("Canal", h3("Canal"), c("Particulares" = 'Particulares', "Empresas" = 'Empresas')),
  sliderInput("Zoom", h3("Zoom mapa"),min = 7, max = 12, value = 9)),

mainPanel(width = 9,
          tabsetPanel(id="Menu",
            tabPanel("Ventas",
            br(),
            column(12,plotOutput("calor", height = 800))),
          tabPanel("Madrid",
            br(),
            column(12,plotOutput("calor2",height = 800)))
	)
)))



