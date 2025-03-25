{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

SELECT
d.Date_ID,
s.Store_ID,
c.First_Name AS Customer_First_Name,
c.Last_Name AS Customer_Last_Name,
e.First_Name AS Employee_First_Name,
e.Last_Name AS Employee_Last_Name,
p.Product_Name,
f.Unit_Price,
f.Quantity
FROM {{ ref('fact_sales') }} f
LEFT JOIN {{ ref("oliver_dim_customer") }} c ON c.Customer_Key = f.Customer_Key
LEFT JOIN {{ ref("oliver_dim_date") }} d ON d.Date_Key = f.Date_Key
LEFT JOIN {{ ref("oliver_dim_employee") }} e ON e.Employee_Key = f.Employee_Key
LEFT JOIN {{ ref("oliver_dim_product") }} p ON p.Product_Key = f.Product_Key
LEFT JOIN {{ ref("oliver_dim_store") }} s ON s.Store_Key = f.Store_Key