
shinyServer(function(input, output,session) {
  
  theData <- reactive({
    
    if (input$tier=="All") {
      tierOne <- 1
      tierTwo <- 4
    } else {
      tierOne <- as.integer(input$tier)
      tierTwo <- as.integer(input$tier)
    }
    print(tierOne)
    print(tierTwo)
    
    if (input$position=="All") {
      thePos <- c("GK","DF","MF","FW")
    } else {
      thePos <- input$position
    }
    print(thePos)
    
    print(input$year[1])
    print(input$year[2])
    
    if (input$team=="All") {
      theTeam <- teamChoice
    } else {
      theTeam <- input$team
    }
    
    if (input$country=="All") {
      theCountry <- countryChoice
    } else {
      theCountry <- input$country
    }
    
    if (input$player=="All") {
      thePlayer <- playerChoice
    } else {
      thePlayer <- input$player
    }
    
    res <-   pfa %>% 
      filter(season>=input$year[1]&season<=input$year[2]
             &tier>=tierOne&tier<=tierTwo
             &pos %in% thePos
             &team %in% theTeam
             &country %in% theCountry
             &player %in% thePlayer) %>% 
      group_by(player) %>% 
      tally() %>% 
      rename(Years=n) %>% 
      ungroup() %>% 
      arrange(desc(Years))
    
    info=list(res=res)
    return(info)
    
  })
  
 output$table <- DT::renderDataTable({

   
theData()$res %>% 
DT::datatable(rownames=TRUE,selection='single')
   
 })
 
 
 output$playerTable <- DT::renderDataTable({ 
   
   print(input$table_rows_selected)
   if(is.null(input$table_rows_selected)) return()
   
   s = as.integer(input$table_rows_selected)
   
   print(s)
   
   thePlayer <- theData()$res[s,]$player
   print(thePlayer)
   
pfa %>% 
     filter(player==thePlayer) %>% 
     select(season,team,tier)   %>% 
     DT::datatable(rownames = FALSE,options= list(paging = FALSE, searching = FALSE,info=FALSE))
   
   
   
#    df %>%  
#      DT::datatable(rownames=TRUE,selection='single',options= list(pageLength=10,
#                                                                   paging = TRUE, searching = TRUE,info=FALSE))
 })
 
 
 
})

