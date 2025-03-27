-- câu 1:
select
    *
from
    users
order by
    user_name;

-- asc là tăng dần (mặc định) | desc là giảm dần
-- câu 2:
select
    *
from
    users
order by
    user_name asc
limit
    7;

-- câu 3:
select
    *
from
    users
where
    user_name like '%a%'
order by
    user_name;

-- câu 4:
select
    *
from
    users
where
    user_name like 'm%';

-- câu 5:
select
    *
from
    users
where
    user_name like '%i';

-- câu 6:
select
    *
from
    users
where
    user_email like '%@gmail.com';

-- câu 7:
select
    *
from
    users
where
    user_email like '%@gmail.com' & & user_name like 'm%';

--câu 8:
select
    *
from
    users
where
    user_email like '%@gmail.com'
    and user_name like '%i%'
    and length(user_name) > 5;

--câu 9:
select
    *
from
    users
where
    instr(user_name, 'a') > 0
    and char_length(user_name) between 5
    and 9
    and user_email like '%i%@gmail.com';

-- câu 10:
select
    *
from
    users
where
    instr(user_name, 'a') > 0
    and char_length(user_name) between 5
    and 9
    or instr(user_name, 'i') > 0
    and char_length(user_name) < 9
    or user_email like '%i%@gmail.com';