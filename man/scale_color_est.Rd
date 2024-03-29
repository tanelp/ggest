% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color_scales_est.R
\name{scale_color_est}
\alias{scale_color_est}
\alias{scale_colour_est}
\alias{scale_fill_est}
\title{Brand Estonia color scales}
\usage{
scale_color_est(palette = "group 1", direction = 1, ...)

scale_colour_est(palette = "group 1", direction = 1, ...)

scale_fill_est(palette = "group 1", direction = 1, ...)
}
\arguments{
\item{palette}{The name of the color palette.
Use \code{list_color_palettes} to get a list of color palettes.}

\item{direction}{direction to travel around the colour wheel,
1 = clockwise, -1 = counter-clockwise}

\item{...}{Arguments passed on to \code{discrete_scale}
\describe{
  \item{breaks}{One of:
\itemize{
\item \code{NULL} for no breaks
\item \code{waiver()} for the default breaks computed by the
transformation object
\item A character vector of breaks
\item A function that takes the limits as input and returns breaks
as output
}}
  \item{limits}{A character vector that defines possible values of the scale
and their order.}
  \item{drop}{Should unused factor levels be omitted from the scale?
The default, \code{TRUE}, uses the levels that appear in the data;
\code{FALSE} uses all the levels in the factor.}
  \item{na.translate}{Unlike continuous scales, discrete scales can easily show
missing values, and do so by default. If you want to remove missing values
from a discrete scale, specify \code{na.translate = FALSE}.}
  \item{na.value}{If \code{na.translate = TRUE}, what value aesthetic
value should missing be displayed as? Does not apply to position scales
where \code{NA} is always placed at the far right.}
  \item{scale_name}{The name of the scale}
  \item{palette}{A palette function that when called with a single integer
argument (the number of levels in the scale) returns the values that
they should take}
  \item{name}{The name of the scale. Used as axis or legend title. If
\code{waiver()}, the default, the name of the scale is taken from the first
mapping used for that aesthetic. If \code{NULL}, the legend title will be
omitted.}
  \item{labels}{One of:
\itemize{
\item \code{NULL} for no labels
\item \code{waiver()} for the default labels computed by the
transformation object
\item A character vector giving labels (must be same length as \code{breaks})
\item A function that takes the breaks as input and returns labels
as output
}}
  \item{expand}{Vector of range expansion constants used to add some
padding around the data, to ensure that they are placed some distance
away from the axes. Use the convenience function \code{\link[=expand_scale]{expand_scale()}}
to generate the values for the \code{expand} argument. The defaults are to
expand the scale by 5\% on each side for continuous variables, and by
0.6 units on each side for discrete variables.}
  \item{guide}{A function used to create a guide or its name. See
\code{\link[=guides]{guides()}} for more info.}
  \item{position}{The position of the axis. "left" or "right" for vertical
scales, "top" or "bottom" for horizontal scales}
  \item{super}{The super class to use for the constructed scale}
}}
}
\description{
Color scales in the style of Brand Estonia.
}
\examples{
ggplot(data.frame(x=letters[1:6]), aes(x=x, fill=x)) +
  geom_bar(width = 1) +
  scale_fill_est()
}
