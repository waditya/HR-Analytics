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

#Take a look at the sales recruiting data, recruitment, with summary()
# Get an overview of the recruitment data
summary(recruitment)

#Using summary() didn't tell us much about the recruiting_source variable, because read_csv() imported it as a character vector. 
#By using count() on the recruiting_source column to get more information.

# See which recruiting sources the company has been using
recruitment %>% count(recruiting_source)

#Sales numbers by recruiting source
# Find the average sales quota attainment
recruitment %>%
  summarize(avg_sales_quota_pct = mean(sales_quota_pct)) 

# Find the average sales quota attainment for each recruiting source
avg_sales <- recruitment %>% group_by(recruiting_source) %>% summarize(avg_sales_quota_pct = mean(sales_quota_pct))

# Display the result
avg_sales

# Find the average attrition for the sales team, by recruiting source, sorted from lowest attrition rate to highest
avg_attrition <- recruitment %>%
  group_by(recruiting_source) %>% 
  summarize(attrition_rate = mean(attrition)) %>% 
  arrange(attrition_rate)

# Display the result
avg_attrition

# Load the ggplot2 package
library(ggplot2)

# Plot the bar chart
ggplot(avg_sales, aes(x = recruiting_source, y = avg_sales_quota_pct)) +
  geom_col()
