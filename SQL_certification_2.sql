--1)
-- объединение таблиц с использованием 'JOIN'
SELECT
	a.aircraft_code,
	a.model,
	a."range",
	s.seat_no,
	s.fare_conditions 
FROM bookings.aircrafts a
JOIN bookings.seats s 
ON a.aircraft_code = s.aircraft_code
ORDER BY 1;
-- объединение таблиц с использованием 'UNION'
SELECT
	a.aircraft_code,
	a.model AS object
FROM bookings.aircrafts a
UNION
SELECT
	s.aircraft_code,
	s.fare_conditions AS object
FROM bookings.seats s 
ORDER BY 1;

--2)
SELECT
	*
FROM bookings.ticket_flights tf 
WHERE tf.fare_conditions = 'Economy' 
ORDER BY 1
LIMIT 20;

--3)
SELECT
	t.passenger_name,
	count(*),
	round(avg(tf.amount)) AS average_amount,
	sum(tf.amount),
	min(tf.amount),
	max(tf.amount)
FROM bookings.tickets t
JOIN bookings.ticket_flights tf ON t.ticket_no = tf.ticket_no
GROUP BY t.passenger_name
ORDER BY count DESC;

--4)
SELECT
	t.passenger_name,
	tf.fare_conditions,
	tf.amount,
	bp.seat_no
FROM bookings.tickets t
JOIN bookings.ticket_flights tf ON t.ticket_no =tf.ticket_no
JOIN bookings.boarding_passes bp ON tf.ticket_no = bp.ticket_no
WHERE tf.fare_conditions = 'Economy'
ORDER BY 1;

--5)
CREATE OR REPLACE VIEW model_air AS
	SELECT
	  a model,'range'
	FROM bookings.aircrafts a
	WHERE  "range" >= 6000
	ORDER BY "range" DESC
	LIMIT 5;
	
SELECT*FROM model_air;

