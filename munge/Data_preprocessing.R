library(readr)
library(dplyr)


library(readr)
library(dplyr)

file_path = "data/cyber-security-7_enrolments.csv"
data <- read_csv(file_path)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data7 <- select(data, learner_id, role, 
                         gender, country, age_range, highest_education_level, employment_status, 
                         employment_area, detected_country)

file_path = "data/cyber-security-6_enrolments.csv"
data <- read_csv(file_path)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data6 <- select(data, learner_id, role, 
                         gender, country, age_range, highest_education_level, employment_status, 
                         employment_area, detected_country)

file_path = "data/cyber-security-5_enrolments.csv"
data <- read_csv(file_path)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data5 <- select(data, learner_id, role, 
                         gender, country, age_range, highest_education_level, employment_status, 
                         employment_area, detected_country)

file_path = "data/cyber-security-4_enrolments.csv"
data <- read_csv(file_path)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data4 <- select(data, learner_id, role, 
                         gender, country, age_range, highest_education_level, employment_status, 
                         employment_area, detected_country)

file_path = "data/cyber-security-3_enrolments.csv"
data <- read_csv(file_path)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data3 <- select(data, learner_id, role, 
                         gender, country, age_range, highest_education_level, employment_status, 
                         employment_area, detected_country)

file_path = "data/cyber-security-2_enrolments.csv"
data <- read_csv(file_path)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data2 <- select(data, learner_id, role, 
                         gender, country, age_range, highest_education_level, employment_status, 
                         employment_area, detected_country)

file_path = "data/cyber-security-1_enrolments.csv"
data <- read_csv(file_path)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data1 <- select(data, learner_id, role, 
                         gender, country, age_range, highest_education_level, employment_status, 
                         employment_area, detected_country)


combined_data <- rbind(selected_data1, selected_data2, selected_data3, 
                       selected_data4, selected_data5, selected_data6, selected_data7)