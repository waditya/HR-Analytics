# Load the readr package
library(readr)

# Import the recruitment data
recruitment <- read_csv("recruitment_data.csv")

# Look at the first few rows of the dataset
head(recruitment)

##Identifying groups in data
# Help the talent acquisition team understand which recruiting channel will produce the best sales hires. 
#Let us apply the HR analytics process to help them. 
#Let us examine the recruiting channels in the data.

# Load the dplyr package
library(dplyr)
