#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
# install packages
install.packages("readr")

# load libraries 
library(tidyverse)
library(readr)

#### Clean data ####

# read the csv file 
raw_data <- read_csv("data/raw_data/lung_cancer_raw.csv")

# check column names of raw_data
colnames(raw_data)

# select columns of interest 
cleaned_data <- raw_data |>
  select("days_to_death", "age_at_diagnosis", "ajcc_pathologic_m",
         "ajcc_pathologic_n", "ajcc_pathologic_stage", "ajcc_pathologic_t",
         "treatment_or_therapy", "treatment_type")

# check data types of columns 
str(cleaned_data)

# handle missing or non-numeric values
cleaned_data <- cleaned_data %>%
  filter(!is.na(days_to_death), !is.na(age_at_diagnosis)) %>%
  mutate_at(vars(days_to_death, age_at_diagnosis), as.numeric)

# create new column for survival_post_diagnosis
cleaned_data <- cleaned_data %>%
  mutate(survival_post_diagnosis = days_to_death - age_at_diagnosis)

# Delete columns "days_to_death" and "age_at_diagnosis"
cleaned_data <- cleaned_data %>%
  select(-c(days_to_death, age_at_diagnosis))

# clean the column names
cleaned_data <- cleaned_data %>%
  rename(
    lymph_node_involvement = ajcc_pathologic_n,
    presence_of_distant_metastasis = ajcc_pathologic_m,
    pathogenic_stage = ajcc_pathologic_stage,
    tumor_size = ajcc_pathologic_t,
    treatment_decision = treatment_or_therapy
  )

# view first few rows of cleaned dataset
head(cleaned_data)
  


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/lung_cancer_analysis_data.csv")
