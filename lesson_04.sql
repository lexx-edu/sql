-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
select 
    mark 
    , color
    , count(regnum) as qty
from auto 
where mark in ('LADA', 'BMW')
group by 1, 2;


-- 2. Вывести на экран марку авто и количество AUTO не этой марки
select
    a.mark
    , count(b.mark) as other_mark_autos
from auto a
left join auto b on a.mark != b.mark
group by 1;


-- 3. Напишите запрос, который вернет строки из таблицы test_a, 
-- id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
select 
    a.*
from test_a a
right join test_b b on a.id = b.id;

