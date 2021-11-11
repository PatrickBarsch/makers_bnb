CREATE TABLE availabilities(id SERIAL PRIMARY KEY, date DATE, space_id NUMERIC, user_id_booked NUMERIC, users_ids_requested NUMERIC[]);

-- Example Insertion Query --

INSERT INTO availabilities VALUES (1,'2017-03-14',1,2,'{1,8}')

-- Video Example --

https://www.youtube.com/watch?v=iDZA-cps21o
