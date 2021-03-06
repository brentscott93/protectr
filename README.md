
<!-- README.md is generated from README.Rmd. Please edit that file -->

# protectr

<!-- badges: start -->
<!-- badges: end -->

The goal of protectr is to password protect HTML files directly from R.
protectr injects an HTML file into a template.html file that includes
the javascript code to hide/show the html content. The password is
entered in plain text through R code and is SHA256 hashed using the
{digest} package. The SHA256 hashed password is placed in the new
protected file source code for later comparison by end user who arrives
at the web page. If the correct password is entered the SHA256 hash by
the Crypto.js library will match the one saved in the file and the
original content will be shown.

Note this is not a super secure protection. The raw HTML can still be
seen in the source code of your document. The intention is to provide a
quick, easy, and mild protection to HTML docs after knitting a Rmd to
HTML.

## Installation

You can install the development version of protectr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("brentscott93/protectr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(protectr)
#protect(file = "~/path/to/file.html", password = "mycoolpassword")
```
