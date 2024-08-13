-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizzas.pizza_id,
    ROUND(SUM(order_details.quantity * pizzas.price),
            0) AS revenue_per_pizza_type
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.pizza_id
ORDER BY revenue_per_pizza_type DESC
LIMIT 3;