
# Load libraries
library(dplyr)
library(brms)

# Load data
data_2024 <- readRDS("data/parkrun2024.rds")

# Filter male records to avoid duplication
data_male <- filter(data_2024, Gender == "Male")

# Summarise total finishers by location
location_finishers <- data_male %>%
  group_by(Location) %>%
  summarise(TotalFinishers = sum(Finishers), .groups = "drop")

# Fit Bayesian Poisson regression model
model_q1 <- brm(
  TotalFinishers ~ Location,
  data = location_finishers,
  family = poisson(),
  prior = c(
    prior(normal(0, 5), class = "b"),
    prior(normal(10, 5), class = "Intercept")
  ),
  chains = 4,
  cores = 4,
  seed = 123
)

# Summary
summary(model_q1)

# Extract coefficients
intercept <- 8.99
coefs <- list(
  "Exeter_Riverside" = 0.43,
  "Exmouth" = 0.94,
  "Haldon_Forest" = 0.14,
  "Killerton" = 0.53,
  "Parke" = -0.24,
  "Sharpham" = -0.47,
  "Teignmouth" = 0.74
)

# Predicted finishers
predicted_finishers <- sapply(coefs, function(beta) exp(intercept + beta))

# Create dataframe for plotting
predicted_df <- data.frame(
  Location = names(predicted_finishers),
  ExpectedFinishers = as.numeric(predicted_finishers)
)

# Plot
library(ggplot2)

ggplot(predicted_df, aes(x = reorder(Location, -ExpectedFinishers), y = ExpectedFinishers)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Predicted Finishers by Location",
    x = "Location",
    y = "Predicted Number of Finishers"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
