# Bayesian Analysis of Parkrun Data

## Problem Overview

This project analyses parkrun data from 8 locations in Devon using Bayesian statistical methods.

The objectives are:
- Model the number of finishers at each location using count data
- Analyse fastest finishing times using hierarchical models
- Perform posterior predictive inference for future events

The analysis is conducted using real-world data and focuses on probabilistic modelling, inference, and prediction.

## Tasks

1. Model participation levels across locations and estimate the probability of the highest turnout
2. Analyse fastest finishing times using a hierarchical Bayesian model
3. Perform predictive simulations for future events using posterior samples

## Methods
- Bayesian Poisson regression (count modelling)
- Hierarchical linear regression (multilevel modelling)
- Posterior predictive simulation
- Model comparison using LOO-CV

## Key Results
- Exmouth predicted as highest participation location
- Male runners finish ~3 minutes faster on average
- Moderate variation across locations captured via random effects

## Tools
- R
- brms (Stan backend)
- dplyr, ggplot2

## Project Structure
- `/code`: model scripts
- `/figures`: plots
- `report.pdf`: full coursework write-up

## Full Report

For a detailed academic write-up of this project, including model formulation, prior choices, posterior inference, and evaluation, please refer to:

📄 `report.pdf`

The report demonstrates end-to-end Bayesian modelling using R and Stan.
