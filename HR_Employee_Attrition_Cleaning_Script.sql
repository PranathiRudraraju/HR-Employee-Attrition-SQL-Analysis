-- ===========================================================
-- Project: HR Employee Attrition Analysis
-- Description: SQL script for data cleaning and preparation
-- ===========================================================

-- Rename column with BOM characters
USE hr_employee_attrition;

-- Trim extra spaces in text columns
SET SQL_SAFE_UPDATES = 0;
UPDATE hr_employee_attrition
SET
  Attrition = TRIM(Attrition),
  BusinessTravel = TRIM(BusinessTravel),
  Department = TRIM(Department),
  EducationField = TRIM(EducationField),
  Gender = TRIM(Gender),
  JobRole = TRIM(JobRole),
  MaritalStatus = TRIM(MaritalStatus);

-- Standardize Attrition values
SET SQL_SAFE_UPDATES = 0;
UPDATE hr_employee_attrition
SET Attrition = CASE
    WHEN LOWER(Attrition) IN ('yes', 'y') THEN 'Yes'
    WHEN LOWER(Attrition) IN ('no', 'n') THEN 'No'
    ELSE Attrition
  END;

-- Replace NULL numeric fields with 0
SET SQL_SAFE_UPDATES = 0;
UPDATE hr_employee_attrition
SET
  DistanceFromHome = COALESCE(DistanceFromHome, 0),
  DailyRate = COALESCE(DailyRate, 0),
  MonthlyIncome = COALESCE(MonthlyIncome, 0),
  NumCompaniesWorked = COALESCE(NumCompaniesWorked, 0),
  TotalWorkingYears = COALESCE(TotalWorkingYears, 0);

-- Replace NULL text fields with 'Unknown'
SET SQL_SAFE_UPDATES = 0;
UPDATE hr_employee_attrition
SET
  Department = COALESCE(NULLIF(Department, ''), 'Unknown'),
  EducationField = COALESCE(NULLIF(EducationField, ''), 'Unknown'),
  BusinessTravel = COALESCE(NULLIF(BusinessTravel, ''), 'Unknown');

-- Add a numeric flag for Attrition (Yes=1, No=0)
ALTER TABLE hr_employee_attrition ADD AttritionFlag INT;
UPDATE hr_employee_attrition
SET AttritionFlag = CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END;

-- Add an age group column for segmentation
ALTER TABLE hr_employee_attrition ADD AgeGroup VARCHAR(20);
SET SQL_SAFE_UPDATES = 0;
UPDATE hr_employee_attrition
SET AgeGroup = CASE
  WHEN Age < 25 THEN 'Under 25'
  WHEN Age BETWEEN 25 AND 34 THEN '25-34'
  WHEN Age BETWEEN 35 AND 44 THEN '35-44'
  WHEN Age BETWEEN 45 AND 54 THEN '45-54'
  ELSE '55+'
END;
