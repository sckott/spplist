#' Get a species list
#'
#' @export
#' @examples \dontrun{
#' geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
#' 
#' # gbif
#' spp_list(geometry = geometry)
#' 
#' # gbif, obis, and bison
#' res <- spp_list(geometry = geometry, from = c('gbif', 'obis', 'ebird'), limit = 20)
#' res$gbif
#' res$obis
#' res$ebird
#' }
spp_list <- function(query = NULL, from = "gbif", limit = 500, geometry = NULL) {
  res <- spocc::occ(query = query, from = from, geometry = geometry, limit = limit)
  df <- occ2df(res)
  if (!NROW(df) > 0) stop("No results found", call. = FALSE)
  lapply(split(df$name, df$prov), function(z) sort(unique(z)))
}
