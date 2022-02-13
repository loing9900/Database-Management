--1. CREATE VERTICAL PARTITIONS

-- Create a new table called film_descriptions
create table film_descriptions (
    film_id INT,
    long_description text
);

-- Copy the descriptions from the film table
insert into film_descriptions
SELECT film_id, long_description FROM film;

-- Drop the descriptions from the original table
alter table film drop column long_description;
-- Join to view the original table
SELECT * FROM film 
JOIN film_descriptions on film_descriptions.film_id = film.film_id


--2. CREATE HORIZONTAL PARTITIONS BY LIST
-- Create a new table called film_partitioned
CREATE TABLE film_partitioned (
  film_id INT,
  title TEXT NOT NULL,
  release_year TEXT
)
PARTITION BY LIST (release_year);

-- Create the partitions for 2019, 2018, and 2017
CREATE TABLE film_2019
	PARTITION OF film_partitioned FOR VALUES IN ('2019');

CREATE TABLE film_2018 
	PARTITION OF film_partitioned FOR VALUES IN ('2018');

CREATE TABLE film_2017
	PARTITION OF film_partitioned FOR VALUES IN ('2017');

-- Insert the data into film_partitioned
INSERT INTO film_partitioned
SELECT film_id, title, release_year FROM film;

-- View film_partitioned
SELECT * FROM film_partitioned;
