#rename columns in Price Ranking table

select * from price_ranking;
ALTER TABLE price_ranking
RENAME COLUMN col_1 TO Airline;

ALTER TABLE price_ranking
RENAME COLUMN col_2 TO PriceRanking;


#checking number of flights for one route
select airline_name, count(arrival_iataCode) number_of_flights
from hist_flights.flights f
join hist_flights.price_ranking p
on f.airline_name = p.col_1
where f.departure_iataCode = "BUD" and f.arrival_iataCode = "SXF"
group by airline_name
;

#showing avg delay per airline for all flights
select airline_name, round(avg(arrival_delay),2) delay, count(arrival_iataCode) number_of_flights
from hist_flights.flights f
join hist_flights.price_ranking p
on f.airline_name = p.Airline
group by airline_name
having delay >0
order by delay DESC;

#showing avg delay per airline for delayed flights
select airline_name, round(avg(arrival_delay),2) delay, count(arrival_iataCode) number_of_flights, p.PriceRanking
from  (
	select *
	from hist_flights.flights f
    where arrival_delay > 0
    ) t
join hist_flights.price_ranking p
on airline_name = p.Airline
group by airline_name, PriceRanking
having delay >0 AND number_of_flights> 20
order by delay DESC;

select airline_name
from flights
where airline_name like ("delta%");

#calculationg stdev and n for statistical analysis

select airline_name, FORMAT(STDDEV(arrival_delay),2) as stdev_delay, round(avg(arrival_delay),2) as delay, count(arrival_iataCode) number_of_flights, p.PriceRanking,
CASE
    WHEN PriceRanking < 0.14 THEN "low-cost"
    WHEN PriceRanking between 0.15 and 0.19 THEN "moderately low"
    WHEN PriceRanking between 0.20 and 0.29 THEN "moderately expensive"
    ELSE "expensive"
END as price_ranking
from  (
	select *
	from hist_flights.flights f
    where arrival_delay > 0
    ) t
join hist_flights.price_ranking p
on airline_name = p.Airline
group by airline_name, PriceRanking
having stdev_delay >0 AND number_of_flights> 20 and airline_name in ("Lufthansa", "Ryanair")
order by price_ranking DESC;


select count(airline_name)
from flights;
