#' Adds default styles to table
#'
#' @param table The table to add the styles to
#'
#' @return Modified SimplePlotTable with data and styles
add_defaults <- function(table){
  defaults <- ggplot2::geom_text()$geom$default_aes
  # The default aes is a list with class uneval.
  # We have to remove the class or else R complains about impossible coercion.
  class(defaults) <- NULL
  # Font Face is weird
  defaults$fontface <- "plain"
  # Alpha should be 1
  defaults$alpha <- 1.0
  table$style <- data.frame(table$data[, c("row", "column")], defaults)
  table$colstyle <- table$rowstyle <- list(face="bold")
  table
}
