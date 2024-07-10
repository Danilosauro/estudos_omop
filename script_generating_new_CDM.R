library(dplyr)
library(readr)


# sQL query

get_column_info <- function(table_name) {
  query <- paste0("PRAGMA table_info(", table_name, ");")
  columns <- dbGetQuery(connection, query)
  columns <- columns %>%
    mutate(
      TABLE_NAME = table_name,
      COLUMN_NAME = name,
      IS_NULLABLE = ifelse(notnull == 1, "NO", "YES"),
      DATA_TYPE = type,
      DESCRIPTION = ""
    ) %>%
    select(TABLE_NAME, COLUMN_NAME, IS_NULLABLE, DATA_TYPE, DESCRIPTION)
  return(columns)
}

# getting all collumns

all_columns <- bind_rows(lapply(tabelas, get_column_info))

# Saving 
write_csv(all_columns, "CDM/CIDACS_PHDC_CDM.csv")

paste 
