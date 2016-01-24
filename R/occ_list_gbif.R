#' Get a species list
#'
#' @export
#' @examples \dontrun{
#' geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
#' spp_list_gbif(geometry = geometry, limit = 20)
#'
#' # search by country
#' (res <- spp_list_gbif(country = 'US', limit = 20))
#' (res <- spp_list_gbif(country = 'CA', limit = 20))
#' }
spp_list_gbif <- function(country = NULL, publishingCountry = NULL, typeStatus = NULL,
  lastInterpreted = NULL, continent = NULL, geometry = NULL, recordedBy = NULL,
  basisOfRecord = NULL, datasetKey = NULL, eventDate = NULL, year = NULL, month = NULL,
  decimalLatitude = NULL, decimalLongitude = NULL, elevation = NULL, depth = NULL,
  institutionCode = NULL, collectionCode = NULL, search = NULL, limit = 500, start = 0) {

  res <- rgbif::occ_search(country = country, publishingCountry = publishingCountry,
    typeStatus = typeStatus, lastInterpreted = lastInterpreted, continent = continent,
    geometry = geometry, recordedBy = recordedBy, basisOfRecord = basisOfRecord,
    datasetKey = datasetKey, eventDate = eventDate, year = year, month = month,
    decimalLatitude = decimalLatitude, decimalLongitude = decimalLongitude,
    elevation = elevation, depth = depth, institutionCode = institutionCode,
    collectionCode = collectionCode, search = search, limit = limit, start = start)
  df <- res$data
  if (!NROW(df) > 0) stop("No results found", call. = FALSE)
  sort(unique(df$name))
}
