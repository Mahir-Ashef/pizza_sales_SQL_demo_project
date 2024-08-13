-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(orders.order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(orders.order_time)
ORDER BY HOUR(orders.order_time);