--create a user role
create role bi_developer;

--create a role called saint that has one attribute: LOGIN
create role saint login

--create an admin role with the ability to create databases (CREATEDB) and create role (CREATEROLE)
Create role admin WITH Createdb createrole

-- Grant bi_developer update and insert privileges on high_quantities view
grant update, insert on high_quantities to bi_developer

--Give saint role a password
alter role saint with password 'securep4ssword';

-- Add saint to the bi_developer group
grant bi_developer to saint

--Remove saint from the bi_developer group
revoke bi_developer from saint


