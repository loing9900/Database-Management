--create a view
create view high_quantities
as  
select * from fact_booksales
where quantity > 2000 

--granting and revoke access from high_quantities view
revoke update, insert on high_quantities from public
grant update, insert on high_quantities to public

--create a materialize view


select * from high_quantities