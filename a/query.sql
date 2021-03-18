SELECT * FROM airports;
SELECT * FROM airlines;
SELECT * FROM routes;

-- Show how many routes have each airlines
SELECT a.airline_name, COUNT(r.route_id) as total
FROM airlines a
INNER JOIN routes r 
ON a.airline_id = r.airline_id
GROUP BY a.airline_id
ORDER BY a.airline_name ASC;

-- Show how many destination routes have each source airport city
SELECT a.city, COUNT(r.dest_airp_id) as total
FROM airports a
INNER JOIN routes r
ON (a.airport_id=r.sour_airp_id)
GROUP BY a.city
ORDER BY total DESC;

-- Show how many destination routes have each airport
SELECT a.airport_id, a.name, COUNT(r.route_id) as total
FROM airports a
INNER JOIN routes r
ON (a.airport_id=r.dest_airp_id)
GROUP BY a.airport_id;

--Show the routes by airport, showing the airline and the destination
SELECT a.name, a.city, a.iata, al.airline_name, l.name as "destination airport", l.city as "destination city", r.destination_iata as "destination iata"
FROM airports a
INNER JOIN routes r
ON (a.airport_id=r.sour_airp_id)
INNER JOIN airports l
ON (l.airport_id=r.dest_airp_id)
INNER JOIN airlines al
ON (r.airline_id=al.airline_id)
ORDER BY a.name ASC;


-- Show how many destination routes have a particular airport city
SELECT a.name, a.city, a.iata, al.airline_name, l.name as "destination airport", l.city as "destination city", r.destination_iata as "destination iata"
FROM airports a
INNER JOIN routes r
ON (a.airport_id=r.sour_airp_id)
INNER JOIN airports l
ON (l.airport_id=r.dest_airp_id)
INNER JOIN airlines al
ON (r.airline_id=al.airline_id)
WHERE a.city = 'Austin';