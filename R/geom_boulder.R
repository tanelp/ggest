draw_boulder = function(data, panel_scales, coord) {
  # transform the data first
  coords = coord$transform(data, panel_scales)

  # scale factors
  scale_x = 0.01
  scale_y = 0.01

  # coords
  x_vec = unlist(lapply(seq_along(coords$x), function(i) {
    dx = coords_boulder$x
    scale_x * dx * coords$size[i] + coords$x[i]
  }))
  y_vec = unlist(lapply(seq_along(coords$y), function(i) {
    dy = coords_boulder$y
    scale_y * dy * coords$size[i] + coords$y[i]
  }))
  id_vec = rep(1:nrow(coords), each=nrow(coords_boulder))

  first_row = coords[1, , drop = FALSE]
  grid::polygonGrob(
    x_vec,
    y_vec,
    id = id_vec,
    gp = grid::gpar(col = coords$colour,
                    fill = scales::alpha(coords$fill, coords$alpha),
                    lwd = first_row$linewidth,
                    lty = first_row$linetype
                    )
  )
}

GeomBoulder = ggproto("GeomBoulder", Geom,
                      required_aes = c("x", "y"),
                      default_aes = aes(color = "black", fill="gray",
                                        size=3, alpha=1, linewidth=1, linetype=1),
                      draw_key = draw_key_polygon,
                      draw_panel = draw_boulder)

#' Boulders
#'
#' A geometric object for creating boulderplots.
#'
#' @inheritParams ggplot2::geom_point
#'
#' @section Aesthetics:
#' \itemize{
#' \item color
#' \item fill
#' \item size
#' \item alpha
#' \item linewidth
#' \item linetype
#' }
#'
#' @examples
#' p = ggplot(mtcars, aes(wt, mpg))
#' p + geom_boulder(aes(size = qsec))
#' @export
geom_boulder = function(mapping = NULL, data = NULL, stat = "identity",
                         position = "identity", na.rm = FALSE,
                         show.legend = NA, inherit.aes = TRUE, ...) {
  ggplot2::layer(
    geom = GeomBoulder, mapping = mapping,
    data = data, stat = stat, position = position,
    show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}
