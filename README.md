![status](https://img.shields.io/badge/status-complete-pink)


# Modeling Offensive Value in MLB Hitters

This project explores the statistical relationships between various offensive metrics and weighted On-Base Average (wOBA) to identify what best predicts a player's offensive value. Using a dataset of qualified MLB hitters and several regression models, we examined both individual metrics and interaction effects to determine the most informative predictors.

## Tools Used
- R (RStudio)
- MLB Statcast data
- Multiple Linear Regression & Model Comparison
- ANOVA, Residual Analysis, Interaction Terms

## Key Insights
- **Isolated Power (ISO)** demonstrated a strong individual correlation with wOBA in early modeling stages, validating its value as a power-focused metric.
- However, the final selected model did **not** include ISO. Instead, it used interaction terms that more effectively captured relationships between:
  - **Intentional Walks × Barrels**  
  - **Strikeout % × Popups %**
- These interactions revealed that certain metrics become more predictive when combined — for example, players with high strikeout and popup rates showed significantly lower offensive value.

## Model Selection
- The final model was chosen based on statistical fit (**significant F-test**, p = 0.0026) and conceptual alignment with offensive behavior patterns in MLB.
- Adjusted R² and residual plots were also evaluated to ensure reliability and generalizability.

## Outcome
The project highlights the importance of going beyond first-order predictors like ISO. While ISO remains a useful metric, nuanced offensive value prediction benefits from incorporating **interaction effects** that reflect player tendencies and situational outcomes.

### Additional Report
A separate [Residual Analysis Report (PDF)](Residual%20Analysis%20Report.pdf) is included to evaluate model assumptions and fit.
![image](https://github.com/user-attachments/assets/98aa4f36-9b72-4f8e-8026-cfddb0d8b9b9)
