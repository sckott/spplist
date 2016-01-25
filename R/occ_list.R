#' Get a species list via spocc
#'
#' @export
#' @param query (character) One to many scientific names. See Details for what parameter
#' in each data source we query.
#' @param from (character) Data source to get data from, any combination of gbif, bison,
#' inat, ebird, ecoengine and/or vertnet
#' @param limit (numeric) Number of records to return. This is passed across all sources.
#' To specify different limits for each source, use the options for each source (gbifopts,
#' bisonopts, inatopts, ebirdopts, ecoengineopts, and antwebopts). See Details for more.
#' Default: 500 for each source. BEWARE: if you have a lot of species to query for (e.g.,
#' n = 10), that's 10 * 500 = 5000, which can take a while to collect. So, when you first query,
#' set the limit to something smallish so that you can get a result quickly, then do more as
#' needed.
#' @param geometry (character or nmeric) One of a Well Known Text (WKT) object or a vector of
#' length 4 specifying a bounding box. This parameter searches for occurrences inside a
#' box given as a bounding box or polygon described in WKT format. A WKT shape written as
#' 'POLYGON((30.1 10.1, 20, 20 40, 40 40, 30.1 10.1))' would be queried as is,
#' i.e. http://bit.ly/HwUSif. See Details for more examples of WKT objects. The format of a
#' bounding box is [min-longitude, min-latitude, max-longitude, max-latitude]. Geometry
#' is not possible with vertnet right now, but should be soon. See Details for more info
#' on geometry inputs.
#' @param ... Further args passed on to \code{\link[spocc]{occ}}
#' @examples \dontrun{
#' geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
#' 
#' # gbif
#' spp_list(geometry = geometry)
#' 
#' # gbif, ecoengine and ebird
#' res <- spp_list(geometry = geometry, from = c('gbif', 'ecoengine', 'ebird'), limit = 20)
#' res$gbif
#' res$ecoengine
#' res$ebird
#' 
#' # pass on options to spocc::occ()
#' res <- spp_list("Asteraceae", from = "gbif", gbifopts = list(country = 'US'))
#' res <- spp_list("Accipiter", from = "vertnet", vertnetopts = list(stateprovince = 'Arizona'))
#' res <- spp_list(from = "inat", geometry = c(-125.0,38.4,-121.8,40.9))
#' }
spp_list <- function(query = NULL, from = "gbif", limit = 500, geometry = NULL, ...) {
  res <- spocc::occ(query = query, from = from, geometry = geometry, limit = limit, ...)
  df <- spocc::occ2df(res)
  if (!NROW(df) > 0) stop("No results found", call. = FALSE)
  lapply(split(df$name, df$prov), function(z) {
    drop_na(drop_zero(sort(unique(z))))
  })
}

drop_zero <- function(x) x[vapply(x, nchar, 1) > 0]

drop_na <- function(x) x[!vapply(x, is.na, logical(1))]
