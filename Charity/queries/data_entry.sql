--// UPDATING
--// Inserting new recipient
INSERT into recipient(name,donation_id,type_id)
values ('name','3','1');
--// Inserting new donor
INSERT into donor(id,name,country,phone,holiday_id,paid_status,role_id)
values (117, 'fullname','USA', null,3,1,1);


select*from donor_view;
select*from donor;

select*from role;
select*from holiday;
select*from payment_status;
--// Updating holiday's year
UPDATE holiday
SET year = 2022
where id=1;
--Specific year
where year=2022;

--// Updating which holiday is paid/ and payment status?
UPDATE donor
SET holiday_id = 3 , paid_status =1
--//paid for all holidays
WHERE country = 'Africa'; --// holiday ?
--Specific donor
--and donor.id=1 OR
--per country
--// Updating payment status

UPDATE donor
SET holiday_id = 3 , paid_status =1
--//paid for all holidays
WHERE id = 105;