library(readr)
library(dplyr)


file_path = "data/cyber-security-7_enrolments.csv"
data <- read_csv(file_path)

column_names <- names(data)
print(column_names)

# Remove Rows with Unknown country
data <- subset(data, country != "Unknown")

# Select the specified fields
selected_data <- select(data, learner_id, role, 
                        gender, country, age_range, highest_education_level, employment_status, 
                        employment_area, detected_country)
# Display the cleaned data
head(selected_data)