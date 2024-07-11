# installing required libraries
library(DatabaseConnector)
library(Eunomia)
library(stringr)

setwd(getwd())

# stablishing connections
connectionDetails <- getEunomiaConnectionDetails()
connection <- connect(connectionDetails) 

# getting the amount of tables 

tabelas <- getTableNames(connection, databaseSchema = 'main')
length(tabelas) 

## cleaning all mock data from eunomia library 

for (i in tabelas){ 
  table <- i 
  s <- 'DELETE FROM ${table}' 
  w <- 'SELECT * FROM ${table}' 
  saving <- "csv/${table}.csv"
  
  executeSql(connection, str_interp(s, list(table=i))) 
  
  table_to_save <- querySql(connection, str_interp(w, list(table=i))) 
  
  write.csv(table_to_save, str_interp(saving, list(table=i)), row.names=FALSE)
  }  

          
# Here we start the creation of new tables into the schema

# pregnancy status 

create_table_pregnancy_sql <- "
CREATE TABLE PREGNANCY_TABLE (

PERSON_ID INTEGER,
PREGNANCY_ID INTEGER NOT NULL,
PREGNANCY_START_DATE DATE NOT NULL,
PREGNANCY_END_DATE DATE NOT NULL,
PREGANCY_OUTCOME_ID VARCHAR (50),
PREGNANCY_MODE_DELIVERY VARCHAR(200),
GESTATIONAL_LENGHT_IN_DAY INTEGER NOT NULL NOT NULL,
PREGNANCY_SINGLE INTEGER NOT NULL, 
PREGNANCY_MARITAL_STATUS INTEGER, 
PREGNANCY_NUMBER_FETUSES INTEGER, 
PREGNANCY_NUMBER_LIVEBORN INTEGER, 
PREV_PREGNANCY_PARITY INTEGER, 
PREV_PREGNANCY_GRAVIDITY INTEGER, 
PREV_LIVEBIRTH_NUMBER INTEGER, 
PREV_STILL_MISC_NUMBER INTEGER, 
PREV_TOP_NUMBER INTEGER, 
PREV_TOP12_NUMBER INTEGER, 
PREGNANCY_BMI FLOAT, 
PREGNANCY_FOLIC INTEGER, 
PREGNANCY_TOPFA INTEGER, 
PREGANCY_ART INTEGER, 
PREGNANCY_OUTCOME_SOURCE_VALUE VARCHAR(50), 
PREGNANCY_MODE_DELIVERY_SOURCE_VALUE VARCHAR(50),

FOREIGN KEY (PERSON_ID) REFERENCES person(PERSON_ID), 
PRIMARY KEY (PREGNANCY_ID)

); 
"

executeSql(connection, create_table_pregnancy_sql) 


#child table 

create_table_infant_sql <- " 
CREATE TABLE INFANT_TABLE( 

PREGNANCY_ID INTEGER NOT NULL, 
INFANT_ID INTEGER NOT NULL, 
BIRTH_OUTCOME DATE, 
BIRTH_WEIGHT INTEGER, 
BIRTH_CON_MALFORMATION INTEGER, 
BIRTH_SGA INTEGER, 
BIRTH_FGR INTEGER, 
BIRTH_APGAR INTEGER, 

FOREIGN KEY (PREGNANCY_ID) REFERENCES PREGNANCY_TABLE(PREGNANCY_ID), 
PRIMARY KEY (INFANT_ID)

)
" 

executeSql(connection, create_table_infant_sql) 


# getting the fields of the new tables

infant_table <- querySql(connection, 'SELECT * FROM INFANT_TABLE') 
infant_table 

write.csv(infant_table, "csv/infant_table.csv", row.names=FALSE)

pregnancy_table <- querySql(connection, 'SELECT * FROM PREGNANCY_TABLE') 
pregnancy_table 

write.csv(pregnancy_table, "csv/pregnancy_table.csv", row.names=FALSE)

# getting the new amount of tables

tabelas <- getTableNames(connection, databaseSchema = 'main') 
length(tabelas)  