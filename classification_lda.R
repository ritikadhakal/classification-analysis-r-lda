# ============================================================
# Classification Analysis in R - Linear Discriminant Analysis
# ============================================================

# Load required libraries
library(readr)
library(MASS)

# ------------------------------------------------------------
# 1. Load data
# ------------------------------------------------------------
# The datasets are kept private and are not included in this
# GitHub repository.
#
# Update these paths to the location of the datasets on your
# computer before running the script.

train_data <- read_csv("path/to/train_data.csv")
test_features <- read_csv("path/to/test_features.csv")

# View the datasets
View(train_data)
View(test_features)

# ------------------------------------------------------------
# 2. Prepare the target variable
# ------------------------------------------------------------

# Convert target variable to a factor for classification
train_data$target <- as.factor(train_data$target)

# Store test IDs for the final prediction file
test_ids <- test_features$ID

# ------------------------------------------------------------
# 3. Prepare training features
# ------------------------------------------------------------

# Remove ID, target, and problematic variables
# V4 and V5 were excluded from the analysis.
train_features <- train_data[
  !(names(train_data) %in% c("ID", "target", "V4", "V5"))
]

# Store classification labels
train_labels <- train_data$target

# ------------------------------------------------------------
# 4. Prepare test features
# ------------------------------------------------------------

# Remove variables that are not used by the model
test_features_model <- test_features[
  !(names(test_features) %in% c("ID", "V4", "V5"))
]

# ------------------------------------------------------------
# 5. Train LDA model
# ------------------------------------------------------------

lda_model <- lda(
  train_labels ~ .,
  data = train_features
)

# Display model information
print(lda_model)

# ------------------------------------------------------------
# 6. Predict test observations
# ------------------------------------------------------------

lda_pred <- predict(
  lda_model,
  newdata = test_features_model
)$class

# Display predictions
print(lda_pred)

# ------------------------------------------------------------
# 7. Create prediction file
# ------------------------------------------------------------

submission <- data.frame(
  ID = test_ids,
  Prediction = lda_pred
)

# Save predictions
write.csv(
  submission,
  "81348_predictions.csv",
  row.names = FALSE
)

# ------------------------------------------------------------
# 8. Model selection
# ------------------------------------------------------------

# Multiple classification models were evaluated during the
# analysis, including:
#
# - Linear Discriminant Analysis (LDA)
# - Quadratic Discriminant Analysis (QDA)
# - Naive Bayes
# - K-Nearest Neighbours (KNN, k = 5)
#
# The models were evaluated across different random seeds
# (100, 150, and 70).
#
# LDA consistently achieved the highest validation accuracy
# and was therefore selected as the preferred model.
#
# ------------------------------------------------------------
# End of analysis
# ------------------------------------------------------------
