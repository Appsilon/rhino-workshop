box::use(
  shiny[checkboxGroupInput, moduleServer, NS, reactive],
)
box::use(
  app/logic/rhinos,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  checkboxGroupInput(
    inputId = ns("species"),
    label = "Species",
    choices = rhinos$species,
    selected = rhinos$species
  )
}

#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    reactive(
      rhinos$filter_species(data(), input$species)
    )
  })
}
