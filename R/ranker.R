#' Clean a species list
#'
#' @export
#' @examples \dontrun{
#' (res <- occ_list_gbif(country = 'US', limit = 20))
#' ranker(res, "species")
#' }
ranker <- function(x, by = "species") {
  switch(by, 
    species = x[vapply(x, splitlen, 1) != 1]
  )
}

splitlen <- function(x) {
  length(strsplit(x, "\\s")[[1]])
}
