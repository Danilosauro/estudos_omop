install.packages('omopgenerics')
library(omopgenerics)
library(dplyr)


# getting_tables  

omopColumns('person', required = TRUE, version = '5.3') 
omopColumns('care_site', required = TRUE, version = '5.3') 


# getting all tables

tables <- getTableNames(connection, databaseSchema = 'main') 


for (table in tables){ 
  columns <- omopColumns(table, required = TRUE, version = '5.3')
  }
) 

# Loop para atualizar cada coluna para TRUE
for (column_name in names(columns)) {
  update_columns_to_true(column_name)
}

# Desconectar do banco de dados
disconnect(connectionDetails)



person_required_fields<- omopColumns('person', required = TRUE, version = '5.4')

for (column_name in person_required_fields){
  sql_query <- paste("UPDATE person SET", column_name, " =NOT NULL")
  
  # Execute a consulta
  executeSql(connection, sql_query)
  }


