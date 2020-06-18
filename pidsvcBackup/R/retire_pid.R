#' POST PIDsvc XML Backup to PIDsvc
#' @description Given an input file xml, PID server URL and authentication 
#' will upload will upload mappings to a PID Service.
#' @param pid character string for the full pid to be retired
#' @param user character username for PID service
#' @param password character password for PID service
#' @param root character URI of PID service root
#' @return returns PIDsvc HTTP POST response
#' @export
post_pids <- function(pid, user, password, root = "https://geoconnex.us") {
  api <- paste0(root,"/pidsvc/controller?cmd=delete_mapping")
  payload <- list(mapping_path=gsub(root,"",pid))
  x <- httr::POST(api, body = payload, httr::authenticate(user,password), encode=c("form"))
