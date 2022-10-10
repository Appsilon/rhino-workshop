box::use(
  shiny,
)
box::use(
  app/logic/rhinos,
)

#' @export
ui <- function(id) {
  ns <- shiny$NS(id)
  shiny$checkboxGroupInput(
    inputId = ns("species"),
    label = "Species",
    choices = rhinos$species,
    selected = rhinos$species
  )
}

#' @export
server <- function(id, data) {
  shiny$moduleServer(id, function(input, output, session) {
    shiny$reactive({
      rhinos$filter_species(data(), input$species)
    })
  })
}
