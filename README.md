Introduction
------------

Bayesian modeling is a core competency where **risk management and
assurance** is a major goal of planning and analysis. Initially adopted
in Insurance, Pharmaceuticals, and Banking *(esp. Trading)*, Bayesian
modeling is expanding across industries to a broad range of applications
where analysis is material enough to require a probablistic basis. One
emerging and interesting application that is assurance in AI and ML
projects *(where establishing outcome probability is a challenge)*

Initially, adoption faced challenges:

-   It’s computationaly intensive. Bayesian analysis relies on a
    sampling approach that can be slow (a real challenge in **business
    transaction** space). But like AI, high-performance computing has
    mitigated this barrier, and the challenges that remain can be
    addressed through model **“Design for Optimization”**.

-   There’s a learning curve. Bayesian analysis is not building
    pie-charts in dashboards - it requires application of advanced
    mathematics *(including calculus and linear algebra, which will be
    introduced and leveraged during our study)*.

In spite of these challenges, Bayesian analysis provides **unique**
benefits:

-   **Integration of Experience and Intuition.** Analysis dimensions are
    often significant, but ambiguous; and quantitative methods don’t
    always comprehend the full problem space. Human experience and
    judgment, in all it’s glorious fallabily, is often the best evidence
    we have. Bayesian analysis integrates experience *(however
    ambiguous)* with evidence using a statistically valid approach, and
    produces balanced analysis.

-   **Interpretable, Probabilistic Results.** Bayesian analysis produces
    projections and parameters with probabilities and credible
    intervals, directly addressing assurance and risk management. This
    also provides quantitative explanations of the relationships between
    our projections and independent variables and business drivers. A
    little algebra gives us quantitative answers to the impact of
    changes to these drivers *(something that AI and ML doesn’t
    provide)*.

-   **Multilevel Analysis with Effects.** Business transaction
    environments are almost always multilevel *(e.g., Business Units
    =&gt; Regions =&gt; Projects =&gt; Customers)*. It’s not safe to
    assume that transacation activity will behave the same across all
    these levels - they often share some effects, but others are more
    related to the level. Effects are basic to Bayesian analysis, and
    this provides answers to questions like the impact of migrating
    products or projects across regions or customer groups, including
    those that don’t exist yet *(the very essence of planning and
    analysis)*.

-   **Granular Control over Design and Tuning.** Bayesian models can be
    tuned *(and generalized)* across levels down to specific parameters.
    Depending on the application, this can make a huge difference in
    accuracy and credibily *(like with projections over spaces with no
    data)*

-   **Bayeisan Updating**. Bayesian models have a unique structure that
    can shift the current model to a prior model to integrate new data
    quickly *(without retraining)*. The models can also transfer
    parameters between models *(which is very difficult in ML
    applications)*. This capablity is very powerful in dynamic data
    environments.
