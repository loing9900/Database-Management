-- create a new procedure
create procedure retrieve_all
as
begin
	select * from sales;
end 
-- call the stored procedure
retrieve_all

-- drop the procedure
drop procedure retrieve_all;

create procedure update_saleprice 
@animal_id integer, @animal_health varchar(5) 
as
begin 
	if @animal_health = 'bad' 
		update sales
		set saleprice = saleprice - (saleprice * 0.25)
		where id = @animal_id
	if @animal_health = 'worse' 
		update sales 
		set saleprice = saleprice - (saleprice * 0.5) 
		where id = @animal_id
	else
		update sales
		set saleprice = saleprice 
		where id = @animal_id
end

-- execute procedure 'update_saleprice'
update_saleprice(1, 'bad')
retrieve_all
update_saleprice(3, 'worse')
retrieve_all

------------------
create procedure transaction_rose
as
begin
	declare @sqlcode integer;
	set @sqlcode = 0;
	declare @retcode integer;
	set @retcode = @sqlcode

	update BankAccounts
	set Balance = Balance - 200 
	where AccountName = 'Rose';

	update BankAccounts
	set Balance = Balance + 200 
	where AccountName = 'Shoe Shop';

	update ShoeShop
	set Stock = Stock -1 
	where Product = 'Boots';

	update BankAccounts
	set Balance = Balance - 300
	where AccountName = 'Rose';

	if @retcode < 0
		rollback transaction;
	else 
		commit transaction;
end

