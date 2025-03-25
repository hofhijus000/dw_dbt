{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
{{ dbt_utils.generate_surrogate_key(['Store_ID']) }} as Store_Key,
Store_ID,
Store_Name,
Street,
City,
State
FROM {{ source('oliver_source', 'store') }}