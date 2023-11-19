use supplier
go

select * from SupplierMaster
select * from PartMaster
select * from SupplyDetails
/*
	1.	List the month-wise average supply of parts supplied for all parts.
	Provide the information only if the average is higher than 20.
*/
select  datename(mm, DATEOFSUPPLY) month_name,
		avg(QTYSUPPLIED) avg_supply
from  SupplyDetails 
group by datename(mm, DATEOFSUPPLY),datepart(mm,dateofsupply) 
having avg(QTYSUPPLIED)>20

/*
	2.	List the names of the Suppliers who do not supply part with PID ‘1’.
*/
select name
from SupplierMaster 
where sid not in(   
					select sid
					from SupplyDetails 
					where pid=1
				)

/*
	3.	List the part id, name, 
	price and difference between price and average price of all parts.
*/
select  pid,
		name,
		price,
		price-(select avg(price) from PartMaster) as difference
from PartMaster

/*
4.	List the names of the suppliers who have supplied 
at least one part where the quantity supplied is lower than 10.
*/

select name
from SupplierMaster 
where sid in(
				select distinct sid 
				from SupplyDetails
				where QTYSUPPLIED<1000
			)

/*
5.	List the names of the suppliers who live in a city where no supply has been made.
*/
select name
from SupplierMaster sm
where exists   (
					select *
					from SupplyDetails sd
					where sm.sid=sd.sid and sm.CITY<>sd.city
			    )
/*
6.	List the names of the parts which have not been supplied in the month of May 2019.
*/

select name
from partmaster 
where pid not in(
					select distinct pid 
					from SupplyDetails 
					where month(dateofsupply)=5 and year(dateofsupply)=2019
				 )
/*

7.	List name and Price category for all parts. 
Price category has to be displayed as “Cheap” if price is less than 100, 
“Medium” if the price is greater than or equal to 100 and less than 500,
and “Costly” if the price is greater than or equal to 500.
*/

select  name,
		price_category=
		case
			when price<100                then 'cheap'
			when price>=100 and price<500 then 'medium'
			else 'costly'
		end
from PartMaster
/*
8.	List the most recent supply details with information on Product name, 
price and no. of days elapsed since the latest supply.
*/
--for last days means use order by clause in decreasing order

select top 7 name, price
from PartMaster p join SupplyDetails s
		on p.pid=s.pid
order by DATEOFSUPPLY desc

/*
9.	List the names of the suppliers who have supplied exactly 100 units of part P1.
*/

select name
from SupplierMaster
where sid in(
				select sid
				from SupplyDetails 
				where pid=1 and QTYSUPPLIED=300
			)
/*
10.	List the names of the parts supplied by more than one supplier.
*/
select  name,
		count(1) no_of_suppliers
from PartMaster pm join SupplyDetails sd
				on pm.pid=sd.pid
group by name
having count(1)>1
/*
11.	List the names of the parts whose price is less than the average price of parts.
*/
select name
from PartMaster 
where price<(select avg(price) from PartMaster)
/*
12.	List the category-wise number of parts; exclude
those where the sum is > 100 and less than 500.
List in the descending order of sum.
*/
select  category,
		sum(price) sum_price
from PartMaster
group by CATEGORY
having sum(price) not between 100 and 500
order by sum_price desc
/*
13.	List the supplier name, part name and supplied quantity for all 
supplies made between 1st and 15th of June 2020.
*/
select * from SupplierMaster
select * from PartMaster
select * from SupplyDetails

select  s.name,
		p.name,
		QTYSUPPLIED
from SupplierMaster s join SupplyDetails sd
			on s.sid=sd.sid
			join PartMaster p
			on p.pid=sd.pid
where DATEOFSUPPLY between '2020/06/1' and '2020/06/15'
/*
14.	For all products supplied by Supplier S1, List the part name and total quantity.
*/

select  p.name,
		sum(qtysupplied) total_qty
from SupplierMaster s join SupplyDetails sd
			on s.sid=sd.sid
			join PartMaster p
			on p.pid=sd.pid
where s.sid=1
group by p.name
/*
15.	For the part with the minimum price, List the latest supply details
(Supplier Name, Part id, Date of supply, Quantity Supplied).
*/
select * 
from SupplyDetails
where pid in(
				select pid
				from PartMaster
				where price =  (
									select min(price) min_price
									from PartMaster
				                )
			)	















