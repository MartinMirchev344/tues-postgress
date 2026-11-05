-- For a given order, show each person's name and how much they owe.
-- Replace 1 with the id of the order to inspect. Each row is one person;
-- their amount is quantity times menu price, summed across their items.
SELECT s.name,
       SUM(oi.quantity * mi.price)::NUMERIC(10, 2) AS amount_owed
FROM order_item AS oi
JOIN student AS s ON s.id = oi.student_id
JOIN menu_item AS mi ON mi.id = oi.menu_item_id
WHERE oi.order_id = 1
GROUP BY s.id, s.name
ORDER BY s.name;

-- Show every order total, oldest first. Each row is one order and its total
-- is calculated from all of that order's item quantities and menu prices.
SELECT fo.id AS order_id,
       fo.ordered_on,
       SUM(oi.quantity * mi.price)::NUMERIC(10, 2) AS order_total
FROM food_order AS fo
JOIN order_item AS oi ON oi.order_id = fo.id
JOIN menu_item AS mi ON mi.id = oi.menu_item_id
GROUP BY fo.id, fo.ordered_on
ORDER BY fo.ordered_on, fo.id;
