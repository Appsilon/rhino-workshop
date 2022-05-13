box::use(
  shiny[bootstrapPage, div, moduleServer, NS, reactive, titlePanel],
)
box::use(
  app/logic/rhinos,
  app/view[chart, filters, table],
)

grid <- function(...) div(class = "grid", ...)
card <- function(...) div(class = "card", ...)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    titlePanel("Rhino population over time"),
    grid(
      card(filters$ui(ns("filters"))),
      card(table$ui(ns("table"))),
      card(chart$ui(ns("chart")))
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    raw_data <- reactive(rhinos$fetch_data())
    data <- filters$server("filters", raw_data)
    table$server("table", data)
    chart$server("chart", data)
  })
}
