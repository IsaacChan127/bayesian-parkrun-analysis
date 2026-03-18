# Bayesian Analysis of Parkrun Data

## Overview
This project applies Bayesian statistical modelling to analyse parkrun participation and performance across locations.

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
