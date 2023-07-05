-- Задание 01.
-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
-- Заполните БД данными

create table sql_course.phones (
    id int8 not null generated always as identity,
    product_name varchar not null,
    manufacturer varchar null,
    product_count int4 null,
    price float4 null
);

insert into sql_course.phones (product_name, manufacturer, product_count, price)
values
('Iphone X', 'Apple', 3, 76000),
('Iphone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);


-- Задание 02
-- Выведите название, производителя и цену для товаров, количество которых превышает 2

select 
    product_name
    , manufacturer
    , price
from sql_course.phones
where product_count > 2;

-- Задание 03
-- Выведите весь ассортимент товаров марки “Samsung”

select * from sql_course.phones
where manufacturer = 'Samsung';

-- Задание 04
-- Найти с помощью регулярных выражений:
--  4.1 товары, в названии которых есть 'Iphone'

select * from sql_course.phones
where product_name like '%Iphone%';

--  4.2 товары, в производителях которых есть упоминание 'Samsung'

select * from sql_course.phones
where manufacturer like '%Samsung%';

-- 4.3 товары, в названиях которых есть цифры

select * from sql_course.phones
where product_name ~ '\d';

-- 4.4 товары, в названиях которых есть цифра 8

select * from sql_course.phones
where product_name ~ '8';
