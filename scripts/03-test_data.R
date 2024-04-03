#### Preamble ####
# Purpose: Tests the cleaned dataset
# Author: Lexi Knight
# Date: 28 March 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: follow 01-download_data.R and run 02-data_cleaning.R in scripts in order to obtain raw and cleaned data. 


#### Workspace setup ####

#install packages 
#install.packages("tidyverse")
#install.packages("testthat")
#install.packages("here")



#### Load data ####

test_that("Data Cleaning Tests", {
  # load data
  analysis_data <- read.csv(file = here::here("data/analysis_data/lung_cancer_analysis_data.csv"))
  
  # load packages
  library(tidyverse)
  library(testthat)
  library(here)
  
  # Test if the dataset has 346 entries
  expect_equal(nrow(analysis_data), 346)
  
  # Test if 'Pathogenic_Stage' contains the correct categories 
  expect_true(all(analysis_data$pathogenic_stage %in% c('Stage I', 'Stage IA', 'Stage IB', 'Stage II', 'Stage IIA', 'Stage IIB', 'Stage III', 'Stage IIIA', 'Stage IIIB', 'Stage IV')))
  
  # Test if 'Lymph_Node_Involvement' contains the correct categories 
  expect_true(all(analysis_data$lymph_node_involvement %in% c('N0', 'N1', 'N2', 'NX')))
  
  # Test if 'Presence_of_Metastasis' contains the correct categories
  expect_true(all(analysis_data$presence_of_distant_metastasis %in% c('MX', 'M0', 'M1', 'M1a', 'M1b')))
  
  # Test if 'Tumor_Size' contains the correct categories 
  expect_true(all(analysis_data$tumor_size %in% c('T1', 'T1a', 'T1b', 'T2', 'T2a', 'T2b', 'T3', 'T4', 'TX')))
  
  # Test if 'Days_to_Death' is numeric 
  expect_true(is.numeric(analysis_data$days_to_death))
  
  # Test if 'Treatment_Type' only contains 'Pharmaceutical Therapy, NOS' and 'Radiation Therapy, NOS'
  expect_true(all(analysis_data$treatment_type %in% c('Pharmaceutical Therapy, NOS', 'Radiation Therapy, NOS')))
  
  # Test if 'Treatment_Decision" only contains 'yes' and 'no' 
  expect_true(all(analysis_data$treatment_decision %in% c('yes', 'no')))
}) 


