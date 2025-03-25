{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
{{ dbt_utils.generate_surrogate_key(['Employee_ID']) }} as Employee_Key,
Employee_ID,
First_Name,
Last_Name,
Email,
Phone_Number,
Hire_Date,
Position
FROM {{ source('oliver_source', 'employee') }}