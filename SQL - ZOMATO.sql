create database zomato;
use zomato;
select*from main;
------------- QUESTION 3 ------------------------------

SELECT 
    c.Countryname, 
    m.City, 
    COUNT(m.RestaurantID) AS RestaurantCount
FROM Main m
LEFT JOIN Country c ON m.CountryCode = c.CountryID
GROUP BY c.Countryname, m.City;

#--------------------------------- question 4 ---------------------------------
SELECT 
    Year_Opening AS Year, 
    CONCAT('Q', CEILING(Month_Opening / 3)) AS Quarter, 
    Month_Opening AS Month, 
    COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY Year_Opening, CEILING(Month_Opening / 3), Month_Opening
ORDER BY Year, Quarter, Month;
#---------------------------------- question 5 ----------------------------------
SELECT 
    CASE 
        WHEN Rating < 1 THEN '0-1'
        WHEN Rating < 2 THEN '1-2'
        WHEN Rating < 3 THEN '2-3'
        WHEN Rating < 4 THEN '3-4'
        ELSE '5+'
    END AS Ratings,
    COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY Ratings
order by Ratings;
#----------------------------------- question 6--------------------------------
SELECT 
    CASE 
        WHEN Average_Cost_for_two < 10 THEN '0-10'
        WHEN Average_Cost_for_two < 20 THEN '10-20'
        ELSE '20+'
    END AS PriceBucket,
    COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY 
    CASE 
        WHEN Average_Cost_for_two < 10 THEN '0-10'
        WHEN Average_Cost_for_two < 20 THEN '10-20'
        ELSE '20+'
    END;
#----------------------question 7 ----------------------------
SELECT 
    (CAST(SUM(CASE WHEN Has_Table_Booking = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(RestaurantID)) * 100 AS TableBookingPercentage
FROM Main;
#-----------------------------question 8------------------------------
SELECT 
    (CAST(SUM(CASE WHEN Has_Online_Delivery = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(RestaurantID)) * 100 AS OnlineDeliveryPercentage
FROM Main;
#--------------------------------question 9 -------------------------
SELECT City, COUNT(RestaurantID) AS RestaurantCount
FROM Main
GROUP BY City
ORDER BY RestaurantCount DESC;









