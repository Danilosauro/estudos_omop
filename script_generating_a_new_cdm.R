# New approach

# getting new table structures
pregnancy_table_info <- dbGetQuery(connection, "PRAGMA table_info(pregnancy_table)")
infant_table_info <- dbGetQuery(connection, "PRAGMA table_info(infant_table)")


library(DatabaseConnector)
library(dplyr)

# geeting new table details

get_table_info <- function(conn, table_name) {
  query <- paste0("PRAGMA table_info(", table_name, ")")
  table_info <- dbGetQuery(conn, query) %>%
    mutate(table = table_name, 
           required = if_else(notnull == 1, 'Yes', 'No'),
           description = dflt_value, 
           schema = 'cdm') %>%
    select(table, name, required, type, description, schema) %>%
    rename(field = name)
  
  return(table_info)
}


pregnancy_table_info <- get_table_info(connection, "pregnancy_table")
infant_table_info <- get_table_info(connection, "infant_table") 


# binding tables
table_info <- bind_rows(pregnancy_table_info, infant_table_info)


# read a CDM csv file (here at CIDACS we are currently working with 5.3 or 5.4 versions)

CDM <- read.csv('CDMS/CDMV5.4.csv') 

# binding informations of our new tables with cdm information
combined_info <- bind_rows(CDM, table_info)

# saving inside the directory
write_csv(combined_info, "NEW_CDM/CDM_CIDACS_PHDC.csv") 


# after that you can use your NEW CDM on rabbit in a hat