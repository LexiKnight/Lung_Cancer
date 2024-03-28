#### Preamble ####
# Purpose: Downloads and saves the lung cancer dataset from the OSF dataverse
# database with the variables of interest. 
# Author: Lexi Knight
# Date: 28 March 2024
# Contact: Lexi.Knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: -



#### Workspace setup ####
# install packages 

#load packages 

library(tidyverse)
library(dataverse)
library(gutenbergr)
library(janitor)
library(knitr)
library(readr)

#### Download data ####

lung_cancer_data <- get_dataframe_by_name(
    filename = "Lung_Cancer_Meta.csv"
    dataset = "https://osf.io/qk34b/"
    server = "open.science.framework.io"
    .f = read_csv
  ) 


#### Save data ####

# change the_raw_data to Lung_Cancer_raw_dataset.csv
write_csv(lung_cancer_data, "inputs/data/raw_data/Lung_Cancer_raw_dataset.csv") 

      
