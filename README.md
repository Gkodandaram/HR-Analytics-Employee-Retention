# 📊 HR Analytics — Employee Retention Analysis

> A multi-tool data analysis project exploring the key factors driving employee attrition, performance, and retention using Excel, Power BI, SQL, and Tableau.

---

## 📌 Project Overview

Employee attrition is one of the most costly challenges organizations face. This project analyzes HR data to uncover workforce patterns, identify high-risk employee groups, and provide data-backed recommendations to improve retention.

The same HR dataset was analyzed consistently across **four industry-standard tools**, allowing for direct comparison of each tool's analytical depth and visualization capabilities.

---

## 🎯 Objectives

- Identify key factors driving employee attrition
- Analyze the impact of workload, tenure, salary, and satisfaction on retention
- Compare analytical and visualization strengths across Excel, Power BI, SQL, and Tableau
- Provide actionable HR insights to support data-driven decision-making

---

## 🔍 Key Findings

| Insight | Detail |
|--------|--------|
| 🏢 **High-Attrition Departments** | Sales and HR show the highest turnover compared to other teams |
| ⏱️ **Tenure Risk Zone** | Most resignations occur within the first **1–3 years** |
| 💰 **Income & Role Trends** | Entry-level, low-income staff have significantly higher attrition than mid-level employees |
| ⚖️ **Work-Life Balance** | Lower work-life balance scores directly correlate with higher attrition |
| 📋 **Workload & Performance** | Employees with balanced workloads and 2–5 years of experience perform strongest |
| 🧑‍💼 **Manager Relationships** | Poor manager relationships are a major driver of early exits |
| 📣 **Feedback Gap** | Employees without regular performance feedback are more likely to leave |

---


## 🛠️ Tools & Files

### 📗 Excel (`hr_analysis.xlsx`)
- Data cleaning: removed duplicates, handled missing values, fixed formatting
- Pivot tables and slicers for interactive filtering
- Dashboard with attrition rate, satisfaction scores, and department breakdowns
- Best for: quick setup, static reports, and mid-size data exploration

### ⚡ Power BI (`hr_analysis.pbix`)
- Connected to the cleaned Excel dataset
- DAX measures for dynamic KPIs (attrition rate, avg. tenure, salary bands)
- Drill-through filters, bookmarks, and interactive visuals
- Best for: real-time tracking, scalable dashboards, executive-level reporting

### 🗄️ SQL (`hr_analysis.sql`)
- Queries for attrition segmentation (Yes vs No)
- Average monthly income comparison by attrition status
- Attrition rate by department and years since last promotion
- Best for: data aggregation, filtering large datasets, backend reporting

### 📈 Tableau (`hr_analysis.twbx`)
- Story-driven dashboards for stakeholder presentations
- Heat maps, tree maps, and attrition storyboards
- Live filters and dynamic tooltips
- Best for: visual storytelling, pitch decks, executive presentations

---

## 📂 Repository Structure

```
HR-Analytics-Employee-Retention/
│
├── 📗 hr_analysis.xlsx               # Excel dashboard & pivot analysis
├── ⚡ hr_analysis.pbix               # Power BI interactive report
├── 🗄️ hr_analysis.sql                # SQL queries for HR data analysis
├── 📈 hr_analysis.twbx               # Tableau workbook & story dashboards
├── 📊 HR_Analysis_Presentation.pptx  # Project presentation slides
├── 📁 screenshots/                   # Dashboard screenshots
│   ├── excel_dashboard_1.png
│   ├── excel_dashboard_2.png
│   ├── powerbi_dashboard.png
│   ├── tableau_dashboard.png
│   ├── sql_query_1.png
│   └── sql_query_2.png
└── 📄 README.md                      # Project documentation (this file)
```

---

## 📊 Analytical Workflow

```
Raw HR Data
    │
    ▼
Data Cleaning & Preparation
(Excel + SQL — remove duplicates, fix nulls, standardize formats)
    │
    ▼
Exploratory Analysis
(SQL — aggregations, segmentation, trend queries)
    │
    ▼
Dashboard Visualization
(Excel, Power BI, Tableau — interactive visuals & KPIs)
    │
    ▼
Insight Generation & Recommendations
(Identify attrition drivers → HR action plan)
```

---

## 💡 Recommendations

1. **Strengthen onboarding** — Focus retention programs on the critical first 1–3 year window
2. **Review entry-level compensation** — Low-income staff show the highest attrition risk
3. **Promote work-life balance** — Flexible work policies correlate strongly with better retention
4. **Regular performance feedback** — Employees without feedback cycles leave at higher rates
5. **Manager training** — Improve manager-employee relationships in high-attrition departments
6. **Target Sales & HR departments** — These teams need urgent retention interventions

---

## 🚀 How to Use This Project

1. **SQL** — Open `hr_analysis.sql` in MySQL Workbench, DBeaver, or any SQL client and run the queries
2. **Excel** — Open `hr_analysis.xlsx` in Microsoft Excel (2016 or later recommended)
3. **Power BI** — Open `hr_analysis.pbix` in [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
4. **Tableau** — Open `hr_analysis.twbx` in [Tableau Public](https://public.tableau.com/) (free) or Tableau Desktop

---

## 📃 License

This project is intended for educational and portfolio purposes.

---

*Built with ❤️ using Excel · Power BI · SQL · Tableau*
