{% macro get_pokemons_by_type_view(type) %}

    {{ config(
        materialized='view',
        alias=type ~ '_types_pokemon'
    ) }}

    WITH pokemon AS (
        SELECT * FROM {{ source('dbt_training', 'pokemon') }}
    ),
    types AS (
        SELECT * FROM {{ source('dbt_training', 'types') }}
    ),
    pokemon_types AS (
        SELECT * FROM {{ source('dbt_training', 'pokemon_types') }}
    )

    SELECT pokemon.identifier
    FROM pokemon
    INNER JOIN pokemon_types ON pokemon.id = pokemon_types.pokemon_id
    INNER JOIN types ON pokemon_types.type_id = types.id
    WHERE types.identifier = '{{ type }}'

{% endmacro %}