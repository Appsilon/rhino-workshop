box::use(
  dplyr,
  echarts4r,
  reactable[reactable],
  rhino,
  tidyr,
)

#' @export
fetch_data <- function() {
  rhino::rhinos
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
    echarts4r$e_x_axis(Year) |>
    echarts4r$e_tooltip()
}
