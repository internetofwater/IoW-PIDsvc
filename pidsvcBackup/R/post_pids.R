#' POST PIDsvc XML Backup to PIDsvc
#' @description Given an input file xml, PID server URL and authentication 
#' will upload will upload mappings to a PID Service.
#' @param in_f character path to input xml file
#' @param user character username for PID service
#' @param password character password for PID service
#' @param root character URI of PID service root
#' @return returns PIDsvc HTTP POST response
#' @export
post_pids <- function(in_f, user, password, root = "https://geoconnex.us") {
  api <- paste0(root,"/pidsvc/controller?cmd=import")
  payload <- list(y=httr::upload_file(in_f, type="text/xml"))
  x <- httr::POST(api, body = payload, httr::authenticate(user,password), encode=c("multipart"))
}
