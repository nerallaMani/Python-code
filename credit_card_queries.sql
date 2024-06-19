/*
project_name : credit card transactions
source : Kaggle
*/

-- overall analysis on the data 

select * from credit_card_transcations

--1) start date and end date
select min(transaction_date),max(transaction_date) from credit_card_transcations -- 2013-10-04 to 2015-05-26

--2) how many cards and what they are
select distinct card_type from credit_card_transcations
/*
4 they are 
Silver
Signature
Gold
Platinum
*/

-- 3) expense type
select distinct exp_type from credit_card_transcations
/*
Entertainment
Food
Bills
Fuel
Travel
Grocery
*/


--4) Total quantity of transactions by transaction type and order it by descending
 select card_type, 
		count(*) as total_transactions
 from credit_card_transcations
 group by card_type
 order by 2 desc

 --5) Total value of transactions by transaction type
 select card_type, 
		sum(amount) total_value
 from credit_card_transcations
 group by card_type
 go

 --6)write a query to print highest spend year and month for each card type
 with cte as
 (
 select card_type,
		datepart(year,transaction_date) year,
		datepart(month,transaction_date) month,
		sum(amount) total_spend
 from credit_card_transcations
 group by card_type, datepart(year,transaction_date), datepart(month,transaction_date)
 )
 select card_type, year, month, total_spend from
 (select *,
			rank() over(partition by card_type order by total_spend desc) rn
 from cte) x
 where rn = 1

 --7) find no.of cities which do not have gold card --doubt, 
 select count(distinct city) as total_cities
 from credit_card_transcations
 where city not in (
						 select distinct city
						 from credit_card_transcations
						 where card_type = 'gold'
						 )

SELECT COUNT(DISTINCT t1.city) AS total_cities
FROM credit_card_transactions t1
LEFT JOIN (
    SELECT DISTINCT city
    FROM credit_card_transactions
    WHERE card_type = 'gold'
) t2 ON t1.city = t2.city
WHERE t2.city IS NULL
go


SELECT COUNT(DISTINCT city) AS total_cities
FROM credit_card_transcations
WHERE city NOT IN (
    SELECT DISTINCT city
    FROM credit_card_transcations
    WHERE card_type = 'gold'
)
go

select * from credit_card_transcations


--8) write a query to find percentage contribution of spends by females for each expense type (doubt)
select exp_type,
	   sum(case when gender='f' then amount else 0 end)*1.0/sum(amount) as percentage_female_contribution
from credit_card_transcations
group by exp_type
order by 2 desc


select exp_type,
	   sum(case when gender='f' then amount else 0 end)/sum(amount) as percentage_female_contribution
from credit_card_transcations
group by exp_type
order by 2 desc


 