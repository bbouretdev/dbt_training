WITH pokemon_names AS (
    SELECT 
        identifier AS pokemon_id
    FROM 
        {{ source('dbt_training', 'pokemon') }}
)
SELECT 
    pokemon_id
FROM 
    pokemon_names