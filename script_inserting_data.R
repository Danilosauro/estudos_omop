# insrting previously mapped data into the omop tables -- SINASC --  


# getting mapped tables

care_site <- read.csv('data/care_site.csv') 
condition_occurrence <- read.csv('data/condition_occurrence.csv')
location <- read.csv('data/location.csv') 
measurement <- read.csv('data/measurement.csv') 
observation_period <- read.csv('data/observation_period.csv') 
observation <- read.csv('data/observation.csv')
person <- read.csv('data/person.csv') 
procedure_occurrence <- read.csv('data/procedure_occurrence.csv')
visit_occurrence <- read.csv('data/visit_occurrence.csv') 


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


write.csv(care_site, 'csv/care_site.csv', row.names=False) 
write.csv(condition_occurrence, 'csv/condition_occurrence.csv', row.names=False) 
write.csv(location, 'csv/location.csv', row.names=False) 
write.csv(measurement, 'csv/measurement.csv', row.names=False) 
write.csv(observation_period, 'csv/observation_period.csv', row.names=False) 
write.csv(observation, 'csv/observation.csv', row.names=False) 
write.csv(procedure_occurrence, 'csv/procedure_occurence.csv', row.names =FALSE)




