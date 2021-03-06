% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add-cols.R
\name{add_any_miss}
\alias{add_any_miss}
\title{Add a column describing presence of any missing values}
\usage{
add_any_miss(data, ..., label = "any_miss")
}
\arguments{
\item{data}{data.frame}

\item{...}{Variable names to use instead of the whole dataset. This can be
one or more unquoted variable names separated by commas. These also
respect the dplyr verbs \code{starts_with}, \code{contains}, \code{ends_with}, etc.}

\item{label}{label for the column, defaults to "any_miss". By default if no
additional variables are listed the label col is "any_miss_all", otherwise
it is "any_miss_vars", if variables are specified.}
}
\value{
data.frame with data and the column labelling whether that row (for
those variables) has any missing values - indicated by "missing" and
"complete".
}
\description{
This adds a column named "any_miss" (by default) that describes whether any
there are any missings in all of the variables (default), or whether any of
the specified columns, specified using variables names or dplyr verbs,
\code{starts_with}, \code{contains}, \code{ends_with}, etc. By default the added column
will be called "any_miss_all", if no variables are specified, otherwise,
if variables are specified, the label will be "any_miss_vars" to indicate
that not all variables have been used to create the labels. By default the
\code{label} argument uses the prefix "any_miss", but this can be specified.
}
\examples{

airquality \%>\% add_any_miss()
airquality \%>\% add_any_miss(Ozone, Solar.R)

}
