# Load required libraries
library(readr)     # For reading CSV files
library(MASS)         #for LDA

# Load training data
train_data <- read_csv("C:/Users/ritik/OneDrive/Desktop/Data Analysis/008148/train_data.csv")
View(train_data)

#load test data
test_features <- read_csv("C:/Users/ritik/Downloads/test_features.csv")
View(test_features)

# Convert target column to factor for classification
train_data$target <- as.factor(train_data$target)
test_ids <- test_features$ID    #Extract ID column from test data and store it in test_ids

#  I Prepare training features (drop ID, target, and problematic columns V4, V5)
train_featuress <- train_data[, !(names(train_data) %in% c("ID", "target", "V4", "V5"))]
train_labels <- train_data$target

# I also prepare test features again by dropping (ID, V4, V5)
test_featuress <- test_features[, !(names(test_features) %in% c("ID", "V4", "V5"))]

# I train LDA model with training data set
lda_model <- lda(train_labels ~ ., data = train_featuress)

# I predict on test set
lda_pred <- predict(lda_model, newdata = test_featuress)$class

# # Prepare submission data frame with IDs and Prediction.
submission <- data.frame(ID = test_ids, Prediction = lda_pred)

#  I save the file in csv form with my number
write.csv(submission, "81348_predictions.csv", row.names = FALSE)

# Model Choice:
# After testing multiple classification models — LDA, QDA, Naive Bayes, and KNN (k=5) — 
# across various random seeds (100, 150, 70), 
# LDA consistently achieved the highest accuracy on validation sets.
# Therefore,  I choose LDA as the preferred model for this classification task.
# --------------------------------------------------------------------------------




