# insrting previously mapped data into the omop tables -- SINASC --  


# getting mapped tables

care_site <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/care_site.csv') 
condition_occurrence <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/condition_occurrence.csv')
location <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/location.csv') 
measurement <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/measurement.csv') 
observation_period <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/observation_period.csv') 
observation <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/observation.csv')
person <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/person.csv') 
procedure_occurrence <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/procedure_occurrence.csv')
visit_occurrence <- read.csv('C:/Users/danilo.dias/Documents/OMOP_ESTUDOS/data/visit_occurrence.csv') 
) 

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'care_site', 
            data = care_site, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'condition_occurrence', 
            data = condition_occurrence, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE)

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'location', 
            data = location, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'measurement', 
            data = measurement, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'observation_period', 
            data = observation_period, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'observation', 
            data = observation, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'person', 
            data = person, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE)

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'procedure_occurrence', 
            data = procedure_occurrence, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', # Substitua pelo nome do esquema do seu banco de dados
            tableName = 'visit_occurrence', 
            data = visit_occurrence, 
            dropTableIfExists = TRUE, # Defina como TRUE se quiser substituir a tabela existente
            createTable = TRUE, # Defina como TRUE se a tabela ainda não existir
            tempTable = FALSE)




