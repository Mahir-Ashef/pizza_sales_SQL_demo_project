-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(daily_quantity), 0) AS daily_avg_order
FROM
    (SELECT 
        orders.order_date,
            SUM(order_details.quantity) AS daily_quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS date_wise_orders;