{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
{{ dbt_utils.generate_surrogate_key(['Product_ID']) }} as Product_Key,
Product_ID,
Product_Name,
Description
FROM {{ source('oliver_source', 'product') }}