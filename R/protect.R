#' Password protect an HTML file with MD5
#'
#' @param file filepath to html
#' @param password character string
#' @export
#' @import digest
protect <- function(file, password){
  template_path <- system.file("template.html", package = "protectr")
  template <- paste(readLines(template_path), collapse = "\n")
  md5_password <- digest::digest(password, serialize = FALSE)
  template <- sub("%%%PASSWORDHERE%%%", md5_password, template)
  html_doc <- paste(readLines(file), collapse = "\n")
  protected <- sub("%%%HTMLHERE%%%", html_doc, template)
  new_file <- sub(".html", "-protected.html", file)
  writeLines(protected, new_file)
}
