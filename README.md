# Lending Club Loan Default Analysis
This project attempts to examine and analyze the publicly available default dataset of Lending Club's loans starting from 2007 through 2018. The end goal is to build a machine learning model that could accurately predict the likelihood of loan default using known borrower characteristics.

## Problem Description
A peer-to-peer lending company such as Lending Club naturally would have some of its borrowers defaulting on loans which may put a dent in investors' trust towards Lending Club itself. Figuring out a way to reduce said default rate could potentially increase the trustworthiness of Lending Club as a company overall. To do this, Data Science techniques such as EDA and machine learning could be utilized to solve the problem at hand.

## Dataset Used
The dataset used for this project is a secondary one provided by several researchers from _Universidad Complutense de Madrid_ (link: https://zenodo.org/records/11295916). The dataset collected from 2007 through 2018 is cross-sectional in nature with a total of 1.34 million rows as well as 15 original columns. Several data cleaning processes were mentioned by the researchers, yet there were still many other preprocessing techniques that had yet to be done by the time this project was first run.

### Variable Descriptions

Target Variable Description:

- 'Default' : Binary variable categorizing fully paid loans and defaulted loans (0 = fully paid, 1 = defaulted loans).

Explanatory Variable Descriptions:

- 'id' : Unique identifier column to ensure the uniqueness of each loan.
- 'issue_d' : Month and year in which the loan was approved.
- 'revenue' : Borrower's self-declared annual income during registration.
- 'dti_n' : Debt-to-income ratio, indebtedness ratio for obligations excluding mortgage for the whole group of borrowers (primary and co-borrowers) (monthly debt payments / co-borrowers total income in percentage terms).
- 'loan_amnt' : Amount of credit requested by the borrower.
- 'fico_n' : FICO score, a credit scoring system by the Fair Isaac Corporation ranging between 300 (poorest credit) to 850 (best credit).
- 'experience_c' : Binary variable that indicates whether the borrower is new to the entity (Lending Club).
- 'emp_length' : Categorical variable with the employment length of the borrower (includes the no information category).
- 'purpose' : Credit purpose category for the loan requested.
- 'home_ownership_n' : Homeownership status provided by the borrower during the registration process.
- 'addr_state' : Borrower's residence state (United States).
- 'zip_code' : Zip code of the borrower's residence.
- 'title' : Title of the credit request description provided by the borrower.
- 'desc' : Description of the credit request provided by the borrower.

## Analysis Techniques

### Data Preprocessing
- Duplicated Values Check
- Train-Test Split
- Missingness Handling
- Outlier Identification and Handling
- Categorical Encoding
- Feature/Target Split
- Standardization
- Post-Processing Undersampling
- Multicollinearity Diagnostic

### Exploratory Data Analysis (EDA)
- Statistical EDA
- Univariate EDA
- Multivariate EDA

### Machine Learning Modeling
- Non-Balanced Target Classification Modeling [1]
- Non-Balanced Target Model Evaluation [1]
- Balanced Target Classification Modeling [1]
- Balanced Target Model Evaluation [1]
- Best Model Interpretation [2]

[1] Models used: Optuna tuned K-Nearest Neighbors (KNN), Logistic Regression, Decision Tree, and XGBoost.

[2] Best model: XGBoost fitted on an undersampled training set.

## Results and Insights

### Description Table 1 (Statistical EDA) - Descriptive statistics of categorical variables.

![Screenshot 2025-01-11 012823](https://github.com/user-attachments/assets/9677a2b6-14a5-4cf3-8e1c-d94439bdb25b)

### Description Table 2 (Statistical EDA) - Descriptive statistics of numerical variables.

![Screenshot 2025-01-11 013017](https://github.com/user-attachments/assets/dde3cefa-ef85-43b4-878a-63621e94f5b0)

### Description Table 3 (Statistical EDA) - Numerical variable distributions' properties.

![Screenshot 2025-01-11 013113](https://github.com/user-attachments/assets/e3f9c5e8-4a26-43b7-a728-19673f6e59ea)

### Count Plots (Univariate EDA) - All categorical variables are unimodal in distributions.

![download (24)](https://github.com/user-attachments/assets/da19512a-9a77-4af1-8857-55a2812399b5)

### KDE Plots (Univariate EDA) - All numerical variables are positively skewed with some degree of kurtosis.

![download (25)](https://github.com/user-attachments/assets/52227be3-62ac-40c3-bc84-a63ee8f82407)

### Proportional Bar Plots (Multivariate EDA) - Certain (categorical) characteristics predict higher odds of default.

![download (26)](https://github.com/user-attachments/assets/0373d4aa-a5ad-4745-a7b8-9a88fe19d8f5)
![download (27)](https://github.com/user-attachments/assets/6d6e654c-adce-4ff1-9fa4-25f734a527b3)
![download (28)](https://github.com/user-attachments/assets/e93c715f-2854-4ea2-9469-b49fd10e9423)
![download (29)](https://github.com/user-attachments/assets/68281a78-95b0-4bef-97ac-e99371df2ba3)
![download (30)](https://github.com/user-attachments/assets/0f47c865-9355-4cb4-9cce-976934700c19)

### Numerical Pair Plots (Multivariate EDA) - Certain (numerical) characteristics predict higher odds of default.

![download (31)](https://github.com/user-attachments/assets/24cc0e79-e847-4e2f-814e-9abc637a2505)

### Classification Report (Balanced Target Model Evaluation) - Evaluation statistics for the best XGBoost model.

![Screenshot 2025-01-11 011753](https://github.com/user-attachments/assets/f7c1a671-6a1c-4bff-8882-f08c1be2facd)

### Confusion Matrix (Balanced Target Model Evaluation) - Predicted/true label groupings of the best model found.

![download (32)](https://github.com/user-attachments/assets/a1e0c5bd-b4eb-431a-aaec-1bea17040163)

### Permutation Feature Importance (Best Model Interpretation) - Factors most predictive of loan default.

![newplot (12)](https://github.com/user-attachments/assets/58f9fc41-1d78-4357-a5a0-899b4a9621e3)

### Partial Dependence Plots (Best Model Interpretation) - Directionality of factors predictive of loan default.

![newplot (13)](https://github.com/user-attachments/assets/a54b0970-fa87-4a21-ae48-b49173d6b1a5)

## Recommendations

### In general there are 2 approaches that Lending Club could take, the radical one or the more moderate solution.

The Radical Approach (Investor Safety Priority):

- Lending Club would automatically reject all borrowers labeled as defaultees by the model, this could potentially reduce the final default rate to 13.07% compared to the initial 19.98% default rate (a 34.58% reduction in default rate).
- The math: In the test data there is a total of 268,897 borrowers. The model would correctly label 34,611 defaultees and falsely label 90,000 non-defaultees as defaultees also ─ this totals to about 124,611 borrowers labeled as defaultees. By rejecting all 124,611 borrowers we would be left with 144,286 or 53.65% of all the other borrowers NOT labeled as defaultees by the model (a 46.34% reduction of total borrowers). Of the remaining 144,286 leftover borrowers 18,869 would still default, which means a new default rate of 13.07%. This 13.07% number is the final default rate which marks a 34.58% reduction from the original 19.98% default number. However, this came at a massive cost of reduction for the number of borrowers ─ potentially (temporarily) hitting Lending Club's fee-based revenue stream.
- This approach should most likely be accompanied by extensive market penetration efforts to compensate for the lost borrowers.

The Moderate Approach (Revenue Stream Priority):

- Lending Club would use the default and non-default labeling done by the best model as an initial staging ground for loan acceptance/rejection, usage of EDA findings to further enhance final decisions based on most/least likely to default borrower characteristics.
- Lending Club should utilize the project's best model and EDA findings alongside its analysts to manually accept/reject loan requests instead of automatically rejecting anyone labeled as defaultees by the model.
- Remembering that the best model has a moderate 'accuracy', Lending Club could utilize its analysts to manually review each individual loan with the help of the best model and the EDA findings within the project ─ uncovering mislabeled borrowers with the help of most/least likely to default borrower characteristics.
- This approach could help reduce the default rate alongside maintaining the company's fee-based revenue stream.
