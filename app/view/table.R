box::use(
  reactable[reactableOutput, renderReactable],
  shiny,
)
box::use(
  app/logic/rhinos,
)

#' @export
ui <- function(id) {
  ns <- shiny$NS(id)
  reactableOutput(ns("table"))
}

#' @export
server <- function(id, data) {
  shiny$moduleServer(id, function(input, output, session) {
    output$table <- renderReactable({
      rhinos$table(data())
    })
  })
}
