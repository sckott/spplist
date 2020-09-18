spplist
=======

[![Build Status](https://api.travis-ci.org/sckott/spplist.png)](https://travis-ci.org/sckott/spplist)
[![codecov.io](https://codecov.io/github/sckott/spplist/coverage.svg?branch=master)](https://codecov.io/github/sckott/spplist?branch=master)

`spplist` = get you some species lists

here's how i'm thinking about the workflow:

* search, retrieve list
* parse to certain rank (limited to spp vs genus)
* clean names - capitalization, etc.
* write to csv/etc.

Thoughts?

## Installation


```r
remotes::install_github("sckott/spplist")
```


```r
library("spplist")
```

## Get a spp list from iDigBio

via the `spocc` package


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
spp_list(geometry = geometry, from = "idigbio", limit = 20)
```

```
## <Species list>
## No. Returned: 19
##   idigbio: 19
```

Get a list from many sources


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
spp_list(geometry = geometry, from = c("idigbio", "inat"), limit = 20)
```

```
## <Species list>
## No. Returned: 38
##   idigbio: 19
##   inat: 19
```

> note how the limit parameter doesn't necessarily give you the number you request. Rather, 
that number is the max occurrence records pulled down, and there could be duplicate 
names.

## Get species lists from GBIF

using `rgbif`

Search by geometry


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
spp_list_gbif(geometry = geometry, limit = 20)
```

```
## [1] "Aythya fuligula (Linnaeus, 1758)"    "Columba palumbus Linnaeus, 1758"    
## [3] "Erithacus rubecula (Linnaeus, 1758)" "Fringilla coelebs Linnaeus, 1758"   
## [5] "Mahonia aquifolium (Pursh) Nutt."    "Phyllostachys Siebold & Zucc."      
## [7] "Podarcis muralis (Laurenti, 1768)"   "Prunus laurocerasus L."             
## [9] "Rhus typhina L."
```

Search by country


```r
(res <- spp_list_gbif(country = 'US', limit = 20))
```

```
##  [1] "Acanthurus coeruleus Bloch & Schneider, 1801"   
##  [2] "Agelaius phoeniceus (Linnaeus, 1766)"           
##  [3] "Allium triquetrum L."                           
##  [4] "Cairina moschata (Linnaeus, 1758)"              
##  [5] "Catharus guttatus (Pallas, 1811)"               
##  [6] "Dryobates pubescens (Linnaeus, 1766)"           
##  [7] "Falco mexicanus Schlegel, 1850"                 
##  [8] "Haemorhous mexicanus (P.L.Statius Müller, 1776)"
##  [9] "Ilex vomitoria Aiton"                           
## [10] "Leucophaeus atricilla (Linnaeus, 1758)"         
## [11] "Liquidambar styraciflua L."                     
## [12] "Lontra canadensis (Schreber, 1777)"             
## [13] "Lophodytes cucullatus (Linnaeus, 1758)"         
## [14] "Melospiza melodia (A.Wilson, 1810)"             
## [15] "Morella cerifera Small"                         
## [16] "Panicum virgatum L."                            
## [17] "Phalacrocorax auritus (Lesson, 1831)"           
## [18] "Selaginella galeottii Spring"                   
## [19] "Spinus pinus (A.Wilson, 1810)"
```

## Meta

* Please [report any issues or bugs](https://github.com/sckott/spplist/issues).
* License: MIT
* Get citation information for `spplist` in R doing `citation(package = 'spplist')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
