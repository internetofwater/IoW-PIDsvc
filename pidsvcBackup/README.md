# PID Service Backup Generator

This R package is to be used to generate XML backup files to upload new or modified PID redirects.

One function is exported by the package, `write_xml()`.

The package imports only the `xml2` package. This dependency may be removed in the future.

`write_xml()` takes two file paths, reading from a csv (or geojson in the future) and writing to an xml file.

```
write_xml("input_file_path.csv", "output_file_path.xml")
```

`post_pids` takes a PID server URL, a file path to an xml file produced by write_xml, a user and password, and POSTs the xml PID mappings to the PIDsvc.

```
post_pids(root="https://geoconnex.us","input_file_path.xml","user","password")
```


```
docker build -t pidsvcbackup:v0.1.0 .
docker run --mount type=bind,source="$(pwd)",target="/temp/" \
  pidsvcbackup:v0.1.0  \
  R -e "pidsvcBackup::write_xml('/temp/pidsvcBackup/tests/testthat/data/example_ids.csv', '/temp/example_ids.xml')"
````

