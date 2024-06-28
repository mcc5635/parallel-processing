# Run a bayesian regression with 1000 chains without timing out

# Code with parallel
  library(rstan)
  library(rstanarm)
  library(dplyr)
    
set.seed(1984)

tic()

num_cores <- parallel::detectCores()
cl <- makeCluster(num_cores - 2)
registerDoParallel(cl)

for (i in 1:3) {

  # parallel loop to fit stan_glm models
  bayes_reg <- foreach(i = 1:1, .combine = "c") %dopar% {

  stan_glm(as.formula(paste("employment", "~anio")),
           data = tasas %>% filter(gedad == unique(tasas$gedad)[1]),
           chain = 50,
           # prior = normal(normal_reg$coefficients[2], summary(normal_reg)$coefficients[4]),
           refresh = 0
  }
}

# stop loop














