# Bayesian Modeling Regression - Class File

library(tidyverse)
library(rstan)
library(sn)
library(lubridate)
library(stringr)

rmse <- function(error)
{
  sqrt(mean(error^2))
}

skew <- function(x,e,w,a){
  t <- (x-e)/w
  2/w * dnorm(t) * pnorm(a*t)
}

set.seed(9)


### Basic Model

# beginning assumption
n <- 50
x <- seq(from=1, to=n, by=1)
dAlpha <- 10
dBeta <- 2
noise <- rnorm(length(x), mean=0, sd=15)
y <- dAlpha + dBeta*x + noise
# put it in a dataframe
kData <- data.frame(x, y)
# build lm for baseline
# take a look
p <- ggplot(kData, aes(x, y))+geom_point() +
  theme(panel.background = element_rect(fill = "white")) 
p


stanMod2 <- '
data {
  int<lower=0> N;
  vector[N] y;
  vector[N] x;
}
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}
model {
  target += normal_lpdf(y | (alpha + beta*x), sigma);
}
'

fit <- stan(model_code = stanMod2, data = list(
  y= y, 
  N=n, 
  x=x),
  refresh = 0)

sumFit <- summary(fit)

p <- p + geom_abline(intercept = sumFit$summary[1,1], slope = sumFit$summary[2,1],  color = 'gray')
p

stan_trace(fit, inc_warmup = TRUE, pars =c("alpha","sigma"))

plot(fit)

# plot of posterior historgram for parameters

stan_hist(fit, pars =c("beta","sigma", "alpha"))

print(fit, probs=c(0.025, 0.5, 0.975))

### Adding Priors

stanMod2 <- '
data {
  int<lower=0> N;
  vector[N] y;
  vector[N] x;
  real p_alpha;
  real p_alphaSigma;
  real p_beta;
  real p_betaSigma;
}
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}
model {
  target += normal_lpdf(y | (alpha + beta*x), sigma);
  target += cauchy_lpdf(sigma | 0, 10);
  target += normal_lpdf(alpha | p_alpha, p_alphaSigma);
  target += normal_lpdf(beta | p_beta, p_betaSigma);
}
'

# note - always set sigmas with <lower = 0> limit

fit <- stan(model_code = stanMod2, data = list(
  y= y, 
  N=n, 
  x=x, 
  p_alpha = 10, 
  p_alphaSigma = 1,
  p_beta = 2,
  p_betaSigma = 1
), 
refresh = 0)


sumFit = summary(fit)

p = p + geom_abline(intercept = sumFit$summary[1,1], slope = sumFit$summary[2,1], color = 'blue')
p

FitSummary = summary(fit, pars = c('alpha', 'beta'))$summary[,1]
FitSummary

### Changing Priors: alpha to 30 and (from 10) sigma to 10 (from 2)
# also note, you don't have to recompile the model here

fit <- stan(model_code = stanMod2, data = list(
  y= y, 
  N=n, 
  x=x, 
  p_alpha = 30, 
  p_alphaSigma = 10,
  p_beta = 2,
  p_betaSigma = 2
)
, refresh = 0)

sumFit <- summary(fit)
alpha <- sumFit$summary[1,1]
beta <- sumFit$summary[2,1]
p <- p + geom_abline(intercept = sumFit$summary[1,1], slope = sumFit$summary[2,1],  color = 'green')
p

# now, lets tighten up the prior sigma (increase our confidence)

fit <- stan(model_code = stanMod2, data = list(
  y= y, 
  N=n, 
  x=x, 
  p_alpha = 30, 
  p_alphaSigma = 2,
  p_beta = 2,
  p_betaSigma = 2
)
, refresh = 0)

sumFit <- summary(fit)
alpha <- sumFit$summary[1,1]
beta <- sumFit$summary[2,1]

p <- p + geom_abline(slope = beta, intercept = alpha, color = 'red')
p

# print confidence intervals
print(fit, probs=c(0.025, 0.5, 0.975))

