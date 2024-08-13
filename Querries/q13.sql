-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.


SELECT category, name, rev
FROM
(SELECT category, name, rev, rank() over(PARTITION BY category ORDER BY rev desc ) as sales_rank
FROM
(SELECT pizza_types.category, pizza_types.name, SUM(order_details.quantity * pizzas.price) as rev
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category, pizza_types.name) AS db_a) AS db_b
WHERE sales_rank <= 3;