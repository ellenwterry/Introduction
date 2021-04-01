
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


### Categorical Variables =========== focus here for homework!!!

N = 100
vAcct = c("Acct1", "Acct2", "Acct3")

N  = N*length(vAcct)
Intercept = 0
Slope = 1

likeData = data.frame(account = vAcct,
                      PIntercept = c(Intercept-2, Intercept, Intercept+2),
                      x = runif(N, min = 1, max = 9)) %>%
  mutate(y = PIntercept + (Slope * x) + rnorm(N, 0, sd = 2))

likeData$account <- as.factor(likeData$account)

# boxplot (really good for understanding categorical distributions)

ggplot(likeData, aes(x=account, y=y))+ 
  geom_boxplot() +
  theme(panel.background = element_rect(fill = "white")) +
  coord_flip()

#Another visualization:

p <- ggplot(likeData, aes(x, y, color = account))+geom_point()+
  theme(panel.background = element_rect(fill = "white")) 
p

# Baseline with lm

lmMod <- lm(y ~ account + x, data=likeData)
# if you're going to use lm coefficients, set up equation to 
# fit categorical first (gets same values, just easier later)
vBeta = as.numeric(lmMod$coefficients)
# must be numeric for Stan (no column desc)

# set up a dataframe for plotting
lmCoef = data.frame(account = unique(likeData$account),
                    Intercept = c(lmMod$coefficients[1], 
                                  lmMod$coefficients[1]+lmMod$coefficients[2],
                                  lmMod$coefficients[1]+lmMod$coefficients[3]),
                    Slope = c(lmMod$coefficients[4], lmMod$coefficients[4], lmMod$coefficients[4])
) 

p = p +   geom_abline(data = lmCoef, aes(intercept = Intercept, slope = Slope, color = account),
                      size = .75) 
p

# categorical descriptions must be EXACTLY like the original data so ggplot can match it up



# OK now in stan

stanModel3 <- '
data {

  int<lower=0> N;
  vector[N] y;

  vector[N] x;
  int account[N];

  int<lower=0> J; // Account Grps
  real alphaPriors[J];
  real betaPriors;
}

parameters {

  real<lower = 0> sigma;
  vector[J] alpha;
  real beta;
}

transformed parameters {

  vector[N] y_hat;
  for (i in 1:N) 
  y_hat[i] = alpha[account[i]] + beta * x[i];
  
}

model {
  target += normal_lpdf(y | y_hat,  sigma);
  target += normal_lpdf(alpha | alphaPriors, 1);
  target += normal_lpdf(beta | betaPriors, 1);
}
'

stanData3 <- list(
  N=nrow(likeData),
  J=length(unique(likeData$account)),
  y=likeData$y,
  x=likeData$x,
  account=as.integer(likeData$account),
  alphaPriors = c(vBeta[1], vBeta[2:3]+vBeta[1]),
  betaPriors = vBeta[4]
)

# notes: EVERYTHING must be numeric
# transform accounts to integers
# priors are adjusted for lm format by adding to base intercept


fit3 <- stan(model_code = stanModel3, data = stanData3, refresh = 0)

# if it crashes, rerun the whole thing

FitSummary3 = summary(fit3, pars = c('alpha', 'beta'))$summary[,1]
FitSummary3

BayesCoef = data.frame(account = unique(likeData$account),
                       Intercept = c(FitSummary3[1], 
                                     FitSummary3[2],
                                     FitSummary3[3]),
                       Slope = c(FitSummary3[4], FitSummary3[4], FitSummary3[4])
) 


p = p + geom_abline(data = BayesCoef, aes(intercept = Intercept, slope = Slope, color = account),
                    size = .75) 
p




