box::use(
  shiny,
  echarts4r[echarts4rOutput, renderEcharts4r],
)
box::use(
  app/logic/rhinos,
)

#' @export
ui <- function(id) {
  ns <- shiny$NS(id)
  echarts4rOutput(ns("chart"))
}

#' @export
server <- function(id, data) {
  shiny$moduleServer(id, function(input, output, session) {
    output$chart <- renderEcharts4r({
      shiny$validate(
        shiny$need(nrow(data()) > 0, "Select some species to see the chart")
      )
      rhinos$chart(data())
    })
  })
}
