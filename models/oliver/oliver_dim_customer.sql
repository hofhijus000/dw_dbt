{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
{{ dbt_utils.generate_surrogate_key(['Customer_ID']) }} as Customer_Key,
Customer_ID,
First_Name,
Last_Name,
Phone_Number,
Email,
State
FROM {{ source('oliver_source', 'customer') }}