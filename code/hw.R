library(dplyr)
library(ggplot2)

# Define the selected names for analysis
selected_names <- c("Mary", "John", "James")

# Filter and summarize the data for selected names
filtered_data <- BabyNames %>%
  filter(name %in% selected_names) %>%
  group_by(year, name) %>%
  summarize(total_count = sum(count), .groups = 'drop')

# Plot the popularity of names over time
ggplot(filtered_data, aes(x = year, y = total_count, color = name)) +
  geom_line(linewidth = 1) +
  labs(title = "Name Popularity Over Time", x = "Year", y = "Total Count", color = "Name") +
  theme_minimal()

