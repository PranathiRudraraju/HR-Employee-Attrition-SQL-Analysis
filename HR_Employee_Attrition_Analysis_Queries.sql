Project: HR Employee Attrition Analysis
Description: SQL queries for HR Attrition analysis

--How many total employees are there in the company?
    Select  count(*) as total_employees
    From  hr_employee_attrition;

--What are the distinct departments and job roles?
   Select distinct Department, JobRole
   From hr_employee_attrition
   Order by Department, JobRole;

--How many male and female employees are there?
   select gender, count(*) as count
   from hr_employee_attrition
   group by gender;

--What is the minimum, maximum, and average age of employees?
  Select 
  min(Age) as min_age,
  max(Age) as max_age,
  round(avg(Age), 2) as avg_age
  From hr_employee_attrition;

--What are the different education fields represented in the dataset?
  select distinct EducationField
  from hr_employee_attrition;

--What is the total number and percentage of employees who have left (Attrition = 'Yes')?
Select count(*) as total_employees,
sum(case when Attrition = 'Yes' then 1 else 0 end) as employees_left,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*), 2) as attrition_rate
From hr_employee_attrition;

--What is the attrition rate in each department?
Select Department, count (*)  total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*),  2) as attrition_percent
From hr_employee_attrition
Group by Department
Order by attrition_percent desc;

--What is the attrition rate for each job role?
Select JobRole, count(*) as total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*),2)  as attrition_percent
From hr_employee_attrition
Goup by JobRole
Order by attrition_percent desc;

--What is the attrition rate by gender?
select Gender, count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end)  as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*),   2) as attrition_percent
From  hr_employee_attrition
group by Gender;

--Which education field has the highest attrition rate?
Select EducationField, count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*),  2) AS attrition_percent
From hr_employee_attrition
group by  EducationField
order by attrition_percent desc;

--What is the average monthly income for each job role?
select jobrole,
round(avg(MonthlyIncome),2)as avg_monthly_income
from hr_employee_attrition
group by jobrole; 

--Which job roles have the highest attrition?
select JobRole, count(*) as total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*),  2) as attrition_percent
From hr_employee_attrition
Group by JobRole
Order by attrition_percent desc;

--What is the average total working years and years at company for employees who left vs stayed?
select Attrition,
round(avg(TotalWorkingYears),2)as avg_total_working_years,
round(avg(YearsAtCompany),2)as avg_years_at_company
from hr_employee_attrition
group by attrition;

--How does attrition vary across different business travel frequencies?
select BusinessTravel,
count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*),   2) as attrition_percent
From hr_employee_attrition
Group by BusinessTravel
Order by attrition_percent desc;

--Which job roles have the highest average job satisfaction?
select JobRole,
round(avg(JobSatisfaction),2) as avg_job_satisfaction
from hr_employee_attrition
group by JobRole;

--What age group has the highest attrition?
select case 
when Age < 25 then 'Under 25'
when Age between 25 and 34 then '25-34'
when Age between 35 and 44 then '35-44'
when Age between 45 and 54 then '45-54'
 else  '55+'  end as age_group,
count (*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*), 2) as attrition_percent
From hr_employee_attrition
group by  age_group
Order by attrition_percent desc;

--What is the attrition rate among single, married, and divorced employees?
Select MaritalStatus, count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*), 2) as attrition_percent
From hr_employee_attrition
Group by MaritalStatus
Order by attrition_percent desc;

--What is the average monthly income by gender?
select gender,
round(avg(MonthlyIncome),2)as avg_monthly_income
from hr_employee_attrition
group by gender;

--Does attrition differ by education level?
Select Education, count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*), 2) as attrition_percent
From hr_employee_attrition
Group by Education
Order by attrition_percent desc;

--Is there a difference in attrition between employees with different performance ratings?
Select PerformanceRating, count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round (sum(case when Attrition = 'Yes' then 1 else 0 end) * 100.0 / count (*), 2) AS attrition_percent
From hr_employee_attrition
Group by PerformanceRating
Order by attrition_percent desc;

--Does overtime impact attrition?
select OverTime, count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round(sum(case when Attrition = 'Yes' then 1 else 0 end)*100.0/count(*), 2) as attrition_percent
from hr_employee_attrition
group by OverTime
order by attrition_percent desc;

--What is the attrition percentage by years at company?
select YearsAtCompany, count(*) AS total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round(sum(case when Attrition = 'Yes' then 1 else 0 end)*100.0/count(*), 2) as attrition_percent
from hr_employee_attrition 
group by YearsAtCompany
order by attrition_percent desc;

--Is there a relationship between monthly income and attrition?
select case
when MonthlyIncome < 3000 then 'Low Income (<3000)'
when MonthlyIncome between 3000 and 7000 then 'Mid Income (3000-7000)'
else 'High Income (>7000)' end as income_group,
count(*) as total,
sum(case when Attrition = 'Yes' then 1 else 0 end) as left_count,
round(sum(case when Attrition = 'Yes' then 1 else 0 end)*100.0/count(*), 2) as attrition_percent
from hr_employee_attrition
group by income_group
order by attrition_percent desc;

--Which department has the highest average salary and lowest attrition?
select Department,
round(avg(MonthlyIncome), 2) as avg_income,
round(sum(case when Attrition = 'Yes' then 1 else 0 end)*100.0/count  (*), 2) as attrition_percent
from hr_employee_attrition
group by Department
order by avg_income desc;

--Which combination of Department and JobRole has highest attrition rate?
select Department, JobRole,
count(*) as total,
sum(case when Attrition = 'Yes' then 1 Else 0 end) as left_count,
round(sum(case when Attrition = 'Yes' then 1 Else 0 end)*100.0/count(*), 2) as attrition_percent
from hr_employee_attrition
group by Department, JobRole
order by attrition_percent desc
limit 5;

--What is the average environment satisfaction score for employees who left?
Select
round(avg(EnvironmentSatisfaction), 2) as avg_env_satisfaction
from hr_employee_attrition
where Attrition = 'Yes';

--How many employees have stayed more than 10 years but still left the company?
Select count(*) as long_tenure_left
from hr_employee_attrition
where YearsAtCompany > 10 and Attrition = 'Yes';

--Which factors (OverTime, JobLevel, Income, Age) seem to be linked with higher attrition?
Select OverTime, JobLevel,
round (avg(Age), 1) as avg_age,
round(avg(MonthlyIncome), 0) as avg_income,
round(sum(case when Attrition = 'Yes' then 1 else 0 end)*100.0/count(*), 2) as attrition_percent
from hr_employee_attrition
group by OverTime, JobLevel
order by attrition_percent desc;


























