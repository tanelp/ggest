funding = read.table("data-raw/startup_funding.txt", header=TRUE)
devtools::use_data(funding, overwrite = TRUE)
