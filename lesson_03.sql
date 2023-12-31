-- Задание 03
-- Отсортируйте поле “сумма” в порядке убывания и возрастания
-- Не нашел такого поля, предположу, что это "salary"

select 
    *
from employees
order by salary desc;

select 
    *
from employees
order by salary;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 
-- строк с наибольшей заработной платой

select 
    *
from employees
order by salary
limit 5;

-- Выполните группировку всех сотрудников по специальности “рабочий”, 
-- зарплата которых превышает 20000
-- Тоже неясное задание: по какому признаку сгруппировать рабочих?
-- Предположу, что просто вывести на экран

select 
    *
from employees
where 
    salary > 20000
    and speciality = 'рабочий'
