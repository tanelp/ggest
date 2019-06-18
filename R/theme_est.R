#' Import Aino typeface
#'
#' Imports Aino-Regular, Aino-Bold and Aino-Headline.
#' Turns on the automatic use of \code{showtext} for new graphics devices.
#'
#' @param aino_font_path Directory path to aino typeface.
#'
#' @examples
#' AINO_FONT_DIR = "/path/to/Aino-fonts"
#' import_aino_fonts(AINO_FONT_DIR)
#' @export
import_aino_fonts = function(aino_font_path="Aino-fonts"){
  path_to_regular = paste0(aino_font_path, "/Aino_31_170411-Regular.otf")
  path_to_bold = paste0(aino_font_path, "/Aino_31_170411-Bold.otf")
  path_to_headline = paste0(aino_font_path, "/Aino-Headline.otf")

  sysfonts::font_add("Aino", regular=path_to_regular, bold=path_to_bold)
  sysfonts::font_add("Aino-Headline",  regular=path_to_headline)

  # automatically use showtext for new devices
  showtext::showtext_auto()
}

#' Brand Estonia theme
#'
#' A theme inspired by the \href{https://brand.estonia.ee/about/}{Estonian brand platform}.
#'
#' The Aino typeface is not included in the package because of its terms and conditions.
#' You can download the typeface from \href{https://toolbox.estonia.ee/media/422}{here}.
#' In order to use the font,
#' you need to import it by calling the \code{\link{import_aino_fonts}} function.
#'
#' @param base_size Base font size.
#'
#' @examples
#' data(funding)
#' x11() # open graphics device
#' ggplot(funding, aes(x=factor(year), y=total_raised_capital)) +
#'   geom_bar(stat="identity") +
#'   ggtitle("Investments raised by Estonian startups") +
#'   theme_est()
#' @export
theme_est = function(base_size=10){
  theme_gray(base_size=base_size) +
  theme(
    panel.background = element_rect(fill=NA),
    panel.grid.major = element_line(colour = "grey90", linetype = "dashed"),
    text = element_text(family="Aino-Headline"),
    plot.title = element_text(family="Aino-Headline", size = 1.5*base_size),
    axis.title = element_text(family="Aino-Headline"),
    axis.ticks = element_blank()
    )
}
