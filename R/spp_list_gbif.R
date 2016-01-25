#' Get a species list via rgbif
#' 
#' MIGHT DROP THIS FXN
#'
#' @export
#' @param query (character) Passed to \code{scientificName} parameter in 
#' \code{\link[rgbif]{occ_search}}
#' @param geometry Searches for occurrences inside a polygon described in Well Known
#' Text (WKT) format. A WKT shape written as either POINT, LINESTRING, LINEARRING
#' or POLYGON. Example of a polygon: ((30.1 10.1, 20, 20 40, 40 40, 30.1 10.1))
#' would be queried as \url{http://bit.ly/1BzNwDq}.
#' @param limit Number of records to return. Default: 100. Maximum: 1000.
#' @param ... Further args passed on to \code{\link[rgbif]{occ_search}}
#' @return A data.frame or list
#' @examples \dontrun{
#' spp_list_gbif("Helianthus", limit = 20)
#' spp_list_gbif("Aves", limit = 20)
#' spp_list_gbif("Mammalia", limit = 20)
#' 
#' geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
#' spp_list_gbif(geometry = geometry, limit = 20)
#'
#' # search by country
#' (res <- spp_list_gbif(country = 'US', limit = 20))
#' (res <- spp_list_gbif(country = 'CA', limit = 20))
#' }
spp_list_gbif <- function(query = NULL, geometry = NULL, limit = 500, ...) {
  res <- rgbif::occ_search(scientificName = query, geometry = geometry, limit = limit, ...)
  df <- res$data
  if (!NROW(df) > 0) stop("No results found", call. = FALSE)
  drop_na(drop_zero(sort(unique(df$name))))
}
