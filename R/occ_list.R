#' Get a species list
#'
#' @export
#' @examples \dontrun{
#' geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
#' occ_list(geometry = geometry)
#' }
occ_list <- function(query = NULL, from = "gbif", limit = 500, geometry = NULL) {
  res <- spocc::occ(query = query, from = from, geometry = geometry, limit = limit)
  df <- occ2df(res)
  if (!NROW(df) > 0) stop("No results found", call. = FALSE)
  split(df$name, df$prov)
}
