SELECT 
    {{ dbt_utils.generate_surrogate_key( ["s.businessentityid"] ) }} as store_id,
    s.businessentityid as nk_store,
    name,
    dsp.sales_person_id as sales_person_id,
    s.demographics,
    s.modifieddate as modified_date,
    {{ dbt_date.now() }} as created_at,
    {{ dbt_date.now() }} as updated_at
FROM {{source('pacbikes_raw', 'store')}} as s
join {{ref("dim_sales_person")}} as dsp on s.salespersonid = dsp.nk_sales_person