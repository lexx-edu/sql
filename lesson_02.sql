-- Задание 01.
-- Используя операторы языка SQL, создайте табличку “sales”. 
-- Заполните ее данными

create table sql_course.sales (
    id int8 not null,
    order_date date not null,
    bucket varchar(50) not null
);

insert into sql_course.sales (id, order_date, bucket)
values
(1, '2021-01-01', '101 to 300'),
(1, '2021-01-02', '101 to 300'),
(1, '2021-01-03', 'less than equal to 100'),
(1, '2021-01-04', '101 to 300')
(1, '2021-01-05', 'greater than 300');

-- Задание 02.
-- Сгруппируйте значений количества в 3 сегмента:
--      меньше 100, 100-300 и больше 300.

select 
    id
    , order_date
    , case 
        when bucket like '101%' then 'Средний заказ'
        when bucket like 'less%' then 'Маленький заказ'
        when buckey like 'greater%' then 'Большой заказ'
    end as segment
from sql_course.sales

-- Задание 03.
-- Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE

create table sql_course.orders (
    order_id int8 not null generated always as identity,
    employee_id varchar(5) not null,
    amount float4 not null,
    order_status varchar(10)
);

insert into sql_course.orders (employee_id, amount, order_status)
values
('e03', 15.0, 'OPEN'),
('e01', 25.5, 'OPEN'),
('e05', 100.7, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.5, 'CANCELLED'),
('e04', 99.9, 'OPEN');

select
    order_id
    , order_status
    , case
        when order_status = 'OPEN' then 'Order is in OPEN state'
        when order_status = 'CLOSED' then 'Order is CLOSED'
        when order_status = 'CANCELLED' then 'Order is CANCELLED'
        else order_status
    end as order_summary
from sql_course.orders;
