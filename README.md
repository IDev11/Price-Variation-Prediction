# Stock Price Prediction using Linear Regression

This project demonstrates a stock price prediction model using a linear regression approach on stock data. It includes data preprocessing steps to clean and normalize the data, followed by training a linear regression model and evaluating its performance using common regression metrics.

## Project Structure

- **data_preprocessing.R**: This script performs data preprocessing tasks such as creating new features, removing unnecessary columns, and normalizing the dataset. It also splits the data into training and testing sets.
  
- **linear_regression.R**: This script trains a linear regression model on the preprocessed data, evaluates it using metrics like Mean Absolute Error (MAE), Mean Squared Error (MSE), and R-squared, and performs cross-validation to assess model performance.

## Requirements

Before running the scripts, make sure you have the following R packages installed:

- `dplyr` - For data manipulation
- `lubridate` - For working with date objects
- `caret` - For training the linear regression model and performing cross-validation

You can install these packages using the following commands if they are not already installed:

```r
install.packages("dplyr")
install.packages("lubridate")
install.packages("caret")
```

## Data

The dataset used in this project is a CSV file named `NASDAQ.csv`, which contains stock price data. Ensure that the file is located in the `data/` directory of your project or update the file path accordingly.

The CSV file is expected to have the following columns:

- `Open` - The opening price of the stock for the day
- `Close` - The closing price of the stock for the day
- `High` - The highest price of the stock during the day
- `Low` - The lowest price of the stock during the day
- `Adj.Close` - The adjusted closing price of the stock
- `Volume` - The number of shares traded on the day
- `Date` - The date of the stock data (will be removed during preprocessing)

## Data Preprocessing

### Steps in `data_preprocessing.R`:
1. **Load Data**: Load the stock price data from the `NASDAQ.csv` file.
2. **Create `PriceVariation` Column**: Calculate the difference between the opening and closing prices and store it in a new column called `PriceVariation`.
3. **Remove Unnecessary Columns**: Drop the `Open`, `Close`, and `Date` columns, which are no longer needed for modeling.
4. **Normalize Numeric Columns**: Normalize the selected numeric columns (High, Low, Adj.Close, Volume, and PriceVariation) using z-score standardization (mean = 0, standard deviation = 1).
5. **Split Data**: Split the data into training (80%) and testing (20%) sets for model evaluation.

### Example:
```r
# Run data preprocessing
source("data_preprocessing.R")
```

## Linear Regression Modeling and Evaluation

### Steps in `linear_regression.R`:
1. **Train Linear Regression Model**: Train a linear regression model on the preprocessed training data.
2. **Model Summary**: Display the summary of the trained linear regression model.
3. **Make Predictions**: Use the trained model to make predictions on the test data.
4. **Evaluate Model**: Calculate and display evaluation metrics:
   - **MAE (Mean Absolute Error)**: Measures the average magnitude of the errors in a set of predictions.
   - **MSE (Mean Squared Error)**: Measures the average of the squares of the errors.
   - **R-squared**: A statistical measure of the fit of the regression model.
5. **Cross-Validation**: Use 10-fold cross-validation to train the linear regression model and assess its performance.

### Example:
```r
# Run linear regression model training and evaluation
source("linear_regression.R")
```

### Evaluation Metrics:
- **MAE**: The mean absolute error between the predicted and actual values.
- **MSE**: The mean squared error between the predicted and actual values.
- **R-squared**: A measure of how well the model fits the data (higher values indicate a better fit).

## Usage

### Run the Scripts:
1. **Data Preprocessing**:
   - Make sure your dataset (`NASDAQ.csv`) is in the correct location.
   - Run `data_preprocessing.R` to preprocess the data and split it into training and test sets.

2. **Linear Regression Modeling**:
   - After preprocessing the data, run `linear_regression.R` to train the model, evaluate it, and perform cross-validation.

### Example Execution:
```r
# Load and preprocess the data
source("data_preprocessing.R")

# Train and evaluate the linear regression model
source("linear_regression.R")
```

## Outputs

1. **Model Summary**: After training the linear regression model, the script will display the summary of the model.
   
2. **Evaluation Metrics**: The MAE, MSE, and R-squared values will be printed in the console to evaluate the model's performance.

3. **Cross-validation Results**: The results from the 10-fold cross-validation will be printed, showing the model’s average performance across different splits of the data.

