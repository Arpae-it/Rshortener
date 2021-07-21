library(htmlwidgets)
library(RCurl)

ui <- bootstrapPage(#you can include other scripts in the head section like google analytics
  #tags$head(includeHTML("goggle.html")),
  tags$head(
    tags$script(
      '
                        var width = 0;
                        $(document).on("shiny:connected", function(e) {
                          width = window.innerHeight;
                          Shiny.onInputChange("width", width);
                        });

                        '
    )
  ),
  htmlOutput("inc"))

server <- function(input, output, session) {
  # Return the components of the URL in a string:
  httr::set_config(httr::config(ssl_verifypeer = 0L))
  uro <-
    getURL(
      "https://docs.google.com/spreadsheets/d/1DFNJmrY92HQb7hFM-7ONC0tVvu0nRIfP-jPodO_hxpc/gviz/tq?tqx=out:csv&sheet=Shortener",
      ssl.verifypeer = FALSE
    )
  siti <- read.csv(textConnection(uro))
  
  
  output$inc <- renderUI({
    query <-
      substr(session$clientData$url_search,
             2,
             nchar(session$clientData$url_search))
    
    x <- query
    x2 <- as.character(siti$Url[siti$Short == x])
    scritto <- paste0('window.location.assign("', x2, '");')
    tags$script(scritto)
  })
}


shinyApp(ui, server)
