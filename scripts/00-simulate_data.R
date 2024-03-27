#### Preamble ####
# Purpose:Stimulates the clean dataset used for the model
# Author: Lexi Knight
# Date: 26 March 2024
# Contact: lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: -
# Any other information needed? -


#### Workspace setup ####
# install packages 
# install.packages("tidyverse")

# load packages
library(tidyverse)
library(testthat)



#### Simulate data ####


data <- 
  tibble( 
    level = rnorm(n = 1000, mean = 100, sd = 10) |> floor()
    weakness = sample(x = c("fire", "not fire"), size = 1000, replace = TRUE)
    
    
    
    
    
    