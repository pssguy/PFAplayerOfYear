
shinyServer(function(input, output,session) {
  
 output$table <- DT::renderDataTable({
   
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
   
res <-   pfa %>% 
     filter(season>=input$year[1]&season<=input$year[2]
            &tier>=tierOne&tier<=tierTwo
            &(pos %in% thePos)
            &team %in% theTeam
            &country %in% theCountry) %>% 
     group_by(player) %>% 
     tally() %>% 
     rename(Years=n) %>% 
     ungroup() %>% 
     arrange(desc(Years)) %>% 

DT::datatable(selection='single')
   
 })
 
 
 output$playerTable <- DT::renderDataTable({ 
   
   
   if(is.null(input$table_rows_selected)) return()
   
   s = as.integer(input$table_rows_selected)
   
   pfa %>% 
     
   
   
   
#    df %>%  
#      DT::datatable(rownames=TRUE,selection='single',options= list(pageLength=10,
#                                                                   paging = TRUE, searching = TRUE,info=FALSE))
 })
 
 
 
})

