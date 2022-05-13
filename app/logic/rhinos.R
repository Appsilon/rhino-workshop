box::use(
  dplyr,
  echarts4r,
  htmlwidgets[JS],
  reactable[reactable],
  rhino,
  tidyr,
)

#' @export
fetch_data <- function() {
  rhino::rhinos
}

#' @export
species <- c(
  "Black Rhino",
  "Indian Rhino",
  "Javan Rhino",
  "Southern White Rhino",
  "Sumatran Rhino"
)

#' @export
filter_species <- function(data, species) {
  data |>
    dplyr$filter(Species %in% species)
}

#' @export
table <- function(data) {
  data |>
    tidyr$pivot_wider(names_from = Species, values_from = Population) |>
    dplyr$arrange(Year) |>
    reactable()
}

#' @export
chart <- function(data) {
  data |>
    dplyr$group_by(Species) |>
    echarts4r$e_chart(Year) |>
    echarts4r$e_line(Population) |>
    echarts4r$e_x_axis(Year, formatter = JS("App.formatYear")) |>
    echarts4r$e_tooltip()
}
