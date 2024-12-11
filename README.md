# README: Linear Regression Analysis for Price Variation

## Project Overview
This project involves building a linear regression model to predict the `PriceVariation` of stock data based on several features. The dataset was preprocessed, normalized, and split into training and testing sets. Additionally, cross-validation was performed to validate the model's robustness.

## Steps Performed

### 1. Data Preprocessing
- **Input Dataset**: A CSV file (`NASDAQ.csv`) containing stock data with columns like `Open`, `Close`, `High`, `Low`, `Volume`, and `Date`.
- **Derived Features**:
  - `PriceVariation` = `Open` - `Close`
  - Temporal features: `Year`, `Month`, and `Day` extracted from the `Date` column.
- **Normalization**:
  - Continuous columns (`High`, `Low`, `Adj.Close`, `Volume`, `PriceVariation`) were normalized using `scale()`.
- **Removed Temporal Columns**:
  - A secondary dataset was created by removing `Year`, `Month`, and `Day` for additional analysis.

### 2. Model Building and Evaluation
- **Model**: Linear Regression.
- **Training/Test Split**:
  - 80% of the data was used for training.
  - 20% of the data was used for testing.
- **Evaluation Metrics**:
  - **MAE (Mean Absolute Error)**
  - **MSE (Mean Squared Error)**
  - **R-squared**
- **Results**:
  - On the test set:
    - MAE: 0.2994
    - MSE: 0.1348
    - R-squared: 0.8512

### 3. Cross-Validation
- **Method**: 10-fold cross-validation using the `caret` package.
- **Results**:
  - RMSE: 0.3745
  - R-squared: 0.8606
  - MAE: 0.2943

### 4. Tools and Libraries Used
- **R Libraries**:
  - `dplyr`: Data manipulation.
  - `lubridate`: Date handling.
  - `caret`: Cross-validation and model training.

## Files Included
1. **`data_preprocessing.R`**:
   - Script for loading and preprocessing the data.
2. **`linear_regression.R`**:
   - Script for training the model, evaluating performance, and performing cross-validation.
3. **`README.md`** (this file):
   - Overview of the project.

## How to Run the Project
1. **Setup Environment**:
   - Install necessary R packages:
     ```R
     install.packages(c("dplyr", "lubridate", "caret"))
     ```
2. **Preprocess the Data**:
   - Run the `data_preprocessing.R` script to generate the normalized dataset.
3. **Train and Evaluate the Model**:
   - Run the `linear_regression.R` script to train the linear regression model and evaluate its performance.

## Results Summary
The linear regression model performed well with an R-squared value of ~85% on the test set, indicating a strong fit. Cross-validation results were consistent, suggesting the model generalizes well to unseen data.

## Next Steps
- Experiment with additional features or transformations.
- Explore regularization techniques (e.g., Ridge or Lasso regression) to prevent overfitting.
- Investigate alternative models such as Random Forest or Gradient Boosting for comparison.

