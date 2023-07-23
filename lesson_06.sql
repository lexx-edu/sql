-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

create or replace function sec_to_interval(sec_qty int) returns varchar as $$
    declare days integer default 0;
    declare hours integer default 0;
    declare minuts integer default 0;    
    
    begin 
        days := sec_qty / 86400;
        sec_qty := sec_qty - days * 86400;
        
        hours := sec_qty / 3600;
        sec_qty := sec_qty - hours * 3600;
        
        minuts := sec_qty / 60;
        sec_qty := sec_qty - minuts * 60;
        
        return concat(days::varchar, ' days, ', 
                      hours::varchar, ' hours, ',
                      minuts::varchar, ' minuts, ',
                      sec_qty::varchar, ' seconds');        
    end;
$$ language plpgsql;


-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

create or replace function evens(border integer) returns varchar as $$
    declare i integer default 0;
    declare evens_str varchar default '';
    begin 
       while i <= border loop
            i := i + 1;
        
            if i::decimal % 2 != 0 then 
                continue;
            end if;
            
            if evens_str != '' then
                evens_str := concat(evens_str, ', ');
            end if;
        
            evens_str := concat(evens_str, i::varchar);
       end loop;
       return evens_str;
    end;
$$ language plpgsql;
