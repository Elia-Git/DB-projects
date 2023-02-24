--// UPDATING
--// Inserting new recipient
INSERT into recipient(name,donation_id,type_id)
values ('name','3','1');
--// Inserting new donor
INSERT into donor(name,country,phone,holiday_id,paid_status,role_id)
values ('name','Denmark', 12234, 1,4,3);
--// Updating holiday's year
UPDATE holiday
SET year = 2022
--Specific year
where year=2021;

--// Updating which holiday is paid/ and payment status?
UPDATE donor
SET holiday_id = 4
WHERE holiday_id = 1
--Specific donor
and donor.id=1 OR
--per country
WHERE country = 'Denmark';

--// Updating payment status
UPDATE donor
set paid_status =2
where id=1;

SELECT*from donor;