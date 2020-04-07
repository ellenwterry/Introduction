## Introduction
The terms "Analyst" and "Analytics" are overloaded to the extent of meaninglessness. In the interest of clarity, within the context of this study, we'll define:

**Analytics**. The term analytics was first used by Aristotle in "Prior Analytics" and "Posterior Analytics", to describe a **system of reasoning and inference**. Current confusion of the term with technology tools does not alter this core definition. Technology tools are of great utility, especially in business analysis, but reasoning and inference is the essence of analytics and uniquely human. And still, the best way to learn reasoning and inference is to build intuition through case study.

**Analyst**. In this context, we are focused on the business analyst, a role that is responsible to define and **direction** and **drivers** of an **enterprise**. There are extensions to these goals: operational monitoring and assurance, risk management, budgeting, etc. But these are extensions of the role and can be resourced and delegated. Without models ythat comprehend direction and drivers, it all becomes superfluous. It should also be considered that defining the direction and drivers of a business is not a top down exercise - the evidence is in the data.    

## Business Analysis and Transaction Data
It's helpful for business analysts to think of markets as latent sales transactions. This perspective keeps the focus on results, and extends throughout the entire value chain. Business activity can be naturally cast as prior transactions, current transactions, and posterior projections of transactions. The transactions in business systems have integrity, and the dimensions serve as a guide to **business drivers** *(which transitions transactions from latent to realized state)*. Business analysis and planning is about understanding these states, and the causes and effects of the transition, with a goal of producing models that are relevant and **actionable**. 


## Business Modeling (Bayesian Approach)
Bayesian modeling provides the **statistical validity** essential to a planning process that produces reliable and relevant analyses. Well established in Insurance, Pharmaceuticals, and Banking *(esp. Trading)*, it is expanding across industries to a wide application scope *(one interesting development is the use of Bayesian modeling in assurance of AI project deliverables, where the parameters are noninterpretable, and the probability of outcomes is unknown)*. The probabilistic basis of Bayesian modeling is an important tool in an uncertain world. 

There have been challenges to adoption:  

* It's computationally intensive. Bayesian modeling relies on a sampling approach that can be resource demanding in business environments, where transactions are created at thousands per second, and new dimension values are frequently added. But like AI, high-performance computing has mitigated this challenge, and other performance issues can be addressed through model design *(We will cover "design for optimization" practices in this course - critical in transaction analysis)*.  

* There's a learning curve. Bayesian analysis is not building 3D charts in dashboards - it requires quantitative aptitude, and a commitment to understanding.   

Still, rapid adoption has proceeded because Bayesian analysis provides **substantial and unique** benefits in business modeling:  

* **Integration of Experience and Evidence.** The messy, ambiguous, intuitive opinions of experienced managers are often really good data*(maybe weak in reliability, but strong in relevance)*. These can captured and merged with other data *(e.g., transactions)* in a formal, statistically valid process to produce models that balance the intuitive with the quantitative.  

* **Interpretable, Probabilistic Results.** Bayesian analysis produces projections and parameters with probabilities that people can understand. It can answer the questions central to business analysis, like: *"how much of which resources do we need to achieve results, and what's the probability of it happening?"* Machine learning *(ML)* and Artificial Intelligence *(AI)* can't do this. This directly addresses the risk management components of planning and process *(a no-brainer in banking and trading, but seriously under-emphasized in other industries)*.   

* **Multilevel Analysis with Effects.** Business transaction environments are almost always multilevel *(e.g., Business Units => Regions => Projects => Customers)* and  it's not safe to assume that transaction activity will behave the same across all these levels *(data warehouses and dashboards are usually designed for "drill-down", but this doesn't provide quantitative, marginal, multilevel effects, which are pure gold in projection. A very powerful tool)*  

* **Granular Control over Model Design and Tuning.** Models can be tuned *(and generalized)* across levels down to specific parameters by level by dimension. This makes a huge difference in accuracy, adaptability and credibility.*(ML and AI can't do this)*  

* **Bayesian Updating**. Bayesian models have a unique structure that can quickly integrate new data. This makes a huge difference in adjusting models to new data *(especially in major events where people tend to overreact)*. This architecture also provides for transfer of parameters between models *(circumventing model retraining problem in ML)*. This enables adaptation in dynamic transaction environments and an uncertain world. 

Hopefully, these benefits motivate you to invest some time in learning Bayesian Analysis. Applications include planning  *(e.g., planning orders, pricing policy, supply chain agreements, and industry trends)*, operations and process automation *(e.g., pricing products, assets and derivatives)* assurance *(e.g., project deliverables quality testing, controls testing and reasonableness of financial assertions)* and beyond. 

------
