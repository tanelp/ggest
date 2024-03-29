% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_est.R
\name{import_aino_fonts}
\alias{import_aino_fonts}
\title{Import Aino typeface}
\usage{
import_aino_fonts(aino_font_path = "Aino-fonts")
}
\arguments{
\item{aino_font_path}{Directory path to aino typeface.}
}
\description{
Imports Aino-Regular, Aino-Bold and Aino-Headline.
Turns on the automatic use of \code{showtext} for new graphics devices.
}
\examples{
AINO_FONT_DIR = "/path/to/Aino-fonts"
import_aino_fonts(AINO_FONT_DIR)
}
