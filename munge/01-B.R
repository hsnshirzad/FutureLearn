library(readr)
library(dplyr)

##----------------------------Cycle 2-------------------------------------------
#----------------Data preparation and cleaning----------------------------------

# Function to read and process leaving survey data
read_and_process_leaving <- function(file_path) {
  data <- read_csv(file_path)
  leaving_data <- select(data, learner_id, left_at, leaving_reason, last_completed_step_at,
                         last_completed_step, last_completed_week_number,
                         last_completed_step_number)
  return(leaving_data)
}

# Initialize an empty list to store data for each cycle
list_of_data <- list()

# Loop through each cycle (i)
for (i in 1:7) {
  
  # Read and process enrollment data for the current cycle
  enrolment_file_path <- paste0("data/cyber-security-", i, "_enrolments.csv")
  enrolment_data <- read_and_process_enrolment(enrolment_file_path)
  
  # Read and process archetype data for the current cycle
  archetype_file_path <- paste0("data/cyber-security-", i, "_archetype-survey-responses.csv")
  archetype_data <- read_and_process_archetype(archetype_file_path)
  
  # Read and process leaving survey data for the current cycle
  leaving_file_path <- paste0("data/cyber-security-", i, "_leaving-survey-responses.csv")
  leaving_data <- read_and_process_leaving(leaving_file_path)
  
  # Join leaving survey data with enrollment data based on learner_id
  leaving_enrollment_data <- left_join(leaving_data, enrolment_data, by = "learner_id")
  
  # Join the result with archetype data based on learner_id
  full_data <- left_join(leaving_enrollment_data, archetype_data, by = "learner_id")
  
  # Save the result in the list
  list_of_data[[i]] <- full_data
  
}

# Combine the list of data into a single data frame
leaving_with_profile_data <- do.call(rbind, list_of_data)
