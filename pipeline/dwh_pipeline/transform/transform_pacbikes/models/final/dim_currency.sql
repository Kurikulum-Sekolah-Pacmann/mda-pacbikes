With currency as (
    SELECT * FROM {{source('pacbikes_raw', 'currency')}}
)
SELECT 
    currencycode as currency_code,
    name,
    modifieddate as modified_date,
    {{ dbt_date.now() }} as created_at,
    {{ dbt_date.now() }} as updated_at
FROM currency