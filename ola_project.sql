CREATE DATABASE OLA;
USE OLA;

SELECT * FROM bookings;

-- ---------------------------------------------- --
 -- 1. Retrieve all successful bookings. --
 CREATE VIEW Successful_Bookings AS 
 SELECT * FROM bookings WHERE Booking_Status='Success';
 -- ---------------------------------------------- --
 -- 2. Find the average ride distance for each vehicle type:
 CREATE VIEW ride_distance_for_each_vehicle_type AS
 (SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_dist 
  FROM Bookings
  GROUP BY Vehicle_Type);
  -- ---------------------------------------------- --
 -- 3. Get the total number of cancelled rides by customers:
 CREATE VIEW Canceled_by_Customer AS 
 (SELECT COUNT(*) 
  FROM bookings 
  WHERE Booking_Status = 'Canceled by Customer');
   -- ---------------------------------------------- --
 -- 4. List the top 5 customers who booked the highest number of rides:
 CREATE VIEW TOP_CUSTOMERS_RIDE_COUNT AS 
	 (SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
	 FROM Bookings 
	 GROUP BY Customer_ID
	 ORDER BY total_rides DESC
	 LIMIT 5);
   -- ---------------------------------------------- --
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT DISTINCT Canceled_Rides_by_Driver FROM BOOKINGS;
SELECT COUNT(*) AS cancelled_ride_count
FROM BOOKINGS
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
-- ---------------------------------------------- --
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) AS max_driver_rating, MIn(Driver_Ratings) AS min_driver_rating
FROM BOOKINGS
WHERE Vehicle_Type = 'Prime Sedan';
-- ---------------------------------------------- --
-- 7. Retrieve all rides where payment was made using UPI:
SELECT Customer_ID 
FROM BOOKINGS
WHERE Payment_Method = 'UPI';
-- ---------------------------------------------- --
-- 8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) AS avg_customer_rating
FROM BOOKINGS
GROUP BY Vehicle_Type;
-- ---------------------------------------------- --
-- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value)
FROM BOOKINGS
WHERE Booking_Status = 'Success';
-- ---------------------------------------------- --
-- 10. List all incomplete rides along with the reason
SELECT Booking_ID, Incomplete_Rides_Reason
FROM BOOKINGS
WHERE Incomplete_Rides_Reason IS NOT NULL;
-- ---------------------------------------------- --
