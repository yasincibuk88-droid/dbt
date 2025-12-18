WITH TRIPS AS (

    select
    RIDE_ID,
    -- RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) as TRIP_DATE,
    START_STATIO_ID as start_station_id,
    END_STATION_ID,
    MEMBER_CSUAL as member_casual,
    TIMESTAMPDIFF(second, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) as TRIP_DURATION_SECONDS
    
    from {{ ref('stg_bike') }}
    where RIDE_ID != '"bikeid"' and RIDE_ID != 'ride_id'
    limit 10
)

select
*
FROM TRIPS