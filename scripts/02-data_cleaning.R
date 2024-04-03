#### Preamble ####
# Purpose: Cleans the raw lung cancer data to prepare it for analysis.
# Author: Lexi Knight
# Date: 2 April 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: follow 01-download_data.R in scripts folder in order to access raw data

#### Workspace setup ####
# install packages
# install.packages("readr")

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
  select("days_to_death", "ajcc_pathologic_m",
         "ajcc_pathologic_n", "ajcc_pathologic_stage", "ajcc_pathologic_t",
         "treatment_or_therapy", "treatment_type")

# Handle missing or non-numeric values in days_to_death column
cleaned_data <- cleaned_data %>%
  filter(!is.na(days_to_death), !is.na(as.numeric(days_to_death)))

# Exclude rows where any column contains "'--" values
cleaned_data <- cleaned_data %>%
  filter(!if_any(everything(), ~ . == "'--"))


# clean the column names
cleaned_data <- cleaned_data %>%
  rename(
    lymph_node_involvement = ajcc_pathologic_n,
    presence_of_distant_metastasis = ajcc_pathologic_m,
    pathogenic_stage = ajcc_pathologic_stage,
    tumor_size = ajcc_pathologic_t,
    treatment_decision = treatment_or_therapy
  )

# view entire dataset
print(cleaned_data, n = nrow(cleaned_data))

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/lung_cancer_analysis_data.csv")
