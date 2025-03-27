-- câu 1:
select
    users.user_id,
    users.user_name,
    orders.order_id
from
    orders
    inner join users on orders.user_id = users.user_id;

--câu 2:
select
    users.user_id,
    users.user_name,
    count(orders.user_id) as 'Số đơn hàng'
from
    orders
    inner join users on orders.user_id = users.user_id
group by
    (orders.user_id);

-- câu 3:
select
    order_details.order_id as 'Mã đơn hàng',
    count(order_details.product_id) as 'Số sản phẩm'
from
    order_details
    inner join orders on order_details.order_id = orders.order_id
    inner join products on order_details.product_id = products.product_id
group by
    (order_details.order_id);

--câu 4: 
select
    u.user_id,
    u.user_name,
    o.order_id,
    group_concat(p.product_name separator ',') as product_list
from
    order_details od
    inner join products p on od.product_id = p.product_id
    inner join orders o on od.order_id = o.order_id
    inner join users u on o.user_id = u.user_id
group by
    od.order_id;

--câu 5:
select
    u.user_id,
    u.user_name,
    count(o.user_id) as total_orders
from
    users u
    join orders o on o.user_id = u.user_id
group by
    o.user_id
order by
    total_orders desc
limit
    7;

--câu 6:
select
    o.user_id,
    u.user_name,
    o.order_id,
    GROUP_CONCAT(p.product_name, '') products_list
from
    order_details od
    join orders o on od.order_id = o.order_id
    join users u on o.user_id = u.user_id
    join products p on od.product_id = p.product_id
where
    p.product_name like '%Samsung%'
    or p.product_name like '%Apple%'
group by
    o.order_id;

--câu 7:
select
    o.user_id,
    u.user_name,
    o.order_id,
    SUM(p.product_price) total_price
from
    order_details od
    join orders o on o.order_id = od.order_id
    join products p on p.product_id = od.product_id
    join users u on u.user_id = o.user_id
group by
    o.order_id
order by
    o.order_id;

--câu 8:
-- SELECT
--     user_id,
--     user_name,
--     order_id,
--     tong_tien
-- FROM
--     (
--         SELECT
--             users.user_id,
--             users.user_name,
--             orders.order_id,
--             SUM(products.product_price) AS tong_tien,
--             ROW_NUMBER() OVER (
--                 PARTITION BY users.user_id
--                 ORDER BY
--                     SUM(products.product_price) DESC
--             ) AS rn
--         FROM
--             users
--             JOIN orders ON users.user_id = orders.user_id
--             JOIN order_details ON orders.order_id = order_details.order_id
--             JOIN products ON order_details.product_id = products.product_id
--         GROUP BY
--             users.user_id,
--             users.user_name,
--             orders.order_id
--     ) AS t
-- WHERE
--     rn = 1;
-- SELECT
--     user_id,
--     user_name,
--     order_id,
--     tong_tien
-- FROM
--     (
--         SELECT
--             users.user_id,
--             users.user_name,
--             orders.order_id,
--             SUM(products.product_price) AS tong_tien,
--             ROW_NUMBER() OVER (
--                 PARTITION BY users.user_id
--                 ORDER BY
--                     SUM(products.product_price) DESC
--             ) AS rn
--         FROM
--             users
--             JOIN orders ON users.user_id = orders.user_id
--             JOIN order_details ON orders.order_id = order_details.order_id
--             JOIN products ON order_details.product_id = products.product_id
--         GROUP BY
--             users.user_id,
--             users.user_name,
--             orders.order_id
--     ) AS t
-- WHERE
--     rn = 1;
--câu 9: