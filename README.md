spplist
=======

[![Build Status](https://api.travis-ci.org/sckott/spplist.png)](https://travis-ci.org/sckott/spplist)
[![codecov.io](https://codecov.io/github/sckott/spplist/coverage.svg?branch=master)](https://codecov.io/github/sckott/spplist?branch=master)

`spplist` = get you some species lists

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
##  [1] "Asplenium trichomanes"  "Cyclamen purpurascens" 
##  [3] "Equisetum hyemale"      "Hedera helix"          
##  [5] "Lunaria rediviva"       "Polypodium virginianum"
##  [7] "Polystichum aculeatum"  "Polystichum braunii"   
##  [9] "Primula vulgaris"       "Saxifraga cotyledon"   
## [11] "Tussilago farfara"      "Viscum album"
```

Search by country


```r
(res <- occ_list_gbif(country = 'US', limit = 20))
```

```
##  [1] "Aloe arborescens"         "Anas strepera"           
##  [3] "Auriparus flaviceps"      "Cardinalis cardinalis"   
##  [5] "Conidae"                  "Elgaria multicarinata"   
##  [7] "Fulica americana"         "Homo sapiens"            
##  [9] "Ilex opaca"               "Larus fuscus"            
## [11] "Lestes alacer"            "Lynx rufus"              
## [13] "Melongenidae"             "Neverita"                
## [15] "Schinus molle"            "Setophaga coronata"      
## [17] "Sigmodon hispidus"        "Streptopelia decaocto"   
## [19] "Thryothorus ludovicianus"
```

## Meta

* Please [report any issues or bugs](https://github.com/sckott/spplist/issues).
* License: MIT
* Get citation information for `spplist` in R doing `citation(package = 'spplist')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
