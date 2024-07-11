# plotting 

library(ggplot2) 
library(RColorBrewer)


# QUERYING DATa
person_data_query <- querySql(connection, 'SELECT * FROM PERSON') 
condition_occurrence_data_query <- querySql(connection, 'SELECT * FROM CONDITION_OCCURRENCE') 
observation_data_query <- querySql(connection, 'SELECT * FROM OBSERVATION') 
visit_occurrence_data_query <- querySql(connection, 'SELECT * FROM VISIT_OCCURRENCE') 
procedure_occurrence_data_query <- querySql(connection, 'SELECT * FROM PROCEDURE_OCCURRENCE')

ggplot(person_data_query, aes(x = as.factor(ETHNICITY_CONCEPT_ID))) +
  geom_bar() +
  labs(title = "ETHNICAL GROUPS",
       x = "Ethnicity Concept ID",
       y = "COUNTS") +
  theme_minimal()  

ggplot(person_data_query, aes(x = as.factor(GENDER_CONCEPT_ID))) +
  geom_bar() +
  labs(title = "GENDER DISTRIBUTION",
       x = "GENDER CONCEPT ID",
       y = "COUNTS") +
  theme_minimal() 

ggplot(person_data_query, aes(x =as.factor(RACE_CONCEPT_ID))) +
  geom_bar() +
  labs(title = "RACE CONCEPTS",
       x = "RACE CONCEPT IDS",
       y = "COUNTS") +
  theme_minimal()
observation


ggplot(condition_occurrence_data_query, aes(x =as.factor(CONDITION_TYPE_CONCEPT_ID))) +
  geom_bar() +
  labs(title = "CONDITION TYPES",
       x = "CONDITION TYPES CONCEPT IDS",
       y = "COUNTS") +
  theme_minimal()  

ggplot(observation, aes(x =as.factor(observation_concept_id))) +
  geom_bar() +
  labs(title = "CONDITION TYPES",
       x = "CONDITION TYPES CONCEPT IDS",
       y = "COUNTS") +
  theme_minimal() 
observation 

ggplot(visit_occurrence_data_query, aes(x =as.factor(VISIT_CONCEPT_ID))) +
  geom_bar() +
  labs(title = "VISIT CONCEPT",
       x = "VISIT CONCEPT IDS",
       y = "COUNTS") +
  theme_minimal() 
observation 

colors <- brewer.pal(n = length(unique(procedure_occurrence_data_query$procedure_concept_id)), name = "Set3")

ggplot(procedure_occurrence_data_query, aes(x =as.factor(PROCEDURE_CONCEPT_ID)), fill = factor(PROCEDURE_CONCEPT_ID)) +
  geom_bar() +
  labs(title = "PROCEDURE CONCEPT",
       x = "PROCEDURE CONCEPT IDS",
       y = "COUNTS", 
       fill = 'PROCEDURE_CONCEPT_ID') +
  theme_minimal() + 
  scale_fill_manual(values = colors)
