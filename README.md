# MSBA Portfolio | Pedro Sánchez Rosillo

Projects and coursework from the Master of Science in Business Analytics at Georgetown University's McDonough School of Business (August 2026 to May 2027).

Every project folder has its own write-up covering the business question, the data, the method, what we found and what we recommended. The reports, code and charts sit alongside each write-up.

**[Portfolio site](https://pedrosrsanto.github.io/msba-portfolio/)** | **[Resume (PDF)](https://pedrosrsanto.github.io/msba-portfolio/Pedro_Sanchez_Rosillo_Resume.pdf)** | **[LinkedIn](https://www.linkedin.com/in/pedro-sanchez-rosillo-661316364/)** | **[Email](mailto:pedrosrsanto@gmail.com)**

---

## About me

I came into analytics from finance. I studied Business Administration (ADE) at Universidad Europea de Madrid and worked as an FP&A intern at TD SYNNEX in Florida, where I consolidated multi-country reporting and built Power BI reports for finance leadership, as a financial advisor at OVB Allfinanz in Madrid, and as an accounting and finance intern at Castro y Catalá, a family-owned logistics company in Galicia, where I worked in SAP on accounting, treasury and tax.

That background shapes how I approach data. A model is only useful if someone can act on it, so every project here ends with a recommendation written for the person who has to make the decision, not for another analyst. I'm bilingual in Spanish and English, work professionally in French, and have played competitive tennis since I was eight.

**Education:** MS in Business Analytics, Georgetown University (expected May 2027, GPA 4.0) | BA in Business Administration, Universidad Europea de Madrid

---

## Projects

### Machine learning and prediction

**[Keeping Canterra's talent: predicting and explaining attrition](projects/canterra-attrition)**
*Machine Learning Foundations (Team 6) and Advanced ML & AI (with Anton van der Laar) | Python*
We caught duplicated HR records that made models look 99% accurate when they caught only 13% of leavers on new employees. A logistic regression found the real drivers, a poor work environment and frequent travel rather than pay, with four actions worth about **$3.9M a year**. A tuned Random Forest then put **41% of leavers in the riskiest 20%** of employees, twice a random list.

**[Who uses LinkedIn? A predictor with a live app](projects/linkedin-usage-predictor)**
*Programming II: Data Infrastructure | Team of five | Python, Streamlit*
A logistic regression on Pew survey data that predicts LinkedIn use from six demographics, deployed as a **[live Streamlit app](https://linkedin-predictor-msba-group11.streamlit.app/)**. Education and income drive use, and age matters mostly after 65. 70% accuracy, 66% recall.

**[What drives the resale value of a used Toyota Corolla](projects/toyota-corolla-pricing)**
*Machine Learning Foundations | with Anton van der Laar | Python, statsmodels*
A regression for a dealer's trade-in program that explains **91% of resale price** on unseen cars, with a typical miss of about EUR 786, turned into a one-page pricing guide for salespeople.

**[Which cab bookings get cancelled](projects/cab-booking-cancellations)**
*Machine Learning Foundations | with Anton van der Laar | Python, KNN*
Across 10,000 bookings, evening app and web rides are 7.6% of bookings but **31% of cancellations**. A cost-tuned KNN model catches 44 of every 74 cancellations before a car is sent, with six operational fixes.

### Analytics, visualization and storytelling

**[Pay equity at BSR: equal pay stops at Director](projects/bsr-pay-equity)**
*Using Data to Lead Change and Visualization & Storytelling | Team 6 | Tableau, executive memo*
Median pay says BSR has no gap; the mean says women earn **$15,446 less**. 85 Directors make up 95% of the gap, which held at 27.1% across 30 robustness models, and two in three top junior women plan to leave. Presented as a leadership memo and deck, then as a five-dashboard Tableau story. I built and presented the Junior vs. Director dashboard.

**[Bike share insights: seven Tableau views](projects/bike-share-tableau)**
*Visualization & Storytelling with Data | Individual | Tableau*
78,704 trips show a system running on train commuters: transit hubs are 11 of 63 stations but start 24% of trips, and casual riders break the time limit 20x more often than subscribers. Built with calculated fields, parameters and a FIXED LOD filter, each view ending in an operational action.

**[What drives Airbnb prices in Washington, DC](projects/airbnb-dc-pricing)**
*Stats for Business Analytics and Programming I | Group 6 | R, Quarto*
1,828 cleaned listings. Each extra bedroom is worth **about $48 a night** holding location fixed, Downtown and Georgetown add $60 to $90, and Superhost status adds nothing. The multiple regression explains half the variation in price.

### Strategy, product and human-AI decisions

**[A report card for the college football transfer portal](projects/transfer-portal-human-ai)**
*Collaborative Intelligence | Team 6*
A "credit score for recruits" that predicts impact with a confidence range and compares it with cost, plus four validation tests and stop rules set in advance. Includes my individual work on Moneyball, noise vs. bias, and decision opportunities for human-AI collaboration.

**[Markstrat: writing the rules for an AI that runs the company](projects/markstrat-ai-autopilot)**
*Applied Product Management | Team 6 | In progress*
Claude makes every decision for our simulated firm and the team never overrides it. Our lever is the constitution we wrote: ranked objectives, twelve principles, a 13-step analysis and a validation checklist. I'm the constitution steward and verifier.

**[Should TruEarth launch a fresh pizza?](projects/truearth-launch-forecast)**
*Applied Product Management | Individual case*
A trial-and-repeat demand forecast, run separately for customers and non-customers, gives **$17.0M wholesale, 42% above the $12M hurdle**. Six of nine scenarios clear it. My recommendation: launch, but fix price first and start with existing customers.

### Programming and data engineering

**[SQL lab: the Texas housing market](projects/sql-texas-housing)**
*Programming III: Massive Data | Individual | SQL*
Ten SQLite queries tracing the Texas housing cycle from 2000 to 2015: growth to a 2006 peak, the crash, and recovery past the old peak by 2015.

**[Faker: realistic fake data in Python](projects/faker-synthetic-data)**
*Programming II: Data Infrastructure | Team presentation | Python*
A live-coded walkthrough of the Faker package for testing when real data is off limits, with a runnable script covering all four demos.

**[R programming: eBay categories for a reseller](projects/r-programming-fundamentals)**
*Programming I: Intro to Data | R, dplyr*
1,223 eBay auctions analyzed in base R and dplyr. The recommendation: prioritize Automotive for total close value, and time Computer auctions to end on a Saturday.

---

## Coursework

| Course | What it covers |
|---|---|
| OPAN 6601 Stats for Business Analytics | Probability, sampling distributions and the CLT, confidence intervals, hypothesis testing, regression |
| OPAN 6606 Programming I: Intro to Data | R for data analysis: base R, dplyr, joins, functions, reproducible reports in Quarto |
| OPAN 6607 Programming II: Data Infrastructure | Python, pandas, data wrangling and reshaping, Git and GitHub, virtual environments, deploying apps with Streamlit |
| OPAN 6608 Programming III: Massive Data | SQL and working with data at scale |
| OPAN 6602 Machine Learning Foundations | Regression, model selection, logistic regression, decision trees, KNN, cross-validation, missing data and imputation |
| OPAN 6603 Advanced Machine Learning & AI | Ensemble methods, neural networks, hyperparameter tuning, model evaluation and interpretation |
| OPAN 6600 Visualization & Storytelling with Data | Tableau dashboards and stories, calculated fields, parameters, LOD expressions |
| MGMT 6600 Using Data to Lead Change | Persuasion, negotiation (BATNA, ZOPA), social networks, executive memos; Harvard Everest leadership simulation |
| MGMT 6601 Collaborative Intelligence | How people and AI systems make decisions together: noise, bias, algorithm design and adoption |
| MARK 6555 Applied Product Management | Product strategy, concept testing and demand forecasting, the Markstrat simulation |
| STRT 6602 Data Ethics & Responsible AI | Fairness, privacy, accountability and governance in data and AI |

---

## Before Georgetown

**WePlan business plan (undergraduate thesis, Universidad Europea de Madrid).** A full business plan for WePlan, a social app concept built to make it easier for groups of friends to meet up in person. It covered market analysis, the business model, and financial modeling (break-even, ARPU, CAPEX and OPEX), and I defended it in front of a tribunal with a presentation and a companion website.

**Housing price econometrics (Universidad Europea de Madrid).** Regression analysis of housing prices in Spain as part of my econometrics coursework.

---

## Repository structure

```
msba-portfolio/
├── README.md                       You are here
├── index.html                      Portfolio site (GitHub Pages)
└── projects/
    ├── canterra-attrition/
    ├── linkedin-usage-predictor/
    ├── toyota-corolla-pricing/
    ├── cab-booking-cancellations/
    ├── bsr-pay-equity/
    ├── bike-share-tableau/
    ├── airbnb-dc-pricing/
    ├── transfer-portal-human-ai/
    ├── markstrat-ai-autopilot/
    ├── truearth-launch-forecast/
    ├── sql-texas-housing/
    ├── faker-synthetic-data/
    └── r-programming-fundamentals/
```

Each project folder follows the same layout: `README.md` for the write-up, `code/` for scripts and notebooks, `report/` for the final report or slides, and `images/` for charts used in the write-up.

## A note on academic work

Group projects credit every teammate. Course-provided datasets are not included; each write-up describes the data and where it came from.
