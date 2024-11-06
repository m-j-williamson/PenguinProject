library(tidyverse)
library(palmerpenguins)
library(janitor)
library(here)

# shows first 6 rows
# head(penguins_raw)

# show column names
# colnames(penguins_raw)

# Write data to csv using here
# write.csv(penguins_raw, here("data", "penguins_raw.csv"))
# Puts in folder "data" and names file "penguins_raw.csv"

# use select and hyphen to remove comments column
# penguins_raw <- select(penguins_raw, -Comments)
# this is bad practice as it overwrites the code
# only use once and recall from file afterwards

# colnames(penguins_raw)

penguins_raw <- read.csv(here("data", "penguins_raw.csv"))

# make new variable and remove comments
# this is better practice

# penguins_clean <- select(penguins_raw, -Comments)

# Using piping to remove comments and delta columns
# penguins_clean <- penguins_raw %>% 
  # select(-Comments) %>%
  # select(-starts_with("Delta"))

# colnames(penguins_clean)

# Using janitor function to clean up names
penguins_clean <- penguins_raw %>% 
  select(-Comments) %>%
  select(-starts_with("Delta")) %>% 
  clean_names()

colnames(penguins_clean)

write.csv(penguins_clean, here("data", "penguins_clean.csv"))

# Creating a function called cleaning_penguin_columns:
# head(penguins_clean)

cleaning_penguin_columns <- function(raw_data){
  raw_data %>% 
    clean_names() %>% 
    select(-comments) %>% 
    select(-starts_with("Delta"))
}

#Using new function to clean data
penguins_clean <- cleaning_penguin_columns(penguins_raw)

colnames(penguins_clean)


### Loading functions file
# Usually at top of file below loading packages

source(here("functions", "cleaning.R"))

renv::init()
renv::snapshot()

# Restore packages from a lock file
# renv::restore()
