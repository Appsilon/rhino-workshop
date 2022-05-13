box::use(
  shiny[bootstrapPage, moduleServer, NS, reactive],
)
box::use(
  app/logic/rhinos,
  app/view[chart, table],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    table$ui(ns("table")),
    chart$ui(ns("chart"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <- reactive(rhinos$fetch_data())
    table$server("table", data)
    chart$server("chart", data)
  })
}
