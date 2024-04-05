#### Preamble ####
# Purpose: Tests the cleaned dataset
# Author: Lexi Knight
# Date: 28 March 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: follow 01-download_data.R and run 02-data_cleaning.R in scripts in order to obtain raw and cleaned data. 


#### Workspace setup ####

# install packages 
# install.packages("tidyverse")
# install.packages("testthat")
# install.packages("here")
# install.packages("arrow")
# install.packages("dplyr")

# load libraries
# library(tidyverse) # maybe dont need
library(testthat)
library(here)
library(arrow) # needed to read parquet
# library(dplyr) # maybe dont need

#### Test data ####

test_that("Data Cleaning Tests", {
  # load packages
  suppressWarnings(library(tidyverse))
  suppressWarnings(library(dplyr))
  
  # load data
  analysis_data <- read_parquet(file = here::here("data/analysis_data/lung_cancer_analysis_data.parquet"))
  
  # Test if the dataset has 382 entries
  expect_equal(nrow(analysis_data), 382)
  
  # Test if 'pathologic_stage' contains the correct categories 
  expect_true(all(analysis_data$pathologic_stage %in% c('Stage I', 'Stage IA', 'Stage IB', 'Stage II', 'Stage IIA', 'Stage IIB', 'Stage III', 'Stage IIIA', 'Stage IIIB', 'Stage IV')))
  
  # Test if 'lymph_node_involvement' contains the correct categories 
  expect_true(all(analysis_data$lymph_node_involvement %in% c('N0', 'N1', 'N2', 'N3', 'NX')))
  
  # Test if 'presence_of_metastasis' contains the correct categories
  expect_true(all(analysis_data$presence_of_distant_metastasis %in% c('MX', 'M0', 'M1', 'M1a', 'M1b')))
  
  # Test if 'tumor_size' contains the correct categories 
  expect_true(all(analysis_data$tumor_size %in% c('T1', 'T1a', 'T1b', 'T2', 'T2a', 'T2b', 'T3', 'T4', 'TX')))

  # Test if 'days_to_death' is numeric 
  expect_true(all(is.numeric(analysis_data$days_to_death)))
  
  # Check the data types again
  print(class(analysis_data$days_to_death))
  
  # Test if 'treatment_type' only contains 'Pharmaceutical Therapy, NOS' and 'Radiation Therapy, NOS'
  expect_true(all(analysis_data$treatment_type %in% c('Pharmaceutical Therapy, NOS', 'Radiation Therapy, NOS')))
}) 

