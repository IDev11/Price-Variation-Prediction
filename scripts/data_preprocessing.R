# Load necessary libraries
library(dplyr)      # For data manipulation

# Load the dataset
sales_data <- read.csv("data/NASDAQ.csv")

# Step 1: Create the PriceVariation column (difference between Open and Close prices)
sales_data <- sales_data %>%
  mutate(PriceVariation = Open - Close)

# Step 2: Remove unnecessary columns (Open, Close, and Date)
sales_data <- sales_data %>%
  select(-Open, -Close, -Date)

# Step 3: Remove rows where any column has NA or 0
sales_data <- sales_data[!apply(is.na(sales_data) | sales_data == 0, 1, any), ]

# Step 4: Normalize selected numeric columns (High, Low, Adj.Close, Volume)
sales_data_normalized <- sales_data %>%
  mutate(across(c(High, Low, Adj.Close, Volume), ~ scale(.x, center = TRUE, scale = TRUE)))

# Step 5: Split the data into training (80%) and testing (20%) sets
set.seed(123)  # Set seed for reproducibility
train_index <- sample(seq_len(nrow(sales_data_normalized)), size = 0.8 * nrow(sales_data_normalized))
train_data <- sales_data_normalized[train_index, ]
test_data <- sales_data_normalized[-train_index, ]

# Display the first few rows of the normalized dataset
head(sales_data_normalized)
