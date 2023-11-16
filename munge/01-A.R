library(readr)
library(dplyr)

##----------------------------Cycle 1-------------------------------------------
#----------------Data preparation and cleaning----------------------------------

# Function to read and process enrollment data and clean them
read_and_process_enrolment <- function(file_path) {
  data <- read_csv(file_path)
  data <- subset(data, country != "Unknown" & gender != "Unknown" & age_range != "Unknown" &
                   highest_education_level  != "Unknown" & employment_status  != "Unknown" &  employment_area != "Unknown")
  selected_data <- select(data, learner_id, role, 
                          gender, country, age_range, highest_education_level, employment_status, 
                          employment_area, detected_country)
  return(selected_data)
}

# Combine all data from enrollment files
combined_data <- NULL
for (i in 1:7) {
  file_path <- paste0("data/cyber-security-", i, "_enrolments.csv")
  selected_data <- read_and_process_enrolment(file_path)
  combined_data <- if (is.null(combined_data)) selected_data else rbind(combined_data, selected_data)
}

# Function to read and process archetype survey responses data
read_and_process_archetype <- function(file_path) {
  data <- read_csv(file_path)
  archetype_data <- select(data, learner_id, archetype)
  return(archetype_data)
}

# Combine all data from archetype survey responses files
combined_archetype_data <- NULL
for (i in 1:7) {
  file_path <- paste0("data/cyber-security-", i, "_archetype-survey-responses.csv")
  archetype_data <- read_and_process_archetype(file_path)
  combined_archetype_data <- if (is.null(combined_archetype_data)) archetype_data else rbind(combined_archetype_data, archetype_data)
}

#------------------------Data Construction--------------------------------------

# Join the two data frames based on the common key (learner_id)
unique_archetype_data <- combined_archetype_data %>% distinct(learner_id, .keep_all = TRUE)
merged_data <- left_join(combined_data, unique_archetype_data, by = "learner_id")

