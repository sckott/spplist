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

via the `spocc` package


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
occ_list(geometry = geometry, from = "obis", limit = 20)
```

```
## $obis
## [1] "Cottus gobio"                            
## [2] "Ameira"                                  
## [3] "Ameira parvula"                          
## [4] "Asellopsis"                              
## [5] "Paramphiascella coulli"                  
## [6] "Alsidium corallinum"                     
## [7] "Cladostephus spongiosus f. verticillatus"
## [8] "Enhydrosoma caeni"
```

## Get species lists from GBIF

using `rgbif`

Search by geometry


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
occ_list_gbif(geometry = geometry, limit = 20)
```

```
##  [1] "Cyclamen purpurascens"  "Hedera helix"          
##  [3] "Primula vulgaris"       "Viscum album"          
##  [5] "Polystichum braunii"    "Lunaria rediviva"      
##  [7] "Asplenium trichomanes"  "Equisetum hyemale"     
##  [9] "Tussilago farfara"      "Polypodium virginianum"
## [11] "Polystichum aculeatum"  "Saxifraga cotyledon"
```

Search by country


```r
(res <- occ_list_gbif(country = 'US', limit = 20))
```

```
##  [1] "Elgaria multicarinata"    "Thryothorus ludovicianus"
##  [3] "Conidae"                  "Neverita"                
##  [5] "Melongenidae"             "Streptopelia decaocto"   
##  [7] "Homo sapiens"             "Setophaga coronata"      
##  [9] "Aloe arborescens"         "Anas strepera"           
## [11] "Schinus molle"            "Fulica americana"        
## [13] "Larus fuscus"             "Sigmodon hispidus"       
## [15] "Ilex opaca"               "Cardinalis cardinalis"   
## [17] "Auriparus flaviceps"      "Lynx rufus"              
## [19] "Lestes alacer"
```

## Meta

* Please [report any issues or bugs](https://github.com/sckott/occlist/issues).
* License: MIT
* Get citation information for `occlist` in R doing `citation(package = 'occlist')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
