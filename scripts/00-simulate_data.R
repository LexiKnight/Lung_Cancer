#### Preamble ####
# Purpose:Stimulates the clean dataset used for the model
# Author: Lexi Knight
# Date: 26 March 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A


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
  age_at_diagnosis = round(runif(num_entries, min = 14681, max = 32872)),
  days_to_death = round(runif(num_entries, min = 0, max = 6236)),
  race = sample(c("not reported", "white", "american indian or alaska native", "asian", "black or african american"), num_entries, replace = TRUE),
  ajcc_pathologic_stage = sample(c("Stage IA", "Stage IIA", "Stage IIIA", "Stage IB", "Stage IIB", "Stage IV", "Stage I"), num_entries, replace = TRUE),
  treatment_type = sample(c("Pharmaceutical Therapy, NOS", "Radiation Therapy, NOS"), num_entries, replace = TRUE),
  treatment = sample(c("yes", "no", "not reported"), num_entries, replace = TRUE)
) 


# Renaming variables for clarity 
simulated_data <- simulated_data %>%
  rename(
    Pathogenic_Stage = ajcc_pathologic_stage,
    Lymph_Node_Involvement = ajcc_pathologic_n,
    Presence_of_Metastasis = ajcc_pathologic_m,
    Tumor_Size = ajcc_pathologic_t,
    Age_at_Diagnosis_in_Days = age_at_diagnosis,
    Days_to_Death = days_to_death,
    Race = race,
    Treatment_Type = treatment_type,
    Treatment_Decision = treatment
  )


simulated_data <- simulated_data |> select( Pathogenic_Stage,
                                            Lymph_Node_Involvement,
                                            Presence_of_Metastasis, Tumor_Size,
                                            Age_at_Diagnosis_in_Days,
                                            Days_to_Death, Race, Treatment_Type,
                                            Treatment_Decision)



# View first few rows of the simulated data
head(simulated_data)

# Show a summary of the data
summary(simulated_data)

