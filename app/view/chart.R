box::use(
  shiny[moduleServer, need, NS, validate],
  echarts4r[echarts4rOutput, renderEcharts4r],
)
box::use(
  app/logic/rhinos,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  echarts4rOutput(ns("chart"))
}

#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$chart <- renderEcharts4r({
      validate(
        need(nrow(data()) > 0, "Select some species to see the chart")
      )
      rhinos$chart(data())
    })
  })
}
