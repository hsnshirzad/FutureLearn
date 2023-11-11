library(ggplot2)

# Assuming 'selected_data' is a subset of your original data
# Replace 'selected_data' with your actual data frame

# Filter out countries with only one learner
filtered_data <- combined_data %>%
  group_by(country) %>%
  filter(n() > 1) %>%
  ungroup()

ggplot(filtered_data, aes(x = "", fill = country)) +
  geom_bar(width = 1, color = "white") +
  coord_polar("y") +
  labs(title = "Distribution of Learners by Country",
       fill = "Country") +
  theme_minimal()

summary_table <- combined_data %>%
  group_by(country) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

# Lighter green color
lighter_blue <- "skyblue"

# Create a plot with the lighter green color for the distribution of learner roles
ggplot(combined_data, aes(x = gender)) +
  geom_bar(fill = lighter_blue, color = "skyblue",  # Lighter green and Blue colors
           size = 1, width = 0.7, position = "dodge") +  # Adjust size, width, and position
  labs(title = "Distribution of Learner Gender",
       x = "Gender",
       y = "Count") +
  theme_minimal() +  # Use a minimal theme for a clean look
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels for better readability
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.1)))  # Expand y-axis for better spacing


library(ggplot2)

# Create a plot with the lighter green color for the distribution of learner roles
ggplot(combined_data, aes(x = age_range)) +
  geom_bar(fill = "red" , color = "blue",  # Lighter green and Blue colors
           size = 1, width = 0.7, position = "dodge") +  # Adjust size, width, and position
  labs(title = "Distribution of Learner Roles",
       x = "Age Range",
       y = "Count") +
  theme_minimal() +  # Use a minimal theme for a clean look
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels for better readability
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.1)))  # Expand y-axis for better spacing
