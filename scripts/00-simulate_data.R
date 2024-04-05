#### Preamble ####
# Purpose:Stimulates the clean dataset used for the model
# Author: Lexi Knight
# Date: 26 March 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
# install packages 
# install.packages("tidyverse")

# load packages
library(tidyverse)


#### Simulate data ####

# Set seed for reproducibility
set.seed(0)

# Number of entries
num_entries <- 981

# Simulating the data 
simulated_data <- data.frame(
  ajcc_pathologic_n = sample(c("N0", "N1", "N2", "NX"), num_entries, replace = TRUE),
  ajcc_pathologic_m = sample(c("M0", "MX", "M1a", "M1b"), num_entries, replace = TRUE),
  ajcc_pathologic_t = sample(c("T1", "T1a", "T1b", "T2", "T2a", "T2b", "T3", "T4", "TX"), num_entries, replace = TRUE),
  days_to_death = round(runif(num_entries, min = 0, max = 6236)),
  ajcc_pathologic_stage = sample(c("Stage IA", "Stage IIA", "Stage IIIA", "Stage IB", "Stage IIB", "Stage IV", "Stage I"), num_entries, replace = TRUE),
  treatment_type = sample(c("Pharmaceutical Therapy, NOS", "Radiation Therapy, NOS"), num_entries, replace = TRUE)
)


# Renaming variables for clarity 
simulated_data <- simulated_data %>%
  rename(
    pathologic_stage = ajcc_pathologic_stage,
    lymph_node_involvement = ajcc_pathologic_n,
    presence_of_distant_metastasis = ajcc_pathologic_m,
    tumor_size = ajcc_pathologic_t,
  )

simulated_data <- simulated_data |> select(pathologic_stage,
                                            lymph_node_involvement,
                                            presence_of_distant_metastasis,
                                            tumor_size, days_to_death,
                                            treatment_type)


# Show a summary of the data
summary(simulated_data)