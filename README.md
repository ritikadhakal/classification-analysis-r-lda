# Classification Analysis in R — Linear Discriminant Analysis (LDA)

Classification analysis project developed in R, focusing on supervised classification, model comparison, and test-set prediction.

## Project Overview

This project applies classification techniques to a structured dataset using R.

The analysis includes:

- Data loading and preparation
- Feature selection and preprocessing
- Linear Discriminant Analysis (LDA)
- Model comparison
- Test-set prediction
- Generation of a prediction file

## Objective

The main objective was to build a classification model capable of predicting the target class for unseen observations.

Several classification approaches were considered, including:

- Linear Discriminant Analysis (LDA)
- Quadratic Discriminant Analysis (QDA)
- Naive Bayes
- K-Nearest Neighbors (KNN)

Based on the model comparison performed during the analysis, LDA was selected as the preferred classification model.

## Methodology

### 1. Data Preparation

The training and test datasets were loaded using the `readr` package.

The target variable was converted into a factor for classification.

The following columns were excluded from the modelling process:

- `ID`
- `V4`
- `V5`

The `ID` variable was retained separately so that predictions could be associated with the original observations.

### 2. Linear Discriminant Analysis

An LDA model was trained using the training features and target variable.

The model was then used to generate class predictions for the test dataset.

### 3. Model Selection

LDA, QDA, Naive Bayes, and KNN (k = 5) were evaluated during the analysis.

The models were compared across multiple random seeds:

- 100
- 150
- 70

According to the analysis, LDA consistently achieved the highest validation accuracy and was therefore selected for the final prediction task.

## Technologies

- R
- RStudio
- Linear Discriminant Analysis
- QDA
- Naive Bayes
- K-Nearest Neighbors
- `readr`
- `MASS`

## Project Structure

```text
classification-analysis-r-lda/
│
├── README.md
├── classification_lda.R
├── data/
│   └── README.md
└── results/
    └── README.md
