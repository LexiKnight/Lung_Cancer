#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Lexi Knight
# Date: 28 March 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)


#### Test data ####



# Testing the simulated table - * i think i should just move this to the testing file ****

# Test if the dataset has 981 entries 
test_that("Dataset has 981 entries", {
  expect_equal(nrow(simualted_data), 981)
})

# Test if 'Pathogenic_Stage' contains the correct categories 
test_that("Pathogenic stage variable is correct", {
  expect_true(all(simulated_data$Pathogenic_Stage %in% c('Stage IA', 'Stage IIA', 'Stage IIIA', 'Stage IB', 'Stage IIB', 'Stage IV', 'Stage I')))
})

# Test if 'Lymph_Node_Involvement' contains the correct categories 
test_that("Lymph node involvement variable is correct", {
  expect_true(all(simulated_data$Lymph_Node_Involvement %in% c('N0', 'N1', 'N2', 'NX')))
})

# Test if 'Presence_of_Metastasis' contains the correct categories 
test_that("Presence of metastasis variable is correct", {
  expect_true(all(simulated_data$Presence_of_Metastasis %in% c('M0', 'MX', 'M1a', 'M1b')))
})

# Test if 'Tumor_Size' contains the correct categories 
test_that("Tumor size variable is correct", {
  expect_true(all(simulated_data$Tumor_Size %in% c('T1', 'T1a', 'T1b', 'T2', 'T2', 'T2b', 'T3', 'T4', 'TX')))
})

# Test if 'Age_at_Diagnosis_in_Days is numeric 
class(simulated_data$Age_at_Diagnosis_in_Days) == "numeric"

# Test if 'Days_to_Death' is numeric 
class(simulated_data$Days_to_Death) == "numeric"

# Test if 'Race' contains the correct categories 
test_that("Race variable is correct", {
  expect_true(all(simulated_data$Race %in% c('not reported", "white", "american indian or alaska native", "asian", "black or african american')))
})

# Test if 'Treatment_Type' only contains 'Pharmaceutical Therapy, NOS' and 'Radiation Therapy, NOS'
test_that("Treatment type variable is correct", {
  expect_true(all(simulated_dat$Treatment_Type %in% c('Pharmaceutical Therapy, NOS', 'Radiation Therapy, NOS')))
})

# Test if 'Treatment_Decision" contains the correct categories 
test_that("Treatment decision variable is correct", {
  expect_true(all(simulated_data$Treatment_Decision %in% c('yes', 'no', 'not reported')))
})



