# An analysis of Lung Cancer Treatment Response Post-Diagnosis

## Overview

We examine data concerning the response of lung caner patients to treatment post-diagnosis. Lung cancer, being one of the leading causes of cancer-related deaths worldwide, necessitates a comprehensive understanding of treatment effectiveness to improve patient outcomes and refine medical interventions. Our  objective is to analyze and model pathogenic stage and treatment type to patient survival. By leveraging statistical methodologies, specifically a Bayesian hierarchical model, we aim to elucidate the factors influencing greater survival and uncover insights into the effectiveness of different treatment approaches.

## File Structure

The repo is structured as:
-   `data/raw_data` contains the raw data as obtained from X.
-   `data/analysis_data` contains the cleaned data set that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Accessing data

Steps to Download data
1. Go to https://osf.io/search?activeFilters=%5B%5D&sort=-relevance&view_only= 
2. Type in search bar "Lung Cancer"
3. Select the project "Lung cancer Predictions" by Sicong Chen(Magic)
4. Under files, click  plus sign on "OSF Storage (Australia - Sydney) to expand 
files 
5. Click "Lung_Cancer_Meta.xlsx" 
6. There are two tabs containing two differnt datasets, select "clinical_info" 
and click download the dataset as an excel file. 

## Statement on LLM usage
The abstract, introduction, data, results, discussion and conclusion were written with the help of ChatGPT and the entire chat history is available in inputs/llms/usage.txt.


