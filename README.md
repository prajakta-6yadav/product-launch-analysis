# Product Launch Analysis

## Overview
This project analyzes the performance of a new product launch over 8 weeks using MySQL and Excel.

The goal is to understand weekly sales, spend, impressions, and regional performance to recommend focus regions for future marketing efforts.

---

## Tools Used
- MySQL Workbench (Data extraction & cleaning)
- Microsoft Excel (Pivot tables, KPI calculations, charts)
- GitHub (Project hosting)

---

## Key Steps

### 1. Data Extraction (MySQL)
- Aggregated campaign data week-wise and region-wise.
- Calculated total sales, total spend, and total impressions.
- Cleaned NULL and zero spend values.

### 2. Excel Analysis
Created pivot tables:
- Weekly Sales by Region
- Weekly Spend by Region
- Weekly Impressions by Region

Calculated KPIs:
- ROAS
- Cost per Sale
- Conversion Rate

Created charts for:
- Weekly Sales
- Weekly Spend
- Weekly Impressions

---

## KPIs Formula

ROAS = Total Sales / Total Spend  
Cost per Sale = Total Spend / Total Sales  
Conversion Rate = Total Sales / Total Impressions  

---

## Insights

- North and West generated the highest total sales.
- South achieved the highest ROAS (most efficient spend).
- East has the highest cost per sale.
- South shows lowest conversion and needs optimization.

---

## Recommendations

- Increase marketing budget in South and West.
- Optimize East campaigns to reduce cost per sale.
- Improve conversion strategy in South region.

---

## Files Included

- BA_task.sql (SQL scripts)
- Product_Launch_Analysis.xlsx (Excel pivots, KPIs, charts)

---
