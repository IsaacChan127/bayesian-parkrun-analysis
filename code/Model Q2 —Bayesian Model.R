
# Load libraries
library(dplyr)
library(brms)

# Load data
data_2024 <- readRDS("data/parkrun2024.rds")

# Split and combine data
male_data <- filter(data_2024, Gender == "Male")
female_data <- filter(data_2024, Gender == "Female")

combined_data <- bind_rows(male_data, female_data)

# Remove missing values
combined_data <- na.omit(combined_data)

# Fit hierarchical model
model2_hier <- brm(
  Time ~ Gender + (1 | Location),
  data = combined_data,
  family = gaussian(),
  prior = c(
    prior(normal(0, 5), class = "b"),
    prior(normal(20, 5), class = "Intercept"),
    prior(exponential(1), class = "sigma")
  ),
  chains = 4,
  cores = 4,
  seed = 42
)

# Summary
summary(model2_hier)

# Diagnostic plots
plot(model2_hier)
