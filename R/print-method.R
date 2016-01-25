#' @export
print.spplist <- function(x, ...) {
  n_per <- pluck(pluck(x, "meta"), "returned", 1)
  cat("<Species list>", sep = "\n")
  cat(paste0("No. Returned: ", sum(n_per)), sep = "\n")
  invisible(lapply(x, cat_if))
}

cat_if <- function(z, ...) {
  cat(sprintf("  %s: %s", z$meta$source, z$meta$returned), sep = "\n")
}
