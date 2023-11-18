create database titanicdata;

-- 1.the first 10 rows of the dataset.

select * from titanic
limit 10;
-- 2.the number of passengers who survived.
select count(*) as 'passegers who survived' from titanic 
where Survived = 1;
-- 3.the average age of all passengers.

select avg(age) as avg_age from titanic;


-- 4.the number of passengers in each class.
select pclass, count(*) as No_of_Passengers from titanic
group by Pclass;
-- 5.the first 10 rows of the dataset sorted by passenger class in descending order.

select* from titanic
order by Pclass desc
limit 10 ;
-- 6.the number of passengers in each class sorted by class in ascending order.

select Pclass , count(*) from titanic
group by Pclass
order by Pclass ;

-- 7.the average fare paid by passengers in each class.

select pclass ,round(avg(fare),2) as Avg_Fare_Paid from titanic
group by pclass;
-- 8. the name of the passenger with the highest fare.

select name from titanic
where fare =(select max(fare) from titanic);

-- 9.the name of the passenger who had the highest age among the survivors.

select name from titanic
where age=(select max(age) from titanic);
-- 10.the number of passengers who paid more than the average fare.

select count(*) as No_Passengers from titanic
where fare>(select avg(fare) from titanic);
-- 11.the name of the passenger who had the most parents or children on board.

select name from titanic
where Parch =(select max(parch) from titanic);
-- 12.the number of male and female passengers who survived,
-- and order the results by sex in ascending order:
select sex ,count(*) from titanic
where Survived= 1
group by sex 
order by sex;

-- 13. the name, age, and fare of the oldest passenger who survived.

select name , age,fare from titanic
where Survived = 1
AND 	age = (select max(age ) from titanic);

-- 14.the name and age of the youngest female passenger who survived in third class.

select name,age from titanic
where Survived = 1
and age = (select min(age) from titanic);

-- 15. Number of male and female passengers.
select  sex ,count(*) from titanic
group by sex;

-- 16.all passengers who traveled in a cabin that was not shared by other passengers.

select * from titanic 
where cabin not in 
(select Cabin from titanic group by cabin having count(*) > 1);
