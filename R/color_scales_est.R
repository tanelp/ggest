#' Brand Estonia color palettes
#'
#' Color palettes in the style of Brand Estonia.
#'
#' @param palette The name of the color palette.
#' Use \code{list_color_palettes} to get a list of color palettes.
#'
#' @export
est_color_pal = function(palette = "group 1", direction = 1, ...){
  palette = tolower(palette)
  pal = est_palettes[[palette]]
  if(direction < 0) pal = rev(pal)
  colorRampPalette(pal, ...)
}

#' Brand Estonia color scales
#'
#' Color scales in the style of Brand Estonia.
#'
#' @inheritParams est_color_pal
#' @inheritParams ggplot2::scale_colour_hue
#' @examples
#' ggplot(data.frame(x=letters[1:6]), aes(x=x, fill=x)) +
#'   geom_bar(width = 1) +
#'   scale_fill_est()
#' @export
scale_color_est = function(palette = "group 1", direction = 1, ...) {
  pal = est_color_pal(palette = palette, direction = direction)
  discrete_scale("colour", "est", palette = pal, ...)
}

#' @rdname scale_color_est
#' @export
scale_colour_est = scale_color_est

#' @rdname scale_color_est
#' @export
scale_fill_est = function(palette = "group 1", direction = 1, ...) {
  pal = est_color_pal(palette = palette, direction = direction)
  discrete_scale("fill", "est", palette = pal, ...)
}

#' Brand Estonia color palette names
#'
#' Get a list of available color palette names.
#' @export
list_color_palettes = function(){
  names(est_palettes)
}

visualize_pal = function(pal_name, num_cols){
  pal = est_color_pal(pal_name)
  dt_dummy = data.frame(x=letters[1:num_cols])
  ggplot(dt_dummy, aes(x=x, fill=x)) +
    geom_bar(width = 1) +
    theme(legend.position = "none",
          axis.title = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          panel.background = element_blank(),
          plot.title = element_text(hjust=0.5, family="Aino-Headline", size=32)) +
    ggtitle(capitalize_string(pal_name)) +
    scale_fill_est(pal_name)
}
