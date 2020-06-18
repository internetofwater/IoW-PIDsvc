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
  call <- post_call(in_f, root)
  post_fun(call$api, call$payload, "multipart", user, password)
}

post_call <- function(in_f, root) {
  list(api = paste0(root,"/pidsvc/controller?cmd=import"),
       payload = list(y=httr::upload_file(in_f, type="text/xml")))
}

#' POST PIDsvc delete_mapping request
#' @description Given a PID, PID server URL and authentication
#' will retire PID in a PID Service.
#' @param pid character string for the full pid to be retired
#' @param user character username for PID service
#' @param password character password for PID service
#' @param root character URI of PID service root
#' @return returns PIDsvc HTTP POST response
#' @export
retire_pid <- function(pid, user, password, root = "https://geoconnex.us") {
  call <- retire_call(pid, root)
  post_fun(call$api, call$payload, "form", user, password)
}

retire_call <- function(pid, root) {
  list(api = paste0(root,"/pidsvc/controller?cmd=delete_mapping"),
       payload = list(mapping_path=gsub(root, "", pid)))
}


post_fun <- function(api, payload, encode, user, password) {
  httr::POST(api, body = payload, httr::authenticate(user, password), encode=c(encode))
}
