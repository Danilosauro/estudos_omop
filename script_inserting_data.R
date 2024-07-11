# inserting previously mapped data into the OMOP tables -- SINASC --  

# getting mapped tables

care_site <- read.csv('MOCK_DATA/care_site.csv') 
condition_occurrence <- read.csv('MOCK_DATA/condition_occurrence.csv')
location <- read.csv('MOCK_DATA/location.csv') 
measurement <- read.csv('MOCK_DATA/measurement.csv') 
observation_period <- read.csv('MOCK_DATA/observation_period.csv') 
observation <- read.csv('MOCK_DATA/observation.csv')
person <- read.csv('MOCK_DATA/person.csv') 
procedure_occurrence <- read.csv('MOCK_DATA/procedure_occurrence.csv')
visit_occurrence <- read.csv('MOCK_DATA/visit_occurrence.csv') 


insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'care_site', 
            data = care_site, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'condition_occurrence', 
            data = condition_occurrence, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE)

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'location', 
            data = location, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'measurement', 
            data = measurement, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'observation_period', 
            data = observation_period, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'observation', 
            data = observation, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'person', 
            data = person, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE)

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'procedure_occurrence', 
            data = procedure_occurrence, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE) 

insertTable(connection = connection, 
            databaseSchema = 'main', 
            tableName = 'visit_occurrence', 
            data = visit_occurrence, 
            dropTableIfExists = TRUE, 
            createTable = TRUE, 
            tempTable = FALSE) 


write.csv(care_site, 'EUNOMIA_CSV_TABLES/care_site.csv', row.names=FALSE) 
write.csv(condition_occurrence, 'EUNOMIA_CSV_TABLES/condition_occurrence.csv', row.names=FALSE) 
write.csv(location, 'EUNOMIA_CSV_TABLES/location.csv', row.names=FALSE) 
write.csv(measurement, 'EUNOMIA_CSV_TABLES/measurement.csv', row.names=FALSE) 
write.csv(observation_period, 'EUNOMIA_CSV_TABLES/observation_period.csv', row.names=FALSE) 
write.csv(observation, 'EUNOMIA_CSV_TABLES/observation.csv', row.names=FALSE) 
write.csv(procedure_occurrence, 'EUNOMIA_CSV_TABLES/procedure_occurence.csv', row.names =FALSE) 
write.csv(visit_occurrence,'EUNOMIA_CSV_TABLES/visit_occurrence.csv', row.names=FALSE)




