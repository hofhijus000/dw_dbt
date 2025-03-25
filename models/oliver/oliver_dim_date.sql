{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
)

SELECT
{{ dbt_utils.generate_surrogate_key(['date_day']) }} as Date_Key,
date_day AS Date_ID,
day_of_week,
month_of_year AS Month,
quarter_of_year AS Quarter,
year_number
FROM cte_date