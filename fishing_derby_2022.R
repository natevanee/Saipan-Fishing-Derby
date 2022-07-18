library(googlesheets4)
library(tidyverse)


derby <- read_sheet("https://docs.google.com/spreadsheets/d/16m528RnUj2wd-WQIka-GbMnU_k9dhxcqHOtO9HKUUGo/edit#gid=0",
                    sheet = "catch_data")

# Calculate (for each team) the best fish for each category of fish 

top_fish_by_team <- derby %>%
  filter(!(fish_type %in% c("No Catch", "Disqualified"))) %>%
  group_by(team, fish_type) %>%
  summarise(weight_lbs = max(weight_lbs))

# print results
print(top_fish_by_team)  


# Of the best fish submitted, what are the top 3 in each category?
# Winner by category
winners_by_group <- top_fish_by_team %>%
  group_by(fish_type) %>%
slice_max(order_by = weight_lbs, n = 3)

# Write the results to a csv file
winners_by_group %>%
  mutate(rank = rank(desc(weight_lbs))) %>%
  write_csv("2022-07-16_winners.csv")

# Find out which fish no longer qualify for the total weight category
# because they are already used in a different category, or are under 15 lbs

# Find fish ids for fish that have already been submitted in a different category
fish_out <- winners_by_group %>% 
  inner_join(derby) %>%
  pull(fish_id)


total_weight <- derby %>%
  # remove fish that have been submitted in a different category
  filter(!(fish_id %in% fish_out)) %>%
  # remove fish that are under 15 lbs
  filter(weight_lbs >= 15) %>%
  # Caculate the remaining sum of lbs for each team
  group_by(team) %>%
  summarise(total_weight = sum(weight_lbs)) %>%
  # arrange results to show winner on top
  arrange(desc(total_weight))

# print the total weight results
print(total_weight)

