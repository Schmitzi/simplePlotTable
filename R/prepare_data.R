#' Converts a data.frame to long format with indexes
#'
#' @param data The data to transform
#'
#' @return The transformed data, with columns row, col and text
prepare_data <- function(data) {
  stopifnot(is.data.frame(data))
  rownames(data) <- 1:nrow(data)
  colnames(data) <- 1:ncol(data)
  data$row <- 1:nrow(data)
  long_data <- tidyr::pivot_longer(data, !row, names_to="column", values_to="text")
  long_data$column <- as.integer(long_data$column)
  long_data
}
