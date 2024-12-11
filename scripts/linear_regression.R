# Load necessary libraries
install.packages("caret")
library(caret)

# 1. Train the linear regression model using the training data
model <- lm(PriceVariation ~ ., data = train_data)

# 2. Display the summary of the linear regression model
summary(model)

# 3. Make predictions on the test set
predictions <- predict(model, newdata = test_data)

# 4. Calculate Evaluation Metrics

# MAE (Mean Absolute Error)
mae <- mean(abs(predictions - test_data$PriceVariation))

# MSE (Mean Squared Error)
mse <- mean((predictions - test_data$PriceVariation)^2)

# R-squared
rsq <- 1 - sum((predictions - test_data$PriceVariation)^2) / 
  sum((test_data$PriceVariation - mean(test_data$PriceVariation))^2)

cat("MAE:", mae, "\n")
cat("MSE:", mse, "\n")
cat("R-squared:", rsq, "\n")

# 5. Cross-validation setup and training using 'caret' package
# Set up training control for 10-fold cross-validation
train_control <- trainControl(method = "cv", number = 10)  # 10-fold CV (u can change this khawti, try different values)

# Train the linear regression model using cross-validation
cv_model <- train(PriceVariation ~ ., data = sales_data_normalized, method = "lm", trControl = train_control)

print(cv_model)
