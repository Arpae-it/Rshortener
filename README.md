 A simple solution written in R and deployed as a Shiny application to make url shortners for your organizations.
      The only thing to do is to create a Google Sheet and edit it as the provided example at:
      https://docs.google.com/spreadsheets/d/1DFNJmrY92HQb7hFM-7ONC0tVvu0nRIfP-jPodO_hxpc
      Edit app.R in order to point to the new Google Sheet by replacing this line:
        getURL(
      "https://docs.google.com/spreadsheets/d/1DFNJmrY92HQb7hFM-7ONC0tVvu0nRIfP-jPodO_hxpc/gviz/tq?tqx=out:csv&sheet=Shortener",
      ssl.verifypeer = FALSE
    )
    with the address of your Google Sheet (you should remove ssl.verifypeer=FALSE if your Shiny server allows secure connections).
    Then load your app by adding a question mark ('?') and a short name at the end of the url like in this example.
      https://arpae.shinyapps.io/vai_a/?Arpa
      Obviously the shortner works better if you deploy the app at an easy (and short) subdomain in your organizations.
