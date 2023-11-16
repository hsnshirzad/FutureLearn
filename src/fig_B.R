library(readr)
library(dplyr)
library(ggplot2)
library(extrafont)

#-----------------------------------Cycle1--------------------------------------

theme_set(theme_minimal(base_family = "Sawasdee"))

#-------------------------------------------------------------------------------
# Creating a figure based on leaving reasons 

ggplot(leaving_with_profile_data, aes(x = leaving_reason)) +
  geom_bar(fill = "#FFD700" , color = "#4F94CD",  
           size = 1, width = 0.7, position = "dodge") +  
  labs(title = "Leaving reasons based on attendees claim",
       x = "Leaving reasons",
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


#-------------------------------------------------------------------------------
# Creating a figure based on gender distribution of leavers

pastel_colors <- c("#FFB6C1", "#ADD8E6", "#B0E57C")
leaving_with_gender_data <- subset(leaving_with_profile_data, gender != "NA")

filtered_data_percent <- leaving_with_gender_data %>%
  group_by(gender) %>%
  summarise(percent = n() / nrow(leaving_with_gender_data) * 100) %>%
  arrange(desc(gender))

# Create a pie chart with percentages
ggplot(filtered_data_percent, aes(x = "", y = percent, fill = gender)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  labs(title = "Distribution of Leaving attendees based on their Gender",
       fill = "Gender")+
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 6, family = "Sawasdee"), 
    axis.text.y = element_text(size = 7, family = "Sawasdee"),
    axis.title = element_text(size = 10, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.border = element_blank()) +
  
  scale_fill_manual(values = pastel_colors) +
  geom_text(aes(label = sprintf("%.1f%%", percent)), position = position_stack(vjust = 0.7))

#-------------------------------------------------------------------------------
# Creating a figure based on archetype distribution of leavers

leaving_with_arcetype_data <- subset(leaving_with_profile_data, archetype != "NA")

pastel_colors <- c("#FFB6C1", "#ADD8E6", "#98FB98", "#FFD700", "#FFA07A", "#87CEEB", "#C71585", "#FF6347")
filtered_data_percent <- leaving_with_arcetype_data %>%
  group_by(archetype) %>%
  summarise(percent = n() / nrow(leaving_with_arcetype_data) * 100) %>%
  arrange(desc(archetype))

# Create a pie chart with percentages
ggplot(filtered_data_percent, aes(x = "", y = percent, fill = archetype)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  labs(title = "Distribution of leveing leaners by their archetype",
       fill = "Archetype")+
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 0, family = "Sawasdee"), 
    axis.text.y = element_text(size = 6, family = "Sawasdee"),
    axis.title = element_text(size = 10, family = "Sawasdee"),
    plot.title = element_text(size = 10, hjust = 0.5 , family = "Sawasdee", face = "bold"),
    legend.title = element_text(size = 8,  family = "Sawasdee"),
    legend.text = element_text(size = 8, family = "Sawasdee"),
    panel.border = element_blank()) +
  scale_fill_manual(values = pastel_colors) +
  geom_text(aes(label = sprintf("%.1f%%", percent)), position = position_stack(vjust = 0.7))



