-- 1 Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

create table cars (
    id int not null generated always as identity,
    car_name varchar not null,
    price int not null,
    constraint pk_id primary key (id)
);

insert into sql_course.cars (car_name, price)
values
('Audi', 52642),
('Mersedes', 51127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('VolksWagen', 21600);

create view sql_course.econom as
select * from sql_course.cars
where price < 25000;

-- 2 Изменить в существующем представлении порог для стоимости: 
-- пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
--
-- Увы - postgres так не умеет, здесь будет конструкция "create or replace"

create or replace view sql_course.econom as
select * from sql_course.cars
where price < 30000;

-- 3 Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

create view vw as
select * from sql_course.cars
where car_name in ('Skoda', 'Audi');

-- 4 Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
--
-- Есть таблица анализов Analysis:
-- an_id — ID анализа;
-- an_name — название анализа;
-- an_cost — себестоимость анализа;
-- an_price — розничная цена анализа;
-- an_group — группа анализов.
--
-- Есть таблица групп анализов Groups:
-- gr_id — ID группы;
-- gr_name — название группы;
-- gr_temp — температурный режим хранения.
--
-- Есть таблица заказов Orders:
-- ord_id — ID заказа;
-- ord_datetime — дата и время заказа;
-- ord_an — ID анализа.

select distinct
    a.an_name
    , a.price
from Analysis a
join Orders b on a.ain_id = b.ord_an 
                 and b.ord_datetime >= '2020-02-05' 
                 and b.ord_datetime < '2020-02-05'::date + interval '7 days';
             
-- 5 Добавьте новый столбец под названием «время до следующей станции». 
-- Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
-- Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
-- Проще это сделать с помощью оконной функции LEAD . 
-- Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
-- В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
             
create table schedule (
    train_id int,
    st_name varchar,
    st_time time
);
   
insert into schedule (train_id, st_name, st_time)
values 
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

select 
    train_id
    , st_name
    , st_time
    , lead(st_time) over(partition by train_id order by st_time) - st_time as time_to_next_station
from schedule 
