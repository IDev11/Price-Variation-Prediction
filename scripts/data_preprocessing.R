# Load necessary libraries
library(dplyr)
library(lubridate)  # For working with Date objects

# Load dataset
sales_data <- read.csv("data/NASDAQ.csv")

# 1. Create the PriceVariation column (Open - Close)
sales_data <- sales_data %>%
  mutate(PriceVariation = Open - Close)

# 2. Remove the Open and Close columns
sales_data <- sales_data %>%
  select(-Open, -Close)

# 3. Convert the 'Date' column to Date class
sales_data <- sales_data %>%
  mutate(Date = as.Date(Date, format = "%Y-%m-%d"))

# 4. Extract Year, Month, and Day from Date
sales_data <- sales_data %>%
  mutate(
    Year = year(Date),   
    Month = month(Date), 
    Day = day(Date)
  )

# 5. Remove the 'Date' column after extracting Year, Month, Day
sales_data <- sales_data %>%
  select(-Date)

# 6. Normalize selected numeric columns
sales_data_normalized <- sales_data %>%
  mutate(across(c(High, Low, Adj.Close, Volume, PriceVariation), scale))

# 7. Remove Year, Month, Day columns (if needed for model)
sales_data_normalized <- sales_data_normalized %>%
  select(-Year, -Month, -Day)

# 8. Split data into training (80%) and testing (20%) sets
set.seed(123)  # For reproducibility
train_index <- sample(seq_len(nrow(sales_data_normalized)), size = 0.8 * nrow(sales_data_normalized))
train_data <- sales_data_normalized[train_index, ]
test_data <- sales_data_normalized[-train_index, ]

# Display a preview of the final processed data (Optional)
head(sales_data_normalized)
