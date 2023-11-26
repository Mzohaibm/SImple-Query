WITH UserOrderDetails AS (
    SELECT
        u.user_id,
        u.user_name,
        o.order_id,
        o.order_date,
        p.product_name,
        p.product_price
    FROM
        users u
    JOIN
        orders o ON u.user_id = o.user_id
    JOIN
        order_details od ON o.order_id = od.order_id
    JOIN
        products p ON od.product_id = p.product_id
    WHERE
        o.total_amount > 100
)

SELECT
    user_id,
    user_name,
    MAX(order_id) AS latest_order_id,
    MAX(order_date) AS latest_order_date,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(product_price) AS total_spent
FROM
    UserOrderDetails
GROUP BY
    user_id, user_name
HAVING
    total_spent > 500
ORDER BY
    latest_order_date DESC;
