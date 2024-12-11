# Load necessary libraries
library(dplyr)      # For data manipulation
library(lubridate)  # For working with Date objects

sales_data <- read.csv("data/NASDAQ.csv")

# Step 1: Create the PriceVariation column (Open - Close)
sales_data <- sales_data %>%
  mutate(PriceVariation = Open - Close)

# Step 2: Remove unnecessary columns (Open, Close, and Date)
sales_data <- sales_data %>%
  select(-Open, -Close, -Date)

# Step 3: Normalize selected numeric columns (Handling potential NA values)
sales_data_normalized <- sales_data %>%
  mutate(across(c(High, Low, Adj.Close, Volume, PriceVariation), ~scale(.x, center = TRUE, scale = TRUE)))

# Step 4: Split data into training (80%) and testing (20%) sets
set.seed(123)  
train_index <- sample(seq_len(nrow(sales_data_normalized)), size = 0.8 * nrow(sales_data_normalized))
train_data <- sales_data_normalized[train_index, ]
test_data <- sales_data_normalized[-train_index, ]


head(sales_data_normalized)
