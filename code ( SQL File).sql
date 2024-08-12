create database HR analytics

create table hrdata
(
	employee_id int PRIMARY KEY,
	full_name varchar(50),
	job_title varchar(50),
	department varchar(50),
	business_unit varchar(50),
	gender Varchar(50),
	ethnicity varchar(50),
	age int,
	country varchar(50),
	city varchar(50)
);


select * from hrdata

COPY hrdata FROM 'D:\hrdata.csv' DELIMITER ',' CSV HEADER; --import data from source(excel)

select sum(employee_count) as Employee_Count from hrdata; --Employee_Count

select count(attrition) from hrdata where attrition='Yes'; --Attrition count

select round(avg(age),0) from hrdata;  --Attrition rate

select sum(employee_count) - (select count(attrition) from hrdata  where attrition='Yes') from hrdata; --Active Employee

select round(avg(age),0) from hrdata;--Average Age

select gender, count(attrition) as attrition_count from hrdata where attrition='Yes'
group by gender
order by count(attrition) desc; --Attrition by Gender

select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from hrdata where attrition= 'Yes')) * 100, 2) as pct from hrdata
where attrition='Yes'
group by department 
order by count(attrition) desc; --Department wise Attrition

SELECT age,  sum(employee_count) AS employee_count FROM hrdata
GROUP BY age order by age; --No of Employee by Age Group

select education_field, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by education_field
order by count(attrition) desc; --Education Field wise Attrition:





