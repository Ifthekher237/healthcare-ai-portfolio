# Project 01 – Hospital Operations Dashboard

## Business Problem
Hospitals lack real-time visibility into key operational KPIs such as bed utilization, average length of stay, readmission rates, and patient throughput.

## Why It Matters
Operational inefficiencies cost hospitals millions annually. A data-driven dashboard enables administrators to optimize staffing, scheduling, and resource allocation.

## Datasets
- Synthetic hospital operations dataset (generated in `src/load_data.py`)
- Optional: AIHW public hospital statistics (Australia)

## Tools & Frameworks
- Python, pandas, NumPy
- SQL (SQLite / PostgreSQL)
- Power BI
- Matplotlib / Seaborn / Plotly

## Expected Outputs
- Cleaned dataset exported for Power BI
- SQL KPI queries
- Power BI `.pbix` dashboard
- Dashboard screenshots

## How to Run
```bash
pip install -r requirements.txt
python src/load_data.py
python src/clean_data.py
python src/feature_engineering.py
python src/export_for_powerbi.py
```
