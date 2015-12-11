occlist
=======

[![Build Status](https://api.travis-ci.org/sckott/occlist.png)](https://travis-ci.org/sckott/occlist)
[![codecov.io](https://codecov.io/github/sckott/occlist/coverage.svg?branch=master)](https://codecov.io/github/sckott/occlist?branch=master)

`occlist` = get you some species lists

## Installation


```r
install.packages("devtools")
devtools::install_github("sckott/occlist")
```


```r
library("occlist")
```

## Get a spp list from OBIS


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
occ_list(geometry = geometry, from = "obis")
```

## Meta

* Please [report any issues or bugs](https://github.com/sckott/occlist/issues).
* License: MIT
* Get citation information for `occlist` in R doing `citation(package = 'occlist')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.