box::use(
  shiny[bootstrapPage, moduleServer, NS],
)
box::use(
  app/view/table,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    table$ui(ns("table"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    table$server("table")
  })
}
