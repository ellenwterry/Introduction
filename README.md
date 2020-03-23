---
title: "Intro to Bayesian Transaction Analysis"
author: "Ellen Terry"
date: "3/20/2020"
output: md_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduction
During a 25+ year career in business analysis and planning, I found it helpful to think of markets as latent sales transactions. This perspective kept the focus on results - and it extends throughout the entire value chain. Really, Business activity is either prior transactions, likely transactions, or posterior projections of transactions. And transaction dimensions often include, or point to, significant business drivers *(a good place to start, anyway)*. The goal is to produce relevant, **actionable** models. 

Bayesian modeling is a core competency in analysis and planning, especially where **risk management and assurance** are important. Initially adopted in Insurance, Pharmaceuticals, and Banking *(esp. Trading)*, it is rapidly expanding across industries and into wider application space *(one interesting twist is the use of Bayesian modeling in testing and assurance of AI project deliverables where the parameters are noninterpretable and the probability of any specific outcome is unknown)*. The probabilistic output of Bayesian modeling is an important tool in an uncertain world.

There has been challenges to adoption:  

* It's computationaly intensive. Bayesian analysis relies on a sampling approach that can be a challenge in the transaction space *(where data can be very high in volume and dynamics)*. But like AI, high-performance computing has mitigated this barrier, and many of the challenges that remain can be addressed through model design *(we will cover "design for optimization")*.  

* There's a learning curve. Bayesian analysis is not building pie-charts in dashboards - it requires quantitative aptitude and commitment.  

But it's worth it - Bayesian analysis provides **substantial and unique** benefits in business modeling:  

* **Integration of Experience and Evidence.** Opinions of experienced managers *(even the messy, ambiguous, intuitive ones)*, can be captured and combined with data in a formal, statistically valid process to produce models that are both intuitive and quantitative.  

* **Interpretable, Probabilistic Results.** Bayesian analysis produces projections and parameters with probabilities. This directly addresses the risk management aspects of business transactions *(a no-brainer in banking and trading, but way underemphasized in many application spaces)*. This also quantifies relationships between drivers and results, which is essential to business analysis.  

* **Multilevel Analysis with Effects.** Business transaction environments are almost always multilevel *(e.g., Business Units => Regions => Projects => Customers)* and  it's not safe to assume that transaction activity will behave the same across all these levels - this misconception even has it's own name: "Simpsons paradox". *(It's not named after Homer, but eerily appropriate)*.  

* **Granular Control over Model Design and Tuning.** Models can be tuned *(and generalized)* across levels down to specific parameters.This can make a huge difference in accuracy, adaptability and credibilty.

* **Bayeisan Updating**. Bayesian models have a unique structure that can quickly integrate new data, and transfer explanatory parameters between models *(circumventing the model retraining problem in machine learning)*. This enables adaptation in dynamic transaction environments. 

*(Technical discussion continued in: https://github.com/ellenwterry/Introduction/blob/master/Introduction%20to%20Bayesian%20Transaction%20Analysis.Rmd )*

