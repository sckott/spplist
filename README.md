spplist
=======

[![Build Status](https://api.travis-ci.org/ropenscilabs/spplist.png)](https://travis-ci.org/ropenscilabs/spplist)
[![codecov.io](https://codecov.io/github/ropenscilabs/spplist/coverage.svg?branch=master)](https://codecov.io/github/ropenscilabs/spplist?branch=master)

`spplist` = get you some species lists

here's how i'm thinking about the workflow:

* search, retrieve list
* parse to certain rank (limited to spp vs genus)
* clean names - capitalization, etc.
* write to csv/etc.

Thoughts?

## Installation


```r
install.packages("devtools")
devtools::install_github("sckott/spplist")
```


```r
library("spplist")
```

## Get a spp list from OBIS

via the `spocc` package


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
occ_list(geometry = geometry, from = "obis", limit = 20)
```

```
## Error in match.arg(from, choices = c("gbif", "bison", "inat", "ebird", : 'arg' should be one of "gbif", "bison", "inat", "ebird", "ecoengine", "antweb", "vertnet", "idigbio"
```

## Get species lists from GBIF

using `rgbif`

Search by geometry


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
occ_list_gbif(geometry = geometry, limit = 20)
```

```
##  [1] "Anas platyrhynchos"    "Anser anser"          
##  [3] "Ardea cinerea"         "Aythya ferina"        
##  [5] "Aythya fuligula"       "Buteo buteo"          
##  [7] "Cinclus cinclus"       "Corvus corone"        
##  [9] "Cyclamen purpurascens" "Fulica atra"          
## [11] "Hedera helix"          "Mergus merganser"     
## [13] "Netta rufina"          "Phalacrocorax carbo"  
## [15] "Podiceps cristatus"    "Primula vulgaris"     
## [17] "Rubus laciniatus"      "Salamandra salamandra"
## [19] "Spinus spinus"
```

Search by country


```r
(res <- occ_list_gbif(country = 'US', limit = 20))
```

```
##  [1] "Acer rubrum"           "Aureoboletus"         
##  [3] "Buteo jamaicensis"     "Calycopis cecrops"    
##  [5] "Cathartes aura"        "Centaurea melitensis" 
##  [7] "Cryptochiton stelleri" "Fagus grandifolia"    
##  [9] "Homo sapiens"          "Marasmius plicatulus" 
## [11] "Melospiza melodia"     "Mephitis mephitis"    
## [13] "Mycena maculata"       "Pipilo maculatus"     
## [15] "Regulus calendula"     "Sayornis saya"        
## [17] "Sciurus carolinensis"  "Strix varia"          
## [19] "Tamias striatus"
```

## Meta

* Please [report any issues or bugs](https://github.com/sckott/spplist/issues).
* License: MIT
* Get citation information for `spplist` in R doing `citation(package = 'spplist')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
