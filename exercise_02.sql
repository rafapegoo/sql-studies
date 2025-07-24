-- Creates a CTE 'leads' to count the number of page visits per month
WITH 
    leads AS (
        SELECT
            date_trunc('month', visit_page_date)::date AS visit_page_month,
            count(*) AS visit_page_count
        FROM sales.funnel
        GROUP BY visit_page_month
        ORDER BY visit_page_month
    ),
    
    -- Creates a CTE 'payments' to count the number of payments per month,
    -- calculate total revenue, and join with product prices and discounts
    payments AS (
        SELECT
            date_trunc('month', fun.paid_date)::date AS paid_month,
            count(fun.paid_date) AS paid_count,
            sum(pro.price * (1 + fun.discount)) AS receita
        FROM sales.funnel AS fun
        LEFT JOIN sales.products AS pro
            ON fun.product_id = pro.product_id
        WHERE fun.paid_date IS NOT NULL
        GROUP BY paid_month
        ORDER BY paid_month
    )

-- Final query: joins 'leads' and 'payments' to produce a monthly performance report
SELECT
    leads.visit_page_month AS "mês",
    leads.visit_page_count AS "leads (#)",
    payments.paid_count AS "vendas (#)",
    (payments.receita / 1000) AS "receita (k, R$)",
    (payments.paid_count::float / leads.visit_page_count::float) AS "conversão (%)",
    (payments.receita / payments.paid_count / 1000) AS "ticket médio (k, R$)"
FROM leads
LEFT JOIN payments
    ON leads.visit_page_month = paid_month;
