---
title: "Intro to Bayesian Transaction Analysis"
author: "Ellen Terry"
last update: "3/20/2020"
output: md_document
---

## Introduction
As a business analyst, I find it helpful to think of markets as latent sales transactions. This perspective keeps the focus on results, and extends throughout the entire value chain. Business activity can be naturally cast as prior transactions, likely transactions, and posterior projections of transactions. The transactions in business systems have integrity, and the dimensions serve as a guide to **business drivers** *(which transitions transactions from latent to realized state)*. Business planning and analysis is about understading these states and the causes and effects of the transition, with a goal of producing models that are relevant and **actionable**. 

Bayesian modeling is a core competency in analysis teams where **risk management and statistical validity** are required. Well established in Insurance, Pharmaceuticals, and Banking *(esp. Trading)*, it is expanding across industries to a wider application scope *(one interesting development is the use of Bayesian modeling in assurance of AI project deliverables, where the parameters are noninterpretable, and the probability of outcomes is unknown)*. The probabilistic basis of Bayesian modeling is an important tool in an uncertain world. There have been challenges to adoption:  

* It's computationally intensive. Bayesian modeling relies on a sampling approach that can be resource demanding in business environments, where transactions are created at thousands per second, and new dimension values are frequently added. But like AI, high-performance computing has mitigated this challenge, and other performance issues can be addressed through model design *(We will cover "design for optimization" practices in this course - critical in transacation analysis)*.  

* There's a learning curve. Bayesian analysis is not building pie-charts in dashboards - it requires quantitative aptitude and a commitment to understanding.   

It's worth the commitment. Bayesian analysis provides **substantial and unique** benefits in business modeling:  

* **Integration of Experience and Evidence.** The messy, ambiguous, intutitive opinions of experienced managers are often really good data. These can captured and combined with other data *(e.g., transactions)* in a formal, statistically valid process to produce models balance the intuitive and the quantitative.  

* **Interpretable, Probabilistic Results.** Bayesian analysis produces projections and parameters with probabilities that people can understand *(without oversimplifying dimensionality)*, and can answer questions central to business analysis, like: *"how much of which resources do we need to realize the results we want?"* Machine learning *(ML)* and Artificial Intelligence *(AI)* can't do this. This directly addresses risk management and assurance *(a no-brainer in banking and trading, but WAY underemphasized in other industries)*.   

* **Multilevel Analysis with Effects.** Business transaction environments are almost always multilevel *(e.g., Business Units => Regions => Projects => Customers)* and  it's not safe to assume that transaction activity will behave the same across all these levels *(data warehouses and dashboards are usually designed for "drill-down", but this doesn't provide quantitative, marginal, multilevel effects, which are pure gold in projection. A very powerful tool)*  

* **Granular Control over Model Design and Tuning.** Models can be tuned *(and generalized)* across levels down to specific parameters by level by dimension. This makes a huge difference in accuracy, adaptability and credibilty.*(ML and AI can't do this)*  

* **Bayeisan Updating**. Bayesian models have a unique structure that can quickly integrate new data. This makes a huge difference in adjusting models to new data *(especially in major events where people tend to overreact)*. This architecture also provides for transfer of parameters between models *(circumventing model retraining problem in ML)*. This enables adaptation in dynamic transaction environments and an uncertain world. 

Hopefully, these benefits motivate you to invest some time in learning Bayesian Analysis. It has served me well, and not just the planning processes *(planning orders, pricing policy, supply chain agreements, and industry trends)*, but operational *(pricing products, assets and derivatives)* and assurance processes *(project deliverables quality testing, controls testing and reasonablness of financial assertions)*. I'm a big fan and I think you will be too.

*(Intro Technical Notes continued in: https://github.com/ellenwterry/Introduction/blob/master/Introduction%20to%20Bayesian%20Transaction%20Analysis.Rmd )*

------
