# instalação de bibliotecas 

library(DatabaseConnector)
library(Achilles)
library(Eunomia)
library(DataQualityDashboard) 
library(stringr)


# estabelecimento das conexões 
connectionDetails <- getEunomiaConnectionDetails()
connection <- connect(connectionDetails) 

# verificando a quantidade inicial de tabelas 

tabelas <- getTableNames(connection, databaseSchema = 'main')
length(tabelas) 

## limpeza dos dados após adquirir a base do eunomia 

for (i in tabelas){ 
  table <- i 
  s <- 'DELETE FROM ${table}' 
  w <- 'SELECT * FROM ${table}' 
  saving <- "C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/csv/${table}.csv"
  
  executeSql(connection, str_interp(s, list(table=i))) 
  
  table_to_save <- querySql(connection, str_interp(w, list(table=i))) 
  
  write.csv(table_to_save, str_interp(saving, list(table=i)), row.names=FALSE)
  }  


          
# processo de inserção de novas tabelas no esquema 

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

inserting_data <- " 
INSERT INTO INFANT_TABLE VALUES(
1,1,'2014/05/01',1,1,1,1,1
)

"

executeSql(connection, inserting_data)


# Verificar se a tabela foi criada e os dados falsos inseridos regularmente 

infant_table <- querySql(connection, 'SELECT * FROM INFANT_TABLE') 

infant_table

pregnancy_table <- querySql(connection, 'SELECT * FROM PREGNANCY_TABLE') 

# salvar o csv após inserção

write.csv(infant_table, "C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/csv/infant_table.csv", row.names=FALSE)
write.csv(pregnancy_table, "C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/csv/pregancy_table.csv", row.names=FALSE)


# verificando a nova quantidade de tabelas 

tabelas <- getTableNames(connection, databaseSchema = 'main') 
length(tabelas)  

# desconectar a conexão 


disconnect(connection) 
closeAllConnections()

?Eunomia
?DatabaseConnector 


