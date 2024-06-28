# install dependencies

library(rstan)
library(rstanarm)
library(tidyverse)
library(stringr)
library(openxlsx)
library(tictoc)
library(parallel)



seq <- data.table(
  sample = c(rep(c("A", "B", "C", "D", "E", "F"), 6)),
  test = c(rep(c(20:25), 6),
           rep(c(20:25) + 1, 6),
           rep(c(20:25) + 2, 6),
           rep(c(20:25) + 3, 6),
           rep(c(20:25) + 4, 6),
           rep(c(20:25) + 5, 6),
  object = c(rep(2006, 6), rep(2012, 6), rep(2014, 6),
           rep(2018, 6), rep("2018 - aj.", 6), rep(2023, 6))
  )
  data <- seq %>%
    filter(!object %in% c("2018-aj.", "2018"))) %>%
    mutate(object = as.numeric(object) - 2006)

  data2 <- seq %>%
    filter(!object %in% c("2018-aj.", "2018"))) %>%
    mutate(object = as.numeric(object) - 2006)

















           
