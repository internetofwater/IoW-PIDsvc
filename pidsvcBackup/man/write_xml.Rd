% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_xml.R
\name{write_xml}
\alias{write_xml}
\title{write PID Service Backup XML}
\usage{
write_xml(in_f, out_f, root = "https://geoconnex.us")
}
\arguments{
\item{in_f}{character path to input file}

\item{out_f}{character path to output file}

\item{root}{character URI of PID service root}
}
\value{
returns out file path invisibly
}
\description{
Given an input file csv (or geojson when implemented)
will write an XML "backup" file suitable for upload to a PID Service.
}
