library(readr)
library(dplyr)
library(ggplot2)
library(extrafont)

#-----------------------------------Cycle1--------------------------------------

theme_set(theme_minimal(base_family = "Sawasdee"))

#-------------------------------------------------------------------------------
# Creating a figure based on gender 

ggplot(combined_data, aes(x = gender)) +
  geom_bar(fill ="#FFCCCB", color = "#4F94CD", 
           size = 1, width = 0.8, position = "dodge") +
  labs(title = "Distribution of Learner Gender",
       x = "Gender",
       y = "Count") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8, family = "Times"), 
    axis.text.y = element_text(size = 7, family = "Sawasdee"),
    axis.title = element_text(size = 10, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = "gray"))

#-------------------------------------------------------------------------------
# Creating a figure based on age_range 

ggplot(combined_data, aes(x = age_range)) +
  geom_bar(fill = "#CBFFEB" , color = "#4F94CD",  
           size = 1, width = 0.7, position = "dodge") +  
  labs(title = "Distribution of Learner Age",
       x = "Age Range",
       y = "Count") +
  theme(
    axis.text.x = element_text(angle = 30, hjust = 1, size = 8, family = "Times"), 
    axis.text.y = element_text(size = 7, family = "Sawasdee"),
    axis.title = element_text(size = 10, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = "gray"))


#-------------------------------------------------------------------------------
# Creating a figure based on highest_education_level 

ggplot(combined_data, aes(x = highest_education_level)) +
  geom_bar(fill = '#FFF7CB' , color = "#4F94CD",  
           size = 1, width = 0.7, position = "dodge") +  
  labs(title = "Distribution of Learner Education level",
       x = "Highest education level",
       y = "Count") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8, family = "Times"), 
    axis.text.y = element_text(size = 7, family = "Sawasdee"),
    axis.title = element_text(size = 10, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = "gray"))

#-------------------------------------------------------------------------------
# Creating a figure based on employment_status 

ggplot(combined_data, aes(x = employment_status)) +
  geom_bar(fill = "#F0CBFF" , color = "#4F94CD",  
           size = 1, width = 0.7, position = "dodge") +  
  labs(title = "Distribution of Learner Employment status",
       x = "Employment status",
       y = "Count") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8, family = "Times"), 
    axis.text.y = element_text(size = 7, family = "Sawasdee"),
    axis.title = element_text(size = 10, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = "gray"))

#-------------------------------------------------------------------------------
# Creating a figure based on employment_area 

ggplot(combined_data, aes(x = employment_area)) +
  geom_bar(fill = "#FFDACB" , color = "#4F94CD",  
           size = 1, width = 0.7, position = "dodge") +  # Adjust size, width, and position
  labs(title = "Distribution of Learner Employment area",
       x = "Employment area",
       y = "Count") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 6, family = "Times"), 
    axis.text.y = element_text(size = 7, family = "Sawasdee"),
    axis.title = element_text(size = 10, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = "gray"))

#-------------------------------------------------------------------------------
# Creating a figure based on country

filtered_data_percent <- combined_data %>%
  group_by(country) %>%
  summarise(percent = n() / nrow(combined_data) * 100) %>%
  arrange(desc(percent))

pie_chart <- ggplot(filtered_data_percent %>% slice_head(n = 20), aes(x = "", y = percent, fill = country)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  labs(title = "Distribution of Learners by Country",
       fill = "country")+
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 2, family = "Sawasdee"), 
    axis.text.y = element_text(size = 2, family = "Sawasdee"),
    axis.title = element_text(size = 2, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = "gray")) 

pie_chart + guides(fill = guide_legend(ncol = 2))

#-------------------------------------------------------------------------------
# Creating a figure based on archetype

ggplot(combined_archetype_data, aes(x = archetype)) +
  geom_bar(fill = "#C8A2C8" , color = "#4F94CD",  
           size = 1, width = 0.7, position = "dodge") +  
  labs(title = "Distribution of Learners by Archetype",
       x = "Archetype",
       y = "Count") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 6, family = "Times"), 
    axis.text.y = element_text(size = 8, family = "Sawasdee"),
    axis.title = element_text(size = 8, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.background = element_rect(fill = "white", color = NA),  # Light pastel purple
    plot.background = element_rect(fill = "white", color = "gray"))



