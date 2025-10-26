[![pipeline status](https://gitlab.com/fvafrcu/excerptr/badges/master/pipeline.svg)](https://gitlab.com/fvafrcu/excerptr/-/commits/master)    
[![coverage report](https://gitlab.com/fvafrcu/excerptr/badges/master/coverage.svg)](https://gitlab.com/fvafrcu/excerptr/-/commits/master)
<!-- 
    [![Build Status](https://travis-ci.org/fvafrcu/excerptr.svg?branch=master)](https://travis-ci.org/fvafrcu/excerptr)
    [![Coverage Status](https://codecov.io/github/fvafrcu/excerptr/coverage.svg?branch=master)](https://codecov.io/github/fvafrcu/excerptr?branch=master)
-->
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/excerptr)](https://cran.r-project.org/package=excerptr)
[![RStudio_downloads_monthly](https://cranlogs.r-pkg.org/badges/excerptr)](https://cran.r-project.org/package=excerptr)
[![RStudio_downloads_total](https://cranlogs.r-pkg.org/badges/grand-total/excerptr)](https://cran.r-project.org/package=excerptr)

<!-- README.md is generated from README.Rmd. Please edit that file -->



# excerptr
## Introduction

After installation, please read the help page:

``` r
help("excerptr-package", package = "excerptr")
```

```
#> Excerpt Structuring Comments from Your Code File and Set a Table of
#> Contents
#> 
#> Description:
#> 
#>      This is just an R interface to the python package excerpts
#>      (<https://pypi.org/project/excerpts/>).
#> 
#> Author(s):
#> 
#>      *Maintainer*: Andreas Dominik Cullmann
#>      <mailto:fvafrcu@mailbox.org>
#> 
#> See Also:
#> 
#>      Useful links:
#> 
#>         • <https://gitlab.com/fvafrcu/excerptr>
```

## System Requirements
excerptr needs [python3](https://www.python.org/download/releases/3.0/),
you probably want to have [pandoc](https://www.pandoc.org/) and a TeX-System such as 
[TeXLive](https://www.tug.org/texlive/) installed.
## Installation

You can install excerptr from gitlab with:


``` r
if (! require("remotes")) install.packages("remotes")
remotes::install_gitlab("fvafrcu/excerptr")
```


