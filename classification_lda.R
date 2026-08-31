# ============================================================
# Classification Analysis using Linear Discriminant Analysis
# ============================================================

# Load required libraries
library(readr)
library(MASS)

# ------------------------------------------------------------
# 1. Load Data
# ------------------------------------------------------------

# Training and test datasets should be placed in the data/ folder
train_data <- read_csv("data/train_data.csv")
test_features <- read_csv("data/test_features.csv")

# ------------------------------------------------------------
# 2. Prepare Data
# ------------------------------------------------------------

# Convert target variable to factor for classification
train_data$target <- as.factor(train_data$target)

# Extract ID column from test data
test_ids <- test_features$ID

# ------------------------------------------------------------
# 3. Prepare Training Features
# ------------------------------------------------------------

# Remove ID, target, and problematic columns V4 and V5
train_features <- train_data[
  !(names(train_data) %in% c("ID", "target", "V4", "V5"))
]

# Store the target variable separately
train_labels <- train_data$target

# ------------------------------------------------------------
# 4. Prepare Test Features
# ------------------------------------------------------------

# Remove ID and problematic columns V4 and V5
test_features_clean <- test_features[
  !(names(test_features) %in% c("ID", "V4", "V5"))
]

# ------------------------------------------------------------
# 5. Train LDA Model
# ------------------------------------------------------------

lda_model <- lda(
  train_labels ~ .,
  data = train_features
)

# ------------------------------------------------------------
# 6. Generate Test-Set Predictions
# ------------------------------------------------------------

lda_pred <- predict(
  lda_model,
  newdata = test_features_clean
)$class

# ------------------------------------------------------------
# 7. Create Prediction Output
# ------------------------------------------------------------

submission <- data.frame(
  ID = test_ids,
  Prediction = lda_pred
)

# Save predictions as a CSV file
write.csv(
  submission,
  "81348_predictions.csv",
  row.names = FALSE
)

# ------------------------------------------------------------
# 8. Model Selection
# ------------------------------------------------------------

# LDA, QDA, Naive Bayes, and KNN (k = 5) were tested
# across multiple random seeds: 100, 150, and 70.
#
# Based on the model comparison performed during the analysis,
# LDA consistently achieved the highest validation accuracy.
#
# Therefore, LDA was selected as the preferred model for the
# final classification and test-set prediction.
