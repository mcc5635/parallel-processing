# Run a bayesian regression with 1000 chains without timing out

# Code with parallel
  library(rstan)
  library(rstanarm)
  library(dplyr)
    
set.seed(1999)

tic()

num_cores <- parallel::detectCores()
cl <- makeCluster(num_cores - 2)
registerDoParallel(cl)

for (i in 1:3) {

  # parallel loop to fit stan_glm models
  bayes_reg <- foreach(i = 1:1, .combine = "c") %dopar% {

    stan_glm(as.formula(paste("test", "~object")),
             data = data %>% filter(gedad == unique(data$gedad)[1]),
             chain = 50,
             # prior = normal(normal_reg$coefficients[2], summary(normal_reg)$coefficients[4]),
             refresh = 0
    }
}

  # stop bayes_reg function looping
  summary(bayes_reg, digits = 5) %>% print()

  coefficients_by[i] <- data.table(bayes_reg$coefficients)
  predictions_by[i] <- data.table(predict(bayes_reg, newdata = data2 %>%
                                          filter(gedad == unique(data$gedad)[i])))
  #print(coefficients_by)
}

stopCluster(cl)
toc()












