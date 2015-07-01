
dashboardPage(skin="green",
  dashboardHeader(title = "PFA Awards"),
  
    dashboardSidebar(
#       sliderInput("count","",min=1,max=1000,value=c(1,1000),step=10, ticks=FALSE),
#       uiOutput("industries"),
 
  sidebarMenu(
    menuItem("Tables", tabName = "tables",icon = icon("map-marker"))
  )),
 
#   menuItem("Data", tabName = "data",icon = icon("database")),
#   menuItem("Info", tabName = "info",icon = icon("info")),
#   
#   menuItem("Code",icon = icon("code-fork"),
#            href = "https://github.com/pssguy/fortune500"),
#   
#   menuItem("Other Dashboards",
#            menuSubItem("MLB",href = "https://mytinyshinys.shinyapps.io/mlbCharts"),
#          
#            menuSubItem("WikiGuardian",href = "https://mytinyshinys.shinyapps.io/wikiGuardian"),
#            menuSubItem("World Soccer",href = "https://mytinyshinys.shinyapps.io/worldSoccer")
#            
#   ),
#   
#   menuItem("", icon = icon("twitter-square"),
#            href = "https://twitter.com/pssGuy"),
#   
#   menuItem("", icon = icon("envelope"),
#            href = "mailto:agcur@rogers.com")
#     )
#     ),
    
  dashboardBody( 
    tabItems(
      tabItem("tables",
  fluidRow(
    box(width=12,
      div(style="display:inline-block",selectInput("player","Player",c("All",playerChoice), width = 180)),
      div(style="display:inline-block",selectInput("team","Team",c("All",teamChoice), width = 180)),
      div(style="display:inline-block",selectInput("country","Country",c("All",countryChoice), width = 180)),
      div(style="display:inline-block",selectInput("tier","Tier",c("All",1,2,3,4), width = 80)),
      div(style="display:inline-block",selectInput("position","Position",c("All","GK","DF","MF","FW"), width = 80)),
     # div(style="display:inline-block",sliderInput("year","Year(s)",min=1973,max=2014,value=c(1992,2014),sep="", width=200))
     sliderInput("year","Year(s)",min=1973,max=2014,value=c(1992,2014),sep="", width=200)
     )
),
  fluidRow(
    box(
      DT::dataTableOutput("table")
     
    ),
    box( width=4,
      DT::dataTableOutput("playerTable")
      
    )
  )
) 
       
        
)
)
)






