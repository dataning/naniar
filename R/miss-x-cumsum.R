#' Cumulative sum of the number of missings in each variable
#'
#' Provide a data.frame containing the cumulative sum of number & percentage of
#'   missingness for each variable.
#'
#' @param data a data.frame
#'
#' @return a tibble of the cumulative sum of missing data in each variable
#' @export
#'
#' @examples
#'
#' miss_var_cumsum(airquality)
#'
#' library(dplyr)
#'
#' airquality %>%
#'   group_by(Month) %>%
#'   miss_var_cumsum()
#'
miss_var_cumsum <- function(data){

  test_if_null(data)

  test_if_dataframe(data)

  UseMethod("miss_var_cumsum")

}

#' @export

miss_var_cumsum.default <- function(data){

  purrr::map_df(data,
                # how many are missing in each variable?
                function(x) sum(is.na(x))) %>%
    tidyr::gather(key = "variable",
                  value = "n_missing") %>%
    dplyr::mutate(n_missing_cumsum = cumsum(n_missing))

}

#' @export

miss_var_cumsum.grouped_df <- function(data){

  group_by_fun(data, .fun = miss_var_cumsum)

}


#' Summarise the missingness in each case
#'
#' Provide a data.frame containing each case (row), the number and percent of
#'   missing values in each case.
#'
#' @param data a dataframe
#'
#' @return a tibble containing the number and percent of missing data in each
#'   case
#' @export
#'
#' @examples
#'
#' miss_case_cumsum(airquality)
#'
#' library(dplyr)
#'
#' airquality %>%
#'   group_by(Month) %>%
#'   miss_case_cumsum()
#'
miss_case_cumsum <- function(data){

  test_if_null(data)

  test_if_dataframe(data)

  UseMethod("miss_case_cumsum")
}

#' @export
miss_case_cumsum.default <- function(data){

  miss_case_summary(data) %>%
    dplyr::arrange(case) %>%
    dplyr::select(case,
                  n_missing) %>%
    dplyr::mutate(n_missing_cumsum = cumsum(n_missing))
}

#' @export
miss_case_cumsum.grouped_df <- function(data){

  group_by_fun(data, .fun = miss_case_cumsum)

}
