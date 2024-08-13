-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size, SUM(order_details.quantity)
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY SUM(order_details.quantity) DESC;