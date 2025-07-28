SELECT 
    ct.category_name,
    ct.description,
    ct.size_sqft,
    ct.has_balcony,
    ct.has_ocean_view,
    cp.current_price,
    cp.available_cabins,
    cp.is_sold_out,
    CASE 
        WHEN cp.current_price < cp.base_price THEN 
            ROUND(((cp.base_price - cp.current_price) / cp.base_price * 100), 0)
        ELSE 0 
    END AS discount_percentage
FROM cruise_pricing cp
JOIN cabin_types ct ON cp.cabin_type_id = ct.cabin_type_id
WHERE cp.cruise_id = 1
    AND cp.available_cabins > 0
ORDER BY cp.current_price;
