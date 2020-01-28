use sakila;

alter table actor add number INTEGER;

delimiter \\

create procedure insert_numbers()
  begin
  declare i INT default 1;
  while i <= (select count(first_name) from actor) do
    if (select mod(actor_id, 5) from actor where actor_id=i) >= 3 then
      update actor set number = 999 where actor_id = i;
	end if;
    set i = i +1;
  end while;
  end;
  
  \\
  
call insert_numbers();
select * from actor;
