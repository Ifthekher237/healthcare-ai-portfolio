/*
=========================================================
Project 02: Patient Readmission Risk Prediction
SQL Support Queries
Purpose: exploratory healthcare analytics and cohort-level
readmission analysis
=========================================================
*/

---------------------------------------------------------
-- 1. Readmission rate by disease
---------------------------------------------------------
SELECT 
    patient_disease,
    ROUND(AVG(readmission) * 100, 2) AS readmission_rate_percent
FROM patient_data
GROUP BY patient_disease
ORDER BY readmission_rate_percent DESC;


---------------------------------------------------------
-- 2. Readmission rate by discharge status
---------------------------------------------------------
SELECT 
    discharge_status,
    ROUND(AVG(readmission) * 100, 2) AS readmission_rate_percent
FROM patient_data
GROUP BY discharge_status
ORDER BY readmission_rate_percent DESC;


---------------------------------------------------------
-- 3. Average length of stay by readmission outcome
---------------------------------------------------------
SELECT 
    readmission,
    ROUND(AVG(patient_length_of_stay), 2) AS avg_length_of_stay_days
FROM patient_data
GROUP BY readmission
ORDER BY readmission DESC;


---------------------------------------------------------
-- 4. Readmission rate by hospital ward
---------------------------------------------------------
SELECT 
    hospital_ward,
    ROUND(AVG(readmission) * 100, 2) AS readmission_rate_percent
FROM patient_data
GROUP BY hospital_ward
ORDER BY readmission_rate_percent DESC;


---------------------------------------------------------
-- 5. Readmission rate by doctor specialty
---------------------------------------------------------
SELECT 
    doctor_specialty,
    ROUND(AVG(readmission) * 100, 2) AS readmission_rate_percent
FROM patient_data
GROUP BY doctor_specialty
ORDER BY readmission_rate_percent DESC;


---------------------------------------------------------
-- 6. Readmission rate by age group
---------------------------------------------------------
SELECT 
    CASE
        WHEN patient_age < 30 THEN 'Under 30'
        WHEN patient_age BETWEEN 30 AND 49 THEN '30-49'
        WHEN patient_age BETWEEN 50 AND 69 THEN '50-69'
        ELSE '70+'
    END AS age_group,
    ROUND(AVG(readmission) * 100, 2) AS readmission_rate_percent
FROM patient_data
GROUP BY 
    CASE
        WHEN patient_age < 30 THEN 'Under 30'
        WHEN patient_age BETWEEN 30 AND 49 THEN '30-49'
        WHEN patient_age BETWEEN 50 AND 69 THEN '50-69'
        ELSE '70+'
    END
ORDER BY readmission_rate_percent DESC;


---------------------------------------------------------
-- 7. Average wait time by readmission outcome
---------------------------------------------------------
SELECT 
    readmission,
    ROUND(AVG(patient_waittime), 2) AS avg_wait_time_minutes
FROM patient_data
GROUP BY readmission
ORDER BY readmission DESC;


---------------------------------------------------------
-- 8. Bed occupancy vs readmission trend
---------------------------------------------------------
SELECT 
    ROUND(AVG(occupied_beds), 2) AS avg_occupied_beds,
    ROUND(AVG(hospital_beds_available), 2) AS avg_total_beds,
    ROUND(AVG(readmission) * 100, 2) AS readmission_rate_percent
FROM patient_data;