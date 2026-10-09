# Install and load packages

if(!require("pacman"))install.packages("pacman")

pacman::p_load(readr, dplyr, tidyr, stringr, lubridate, purrr, ggplot2, gridExtra, GGally, corrplot)
pacman::p_load(tidytext, textstem, wordcloud, textdata, topicmodels)
pacman::p_load(DescTools, skimr, finalfit, rstatix, huxtable, jtools)
pacman::p_load(tidymodels)

emp <- read_csv("data/week13_employee.csv")

glimpse(emp)

head(emp, 10)

summary(emp)

str(emp)

emp$Attrition <- factor(emp$Attrition)
emp$Department <- factor(emp$Department)
emp$JobRole <- factor(emp$JobRole)
emp$BusinessTravel <- factor(emp$BusinessTravel)
emp$StockOption <- factor(emp$StockOption)
emp$Gender <- factor(emp$Gender)
emp$MaritalStatus <- factor(emp$MaritalStatus)
emp$EducationField <- factor(emp$EducationField)


glimpse(emp)

# creating recipe

library(tidymodels)

# Create the recipe

attr_recipe <- recipe(Attrition ~ ., data = emp) |>
  step_impute_median(all_numeric_predictors()) |>
  step_impute_mode(all_nominal_predictors()) |>
  step_dummy(all_nominal_predictors()) |>
  step_normalize(all_numeric_predictors())

# Inspect the recipe
attr_recipe



