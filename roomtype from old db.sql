SELECT 
    a.ID AS AccommodationID,
    a.ClientID,
    r.TypeID,
    CAST(CONVERT(VARCHAR(8), a.ArrivalDate, 112) AS BIGINT) AS ArrivalDateAsBigInt,
    CAST(CONVERT(VARCHAR(8), a.DepartureDate, 112) AS BIGINT) AS DepartureDateAsBigInt,
    CASE 
        WHEN a.BookingID IS NULL THEN CAST(0 AS BIT)  -- 0 означает "нет бронирования"
        ELSE CAST(1 AS BIT)                           -- 1 означает "бронирование есть"
    END AS IsBooking
FROM 
    AccommodationInfo a
JOIN 
    Room r ON a.RoomID = r.ID
JOIN 
    RoomType rt ON r.TypeID = rt.ID;


  
