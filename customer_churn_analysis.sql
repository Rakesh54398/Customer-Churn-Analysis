 
 WITH cte_per_customer AS (
    SELECT 
        customer_id,
        DATEDIFF(day, signup_date, churn_date) AS total_days_used,      
        DATEDIFF(month, signup_date, churn_date) AS total_months
        
    FROM subscriptions_clean
 ) ,
 cte_total_minutes as 
 ( select customer_id ,
 sum (minutes_active) as total_minutes_spent
 from [usage cleaned]
 group by customer_id
 ),
 cte_total_hours_spent as 
 (
 SELECT 
 customer_id ,
  CAST(total_Minutes_spent / 60 AS VARCHAR) + ':' + 
  RIGHT('0' + CAST(total_Minutes_spent % 60 AS VARCHAR), 2) as total_hours_spent
FROM cte_total_minutes 
)

select
distinct sc.customer_id,
sc.signup_date,
sc.plan_type,
sc.plan_tier,
sc.acquisition_channel,
sc.monthly_price,
sc.age_group,
sc.churned,
sc.churn_date,
sc.cancel_reason,
cpc.total_days_used,
cpc.total_months,
ctm.total_minutes_spent,
cths.total_hours_spent,
sum (classes_booked) over (partition by sc.customer_id) total_classes_booked ,
sum (support_tickets) over (partition by sc.customer_id) total_support_tickets,
sum(workouts_completed)  over (partition by sc.customer_id) total_workouts_completed
 from subscriptions_clean as sc 
left join [usage cleaned]as uc
on sc.customer_id = uc.customer_id
left join cte_per_customer as cpc 
on sc.customer_id =cpc.customer_id
left join cte_total_minutes as ctm 
on sc.customer_id = ctm.customer_id
left join cte_total_hours_spent as cths
on sc.customer_id = cths.customer_id






