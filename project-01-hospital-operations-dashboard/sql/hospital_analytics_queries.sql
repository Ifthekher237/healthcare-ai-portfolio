-- Hospital KPI Queries
-- Run against the cleaned hospital dataset loaded into a SQL engine.

-- 1. Average Length of Stay by Ward
SELECT ward,
       ROUND(AVG(length_of_stay_days), 2) AS avg_los_days,
       COUNT(*) AS total_admissions
FROM hospital_data
GROUP BY ward
ORDER BY avg_los_days DESC;

-- 2. 30-Day Readmission Rate by Ward
SELECT ward,
       SUM(readmitted_30d) AS readmissions,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(readmitted_30d) / COUNT(*), 2) AS readmission_rate_pct
FROM hospital_data
GROUP BY ward
ORDER BY readmission_rate_pct DESC;

-- 3. Monthly Admissions Trend
SELECT strftime('%Y-%m', admission_date) AS month,
       COUNT(*) AS admissions
FROM hospital_data
GROUP BY month
ORDER BY month;

-- 4. Discharge Status Breakdown
SELECT discharge_status,
       COUNT(*) AS count,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct
FROM hospital_data
GROUP BY discharge_status
ORDER BY count DESC;
