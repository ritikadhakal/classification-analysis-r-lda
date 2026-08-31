# Classification Analysis in R — Linear Discriminant Analysis (LDA)

Classification analysis project developed in R, focusing on supervised classification, model comparison, and test-set prediction.

## Project Overview

This project applies supervised classification techniques to a structured dataset using R.

The main objective is to develop a classification model capable of predicting the target class for previously unseen observations.

The analysis includes:

- Data loading and preparation
- Feature selection and preprocessing
- Linear Discriminant Analysis (LDA)
- Comparison of classification models
- Test-set prediction
- Generation of a prediction file

## Objective

The objective of this project is to build and evaluate classification models and select the model that provides the strongest validation performance.

After comparing several classification approaches, Linear Discriminant Analysis (LDA) was selected as the preferred model.

## Technologies

- R
- RStudio
- Linear Discriminant Analysis (LDA)
- MASS
- readr
- CSV data

## Dataset

The dataset used for this analysis is not included in this repository.

The training dataset contains the target variable used for classification, while the test dataset contains observations for which predictions are generated.

The following variables were excluded from the modelling process:

- `ID`
- `V4`
- `V5`

The `target` variable was converted to a factor for classification.

> **Note:** The datasets are kept private and are therefore not uploaded to this repository.

## Methodology

### 1. Data Preparation

The training and test datasets were loaded using the `readr` package.

The target variable was converted into a factor to allow classification modelling.

The `ID` variable was retained separately so that it could be included in the final prediction file.

### 2. Feature Selection

The following variables were removed before modelling:

```text
ID
V4
V5
