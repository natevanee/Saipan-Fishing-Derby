# Saipan-Fishing-Derby
Data collected by DLNR-DFW at Saipan's fishing derby and the code used to process the data and determine the winners in each category.

This is a trolling based fishing derby that targets the following 5 species/groups.

1. Mahi Mahi
2. Marlin (and other billfish)
3. Skipjack (tuna)
4. Wahoo
5. Yellowfin (tuna)

The dataset should not be viewed as a complete record of all the fish caught during the derby, but is a record of all fish that were officially weighed by DLNR-DFW staff at the event. It is likely that many fish caught did not get weighed if the competitors felt that their fish did not have a chance to place in any of the winning categories.

The rules for the derby (that relate to the code used to process the data) are as follows:

Each competitor is only allowed to submit 1 fish to each category (i.e. Mahi, Marlin, Skipjack, Wahoo, and Yellowfin.) Thus, a competitor can not win multiple places in the same category.

A fish can only be used once. For example, a 300 lb Marlin that places in the one of the top 3 slots in the Marlin category cannot also count towards the total weight category.

Total weight = the weight of all fish >= 15 lbs that have not already been used in a different category (again, no double dipping).
