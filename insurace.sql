-- Cross sell
-- Target
select (select sum(cross_sell_bugdet) from individualbudget) target,
-- Invoice
 (select sum(Amount) from invoice where income_class = "Cross Sell")  invoice,
 -- Achieved
 (select sum(achieved) as achived
from(
select sum(Amount) achieved
from fees
where income_class = "Cross Sell"
union
select sum(Amount) achieved
from brokerage
where income_class = "Cross Sell") as subquery) achieved;


-- New
-- Target
select (select sum(New_Budget) from individualbudget) target,
-- Invoice
(select sum(Amount) from invoice where income_class = "New") invoice,
-- Achieved
(select round(sum(achieved),0) as achieved 
from
(select sum(Amount) achieved
from brokerage
where income_class = "New"
union
select sum(Amount) achieved
from fees
where income_class = "New") as subquery) achieved;
 
 
 -- Renewal
 -- Target
 select (select sum(Renewal_Budget) from individualbudget) target,
 -- Invoice
 (select sum(Amount) from invoice where income_class = "Renewal") Invoice,
 -- Achieved
 (select round(sum(achieved),0) as achieved
 from 
 (select sum(Amount) achieved
 from brokerage
 where income_class = "Renewal" 
 union
 select sum(Amount) achieved
 from fees
 where income_class= "Renewal" ) as subquery) achieved;

-- No. of meetings by account executive
select Account_Executive, count(Account_Exe_ID) as Total_Meetings
from meeting
group by Account_Executive
order by Total_Meetings desc;


-- No. of Invoice by Account executive
select Account_Executive, count(invoice_number) as Total_Invoice
from invoice
group by Account_Executive
order by Total_Invoice desc;

-- Top 4 Opportunity by revenue
select opportunity_name, sum(revenue_amount) as Total_Revenue
from opportunity
group by opportunity_name
order by Total_Revenue desc
limit 4;

-- Stages by Revenue
select stage, sum(revenue_amount) as Total_revenue
from opportunity
group by stage
order by Total_revenue desc;

-- opportunity by product distribution
select product_group, count(product_group) as Total
from opportunity
group by product_group
order by Total desc;



























