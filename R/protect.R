#' Password protect an HTML file with MD5
#'
#' @param file filepath to html
#' @param password character string
#' @export
#' @import digest
protect <- function(file, password){
  if(substr(file, nchar(file)-4, nchar(file)) != ".html"){
    stop("File is not an html file")
  }
  if(!is.character(password)){
    stop("Password must be a character string")
  }
  template_path <- system.file("template.html", package = "protectr")
  template <- paste(readLines(template_path), collapse = "\n")
  md5_password <- digest::digest(password, algo = "sha256", serialize = FALSE)
  template <- sub("%%%PASSWORDHERE%%%", md5_password, template)
  html_doc <- paste(readLines(file), collapse = "\n")
  protected <- sub("%%%HTMLHERE%%%", html_doc, template)
  new_file <- sub(".html", "-protected.html", file)
  writeLines(protected, new_file)
}
