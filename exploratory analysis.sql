--churned customers on plan tier
select plan_tier ,
count (*) customer_id
from subscriptions_clean
where churned = 1
group by plan_tier


--churned customers on plan type
select plan_type ,
count (*) customer_id
from subscriptions_clean
where churned = 1
group by plan_type


--churned customers on age group
select age_group,
count (*) customer_id
from subscriptions_clean
where churned = 1
group by age_group


--churned customers on acquisition channel
select acquisition_channel ,
count (*) customer_id
from subscriptions_clean
where churned = 1
group by acquisition_channel


--churned customers on cancel reason
select cancel_reason,
count (*) customer_id
from subscriptions_clean
where churned = 1
group by cancel_reason

--churned customers on monthly price
select monthly_price,
count (*) customer_id
from subscriptions_clean
where churned = 1
group by monthly_price

