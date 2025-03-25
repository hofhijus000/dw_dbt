{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
Customer_Key,
Date_Key,
Employee_Key,
Product_Key,
Store_Key,
Quantity,
Quantity*Unit_Price AS Dollars_Sold,
Unit_Price
FROM {{ source('oliver_source', 'orders') }} o
INNER JOIN {{ source('oliver_source', 'orderline') }} ol ON ol.Order_ID = o.Order_ID
INNER JOIN {{ ref('oliver_dim_customer') }} c ON c.Customer_ID = o.Customer_ID
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.Date_ID = o.Order_Date
INNER JOIN {{ ref('oliver_dim_employee') }} e ON e.Employee_ID = o.Employee_ID
INNER JOIN {{ ref('oliver_dim_product') }} p ON p.Product_ID = ol.Product_ID
INNER JOIN {{ ref('oliver_dim_store') }} s ON s.Store_ID = o.Store_ID
