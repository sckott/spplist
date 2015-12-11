sc <- function(l) Filter(Negate(is.null), l)

pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

strextract <- function(str, pattern) regmatches(str, regexpr(pattern, str))

strtrim <- function(str) gsub("^\\s+|\\s+$", "", str)

time_null <- function(x) {
  if (length(sc(x)) == 0) NULL else sc(x)[[1]]
}

found_null <- function(x) {
  if (length(sc(x)) == 0) NULL else sum(unlist(sc(x)), na.rm = TRUE)
}
