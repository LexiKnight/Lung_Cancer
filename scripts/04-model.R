#### Preamble ####
# Purpose: To create the logistic regression model.
# Author: Lexi Knight
# Date: 4 April 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: follow 01-download_data.R and run 02-data_cleaning.R in scripts in order to obtain raw and cleaned data. Run 03-test_data.R to test cleaned dataset.  

# note about approach: linear model (ch. 13.2, logistic regression model )
# note, must delete treatment_decision from entire analysis. 

#### Workspace setup ####
# install packages
# install.packages("broom.mixed")
# install.packages("dplyr")
# install.packages("rstanarm")
# install.packages("tidyverse")

# load packages
library(broom.mixed)
library(dplyr)
library(rstanarm)
library(tidyverse)

#### Read data ####
analysis_data <- read.csv(file = here::here("data/analysis_data/lung_cancer_analysis_data.csv"))

### Model data ####
set.seed(123) # setting seed for reproducibility

## Linear Regression Model 
# interested in predicting days_to_death, a continuous outcome variable based on
# multiple predictor variables  (pathogenic_stage, lymph_node_involvement, 
# presence_of_distant_metastasis, tumor_size, treatment_decision, treatment_type)
# Linear regression model are suitable for predicting continuous outcomes
# quantifying relationship between predictor variables and outcome variable. 

# Fit a linear regression model to predict continuous outcome variable 
# 'days_to_death', using stan_glm
linear_model <- stan_glm( # Bayesian generalized linear models via Stan
  formula = days_to_death ~  pathogenic_stage + lymph_node_involvement +
    presence_of_distant_metastasis + tumor_size + treatment_type,
  data = analysis_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)

# summarize the model 
summary(linear_model)


#### Save model ####
saveRDS(
 linear_model,
 file = "models/linear_model.rds"
)


