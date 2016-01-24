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
devtools::install_github("ropenscilabs/spplist")
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
## $idigbio
##  [1] "agonum viduum"                          
##  [2] "anthidiellum (ananthidiellum) strigatum"
##  [3] "bembidion articulatum"                  
##  [4] "cardamine amara"                        
##  [5] "clitocybe geotropa"                     
##  [6] "collema auriforme"                      
##  [7] "cortinarius subtortus"                  
##  [8] "dicentrarchus labrax"                   
##  [9] "graptodytes granularis"                 
## [10] "lecanora mughicola"                     
## [11] "lecidea turgidula"                      
## [12] "microtus subterraneus incertoides"      
## [13] "mus musculus domesticus"                
## [14] "ochrolechia alboflavescens"             
## [15] "philonthus carbonarius"                 
## [16] "physconia perisidiosa"                  
## [17] "rhizocarpon kakurgon"                   
## [18] "rhodymenia ligulata"                    
## [19] "zeus faber"
```

Get a list from many sources


```r
geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
spp_list(geometry = geometry, from = c("idigbio", "inat"), limit = 20)
```

```
## $idigbio
##  [1] "agonum viduum"                          
##  [2] "anthidiellum (ananthidiellum) strigatum"
##  [3] "bembidion articulatum"                  
##  [4] "cardamine amara"                        
##  [5] "clitocybe geotropa"                     
##  [6] "collema auriforme"                      
##  [7] "cortinarius subtortus"                  
##  [8] "dicentrarchus labrax"                   
##  [9] "graptodytes granularis"                 
## [10] "lecanora mughicola"                     
## [11] "lecidea turgidula"                      
## [12] "microtus subterraneus incertoides"      
## [13] "mus musculus domesticus"                
## [14] "ochrolechia alboflavescens"             
## [15] "philonthus carbonarius"                 
## [16] "physconia perisidiosa"                  
## [17] "rhizocarpon kakurgon"                   
## [18] "rhodymenia ligulata"                    
## [19] "zeus faber"                             
## 
## $inat
##  [1] "Ajuga pyramidalis"           "Asarum europaeum europaeum" 
##  [3] "Buteo buteo"                 "Cryptocephalus sericeus"    
##  [5] "Dasyphora albofasciata"      "Exorista rustica"           
##  [7] "Lacerta bilineata bilineata" "Lacerta viridis viridis"    
##  [9] "Meromyza femorata"           "Morus alba"                 
## [11] "Populus nigra"               "Populus x canescens"        
## [13] "Primula vulgaris"            "Pyrausta despicata"         
## [15] "Salix elaeagnos"             "Sciurus vulgaris"
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
(res <- spp_list_gbif(country = 'US', limit = 20))
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

* Please [report any issues or bugs](https://github.com/ropenscilabs/spplist/issues).
* License: MIT
* Get citation information for `spplist` in R doing `citation(package = 'spplist')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
