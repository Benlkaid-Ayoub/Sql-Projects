-- The Medical Insurance dataset on Kaggle has the following columns:
-- PatientID : Integer Value.
-- age: age of primary beneficiary
-- sex: gender of primary beneficiary (male or female)
-- bmi: body mass index of primary beneficiary
-- children: number of children covered by health insurance / number of dependents
-- smoker: whether the primary beneficiary is a smoker or not (yes or no)
-- region: the beneficiary's residential area in the US (northeast, southeast, southwest, or northwest)
-- charges: individual medical costs billed by health insurance

-- Create a database named 'insurance'.
create database insurance;

-- 1.all columns for all patients.
select* from insurance_data;

-- 2. the average claim amount for patients in each region.
select avg(claim) as avg_claim 
from insurance_data
group by region;



-- 3. the maximum and minimum BMI values in the table.

select max(bmi) as max_bmi,
min(bmi) as min_bmi
from insurance_data;

-- 4. the PatientID, age, and BMI for patients with a BMI between 40 and 50.
select PatientID,age,bmi 
from insurance_data
where bmi between 40 and 50;


-- 5. Select the number of smokers in each region.
select region,count(*) 
from insurance_data
where smoker = 'yes'
group by region;

-- 6.the average claim amount for patients who are both diabetic and smokers
select avg(claim) 
from insurance_data
where diabetic = 'yes'
and smoker= 'yes';
-- 7.all patients smokers who have a BMI greater 
-- than the average BMI of patients who are smokers.
select * from insurance_data
where bmi >(select avg(bmi) 
from insurance_data 
where smoker='yes') and smoker= 'yes';

-- 8. Select the average claim amount for patients in each age group.

select 
case
when age < 18 then "Under 18"
when age between 18 and 30 then "18-30"
when age between 31 and 50 then "31-50"
else "Over 50"
end as age_group ,
round(avg(claim),2) as avg_claim 
from insurance_data
group by age_group;
-- 9.the total claim amount for each patient, 
-- along with the average claim amount across all patient
select *,
sum(claim) over (partition by patientid) as Total_Claim ,
avg(claim) over() as avg_claim 
from insurance_data ;

-- 10.the top 3 patients with the highest claim amount, along with their 
-- respective claim amounts and the total claim amount for all patients.
select* ,claim,sum(claim) over() as total_claim from insurance_data
order by claim desc
limit 3 ;

-- 11.the details of patients who have a claim amount 
-- greater than the average claim amount for their region.

select * from (select *, avg(claim)  over(partition by region) 
as avg_claim from insurance_data) as subquery
where claim > avg_claim;

-- 12.the rank of each patient based on their claim amount.
select *,rank()over(order by claim desc) from insurance_data;

-- 13.the details of patients along with their claim amount, 
-- and their rank based on claim amount within their region.

select *, rank() over(partition by region order by claim desc) from insurance_data;