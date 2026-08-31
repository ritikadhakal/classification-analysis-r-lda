# Classification Analysis in R — Linear Discriminant Analysis (LDA)

A supervised classification project developed in R, focusing on data preparation, feature selection, classification model comparison, Linear Discriminant Analysis (LDA), and prediction of previously unseen observations.

---

## Project Overview

This project applies supervised machine learning techniques to a structured classification dataset using R.

The main objective is to develop a classification model capable of predicting the target class for previously unseen observations.

The project covers the complete workflow from data loading and preparation to model training, test-set prediction, and generation of a prediction output file.

### Main stages of the analysis

- Data loading
- Data inspection
- Data preprocessing
- Target variable preparation
- Feature selection
- Classification model development
- Model comparison
- Linear Discriminant Analysis (LDA)
- Test-set prediction
- Generation of prediction output

---

## Objective

The primary objective of this project is to build and evaluate classification models and select a suitable model for predicting the target variable.

Several classification approaches were considered during the analysis:

- Linear Discriminant Analysis (LDA)
- Quadratic Discriminant Analysis (QDA)
- Naive Bayes
- K-Nearest Neighbours (KNN, k = 5)

The models were evaluated during the analysis using different random seeds.

Based on the validation results obtained during the analysis, Linear Discriminant Analysis (LDA) was selected as the preferred model for the final test-set prediction.

---

## Technologies and Tools

The project was developed using:

- **R**
- **RStudio**
- **MASS**
- **readr**
- **CSV datasets**
- **Linear Discriminant Analysis (LDA)**

### R Packages

The main R packages used in the final analysis are:

```r
library(readr)
library(MASS)
