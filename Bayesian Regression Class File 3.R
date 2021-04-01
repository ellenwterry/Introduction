

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




### Polynomials and Simple Generalization

ProductSales = read_csv("C:/Users/ellen/Documents/UH/Spring 2020/DA2/Section 1/MIdTerm/ProductSalesv2.csv")

ProductSales$WkBeg = mdy(ProductSales$WkBeg)

ProductSales = pivot_longer(ProductSales, 3:5, names_to = "Product", values_to = "Sales")

p <- ggplot(data = ProductSales, aes(WkBeg, Sales, color = Product)) + geom_point(alpha = .2) +
  theme(panel.background = element_rect(fill = "white")) 
p


Train = ProductSales %>% filter(WkBeg < "2015-01-01")
Test  =  ProductSales %>%  filter(WkBeg >= "2015-01-01")

mXPoly = model.matrix(Sales ~ Product + Wk + I(Wk^2), data = Train)
vY = as.numeric(Train$Sales)
vBetaPoly <- solve(t(mXPoly)%*%mXPoly, t(mXPoly)%*%vY) # solve using normal equations                    
yPoly = t(as.numeric(vBetaPoly)%*%t(mXPoly))
mXPolyTest = model.matrix(Sales ~ Product + Wk + I(Wk^2), data = Test)
rmse4 = rmse( Test$Sales - (t(as.numeric(vBetaPoly)%*%t(mXPolyTest))))
rmse4


stanModel6 <- '
data {
  int<lower=0> N;
  int<lower=0> K;
  matrix[N, K] x;
  vector[N] y;
  vector[K] betaPriors;
  vector[K] sigmaPriors;
  real<lower = 0> mSigma;
}
parameters {
  vector[K] beta;
}
model{
  target += normal_lpdf(beta | betaPriors, sigmaPriors);
  target += normal_lpdf(y | x*beta, mSigma);
}
'

vBetaPolyPriors = c(
  round(vBetaPoly[1]+10,0),  
  round(vBetaPoly[2]-12,0), 
  round(vBetaPoly[3]-10,),
  # here, I'm "squeezing" the intercepts 
  # so the curve straightens out 
  round(vBetaPoly[4],0),  
  round(vBetaPoly[5]+.001,3))
# and here, I'm reducing the effect of the exponentiation
# the parameter was -0.002... so I added back a little 
vSigmaPriors = c(1,  1,   1,   1,  0.0001)
# then I "clamp down" the sigmas  
# while leaving the model sigma some room to move  
modelSigma = 10

stanData6 <- list(
  N=nrow(mXPoly),
  K=ncol(mXPoly),
  x=mXPoly,
  y=vY,
  betaPriors  = vBetaPolyPriors,
  sigmaPriors = vSigmaPriors,
  mSigma = modelSigma
)

fit6 <- stan(model_code = stanModel6, data = stanData6, refresh = 0)
FitSummary6 = as.numeric(summary(fit6, pars = 'beta')$summary[,1])
FitSummary6

Test$Pred =  as.numeric(t(as.numeric(FitSummary6)%*%t(mXPolyTest)))
rmse(Test$Pred - Test$Sales)


p6 = p +  geom_line(data = Test, aes(WkBeg, Pred, color = Product)) 
p6

### Nonlinear Equations

stanModel7 <- '
data {

  int<lower=0> N;
  vector[N] y;
  vector[N] x;
  int product[N];
  int<lower=0> J; // Product Grps
  real alphaPriors[J];
  real p_a;
  real p_b;
}

parameters {
  real a;
  real b;
  real<lower = 0> sigma;
  vector[J] alpha;
}

transformed parameters {

  vector[N] y_hat;
  for (i in 1:N) 
  y_hat[i] = alpha[product[i]] + ((a*x[i])/(b+(x[i])));
  
}

model {
  target += normal_lpdf(y | y_hat,  sigma);
  target += normal_lpdf(alpha | alphaPriors, 50);
  target += normal_lpdf(a | p_a, 2);
  target += normal_lpdf(b | p_b, 2);
}
'


#Running the model:

ModelData = Train
ModelData$Product = as.integer(factor(ModelData$Product))

stanData7 <- list(
  N=nrow(ModelData),
  J=length(unique(ModelData$Product)),
  y=ModelData$Sales,
  x=ModelData$Wk,
  product=as.integer(ModelData$Product),
  alphaPriors = c(650,660,670),
  p_a = 80,
  p_b = 30
)

fit7 <- stan(model_code = stanModel7, data = stanData7, refresh = 0)

sumFit7 = summary(fit7, pars = c('alpha', 'a', 'b'))$summary[,1]

Prod1 = filter(Test, Product == "Product1")
Prod2 = filter(Test, Product == "Product2")
Prod3 = filter(Test, Product == "Product3")
Prod1$Pred = sumFit7[1] + (sumFit7[4]*Prod1$Wk)/(sumFit7[5]+Prod1$Wk)
Prod2$Pred = sumFit7[2] + (sumFit7[4]*Prod1$Wk)/(sumFit7[5]+Prod1$Wk)
Prod3$Pred = sumFit7[3] + (sumFit7[4]*Prod1$Wk)/(sumFit7[5]+Prod1$Wk)

NewPred = bind_rows(Prod1, Prod2)
NewPred = bind_rows(NewPred, Prod3)

p7 = p + geom_line(data = NewPred, aes(WkBeg, Pred, color= Product))
p7  

rmse(NewPred$Pred - NewPred$Sales)


