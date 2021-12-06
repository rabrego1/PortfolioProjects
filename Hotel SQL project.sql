with hotels as (
Select *From..[2018]
union
Select * From..[2019]
union 
Select * FROM..[2020])


select * from hotels
left join dbo.market_segment$ 
on hotels.market_segment = market_segment$.market_segment
left join meal_cost
on meal_cost.meal =hotels.meal