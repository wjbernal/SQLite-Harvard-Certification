select *
from crime_scene_reports
where year = 2020
and month = 07
and day = 28
and street = 'Chamberlin Street';

--id | year | month | day | street | description
--295 | 2020 | 7 | 28 | Chamberlin Street |

--Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse.
--Interviews were conducted today with three witnesses who were present at the time —
--each of their interview transcripts mentions the courthouse.



select *
from interviews
where transcript like '%courthouse%'
and year = 2020
and month = 7
and day = 28;

--RESULT
-- *******************************************************
--		id  | name | year | month | day | transcript
--		161 | Ruth | 2020 | 7     | 28  |
--		Sometime within ten minutes of the theft, I saw the thief get into a car in the courthouse parking lot
--		and drive away. If you have security footage from the courthouse parking lot,
--		you might want to look for cars that left the parking lot in that time frame.

--		162 | Eugene | 2020 | 7 | 28 |
--		I don't know the thief's name, but it was someone I recognized.
--		Earlier this morning, before I arrived at the courthouse,
--		I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money.

--		163 | Raymond | 2020 | 7 | 28 |
--		As the thief was leaving the courthouse,
--		they called someone who talked to them for less than a minute.
--		In the call, I heard the thief say that they were planning
--		to take the earliest flight out of Fiftyville tomorrow.
--		The thief then asked the person on the other end of the phone
--		to purchase the flight ticket.

select  P.name, P.phone_number, P.passport_number, P.license_Plate, Fl.id
  from people as P inner join passengers as Ps on P.passport_number = Ps.passport_number
                   inner join flights as Fl on Ps.flight_id = Fl.id
				   inner join airports as ar on Fl.origin_airport_id = ar.id
where Fl.year = 2020
and Fl.month = 7
and Fl.day = 29
and ar.city = 'Fiftyville'
and P.phone_number is not null
and P.license_plate is not null
order by P.name;

--RESULT
-- *******************************************************
-- * All people who took a fly on the same day of the theft AND from the Fiftyville airport
-- **********************************************************************************************
-- 		name | phone_number | passport_number | license_plate | id
-- 		Bobby | (826) 555-1652 | 9878712108 | 30G67EN | 36
-- 		Brandon | (771) 555-6667 | 7874488539 | R3G7486 | 23
-- 		Carol | (168) 555-6126 | 6128131458 | 81MNC9R | 43
-- 		Charles | (427) 555-0556 | 3915621712 | R12SA4D | 18
-- 		Daniel | (971) 555-6468 | 7597790505 | FLFN3W0 | 43
-- 		Danielle | (389) 555-5198 | 8496433585 | 4328GD8 | 36
-- 		Diana | (918) 555-2946 | 6131360461 | P743G7C | 18
-- 		Doris | (066) 555-9701 | 7214083635 | M51FA04 | 36
-- 		Douglas | (491) 555-2505 | 3231999695 | 1FW4EUJ | 18
-- 		Douglas | (491) 555-2505 | 3231999695 | 1FW4EUJ | 23
-- 		Edward | (328) 555-1152 | 1540955065 | 130LD9Z | 36
-- 		Emily | (406) 555-4440 | 6263461050 | Y340743 | 23
-- 		Ernest | (367) 555-5533 | 5773159633 | 94KL13X | 36
-- 		Ethan | (594) 555-6254 | 2996517496 | NAW9653 | 18
-- 		Evelyn | (499) 555-9472 | 8294398571 | 0NTHK55 | 36
-- 		Gloria | (973) 555-3809 | 2835165196 | O010420 | 18
-- 		Jennifer | (911) 555-0229 | 7378796210 | 1K44SN8 | 23
-- 		John | (016) 555-9166 | 8174538026 | 4468KVT | 53
-- 		Jordan | (328) 555-9658 | 7951366683 | HW0488P | 23
-- 		Larry | (892) 555-8872 | 2312901747 | O268ZZ0 | 53
-- 		Madison | (286) 555-6063 | 1988161715 | 1106N58 | 36
-- 		Marilyn | (568) 555-3190 | 7441135547 | 0R0FW39 | 43
-- 		Michael | (529) 555-7276 | 6117294637 | HOD8639 | 18
-- 		Pamela | (113) 555-7544 | 1050247273 | 5CIO816 | 53
-- 		Roger | (130) 555-0289 | 1695452385 | G412CB7 | 36
-- 		Roy | (122) 555-4581 | 4408372428 | QX4YZN3 | 53
-- 		Russell | (770) 555-1861 | 3592750733 | 322W7JE | 18
-- 		Sophia | (027) 555-1068 | 3642612721 | 13FNH73 | 43
-- 		Steven | (195) 555-4173 | 1151340634 | 5VFD6G0 | 53
-- 		Thomas | (286) 555-0131 | 6034823042 | WD5M8I6 | 53
-- ----------------------------------------------------------------------------------------------

select  P.name, P.phone_number, P.passport_number, P.license_plate, Fl.id
  from people as P inner join passengers as Ps on P.passport_number = Ps.passport_number
                   inner join flights as Fl on Ps.flight_id = Fl.id
				   inner join airports as ar on Fl.origin_airport_id = ar.id
where Fl.year = 2020
and Fl.month = 7
and Fl.day = 29
and ar.city = 'Fiftyville'
and P.phone_number is not null
and P.license_plate is not null
and P.license_plate in (
	Select c.license_plate
	from courthouse_security_logs as c
	where c.year = 2020
	  and c.month = 7
	  and c.day = 28
	  and c.hour = 10
	  and c.minute between 10 and 30
)
and P.phone_number in (
	select pc.caller
	from phone_calls as pc
	where pc.year = 2020
	  and pc.month = 7
	  and pc.day = 28
)
order by P.name;

--RESULT
-- *******************************************************
-- * All people who took a fly on the same day of the theft AND from the Fiftyville airport
-- * and ad who made Call on the same day of the theft and between 10:10 am and 10:30 am
-- **********************************************************************************************
-- 		Ernest | (367) 555-5533 | 5773159633 | 94KL13X | 36
-- 		Evelyn | (499) 555-9472 | 8294398571 | 0NTHK55 | 36
-- 		Roger | (130) 555-0289 | 1695452385 | G412CB7 | 36
-- 		Russell | (770) 555-1861 | 3592750733 | 322W7JE | 18
-- --------------------------------------------------------------------------------------------


select  P.name, P.phone_number, P.passport_number, P.license_plate,
        Fl.id, Fl.hour, fl.minute, ar.city as city_from, da.city as City_To
  from people as P inner join passengers as Ps on P.passport_number = Ps.passport_number
                   inner join flights as Fl on Ps.flight_id = Fl.id
				   inner join airports as ar on Fl.origin_airport_id = ar.id
				   inner join airports as da on Fl.destination_airport_id = da.id
				   inner join bank_accounts as b on P.id = b.person_id
where Fl.year = 2020
and Fl.month = 7
and Fl.day = 29
and ar.city = 'Fiftyville'
and P.phone_number is not null
and P.license_plate is not null
and P.license_plate in (
	Select c.license_plate
	from courthouse_security_logs as c
	where c.year = 2020
	  and c.month = 7
	  and c.day = 28
	  and c.hour = 10
	  and c.minute between 10 and 30
)
and P.phone_number in (
	select pc.caller
	from phone_calls as pc
	where pc.year = 2020
	  and pc.month = 7
	  and pc.day = 28
)

and b.account_number in (
	select t.account_number
	from atm_transactions t
	where t.year = 2020
	  and t.month = 7
	  and t.day = 28

)
order by Fl.hour, fl.minute;

--RESULT
-- *******************************************************
-- * All people who took a fly on the same day of the theft AND from the Fiftyville airport
-- * and ad who made Call on the same day of the theft and between 10:10 am and 10:30 am
-- * and who withdrawing some money
-- **********************************************************************************************
-- 		name    | phone_number   | passport_number | license_plate | id | hour | minute | city_from  | City_To
-- 		Ernest  | (367) 555-5533 | 5773159633      | 94KL13X       | 36 |    8 | 20     | Fiftyville | London
-- 		Russell | (770) 555-1861 | 3592750733      | 322W7JE       | 18 |   16 |  0     | Fiftyville | Boston


---  AS A RESULT: THE AERLIEST FLIGTH WAS MADE BY ERNEST, SO,
---  THE THIEF IS ERNEST
---   THE THIEFT FLEW TO LONDON

--(2) - Who was called by ERNEST?
-- **********************************************
select  P.name as name_caller, P.phone_number as phone_caller,
        P2.name as name_receiver, P.phone_number as phone_receiver, pc.duration
  from people as P inner join phone_calls pc on P.phone_number = pc.caller
											and pc.year = 2020
											and pc.month = 7
											and pc.day = 28
											and pc.duration <= 60
					inner join people as P2 on P2.phone_number = pc.receiver

 where P.phone_number = '(367) 555-5533'

--RESULT
-- *******************************************************
-- * The person who receive a call form ERNEST on the same day of the theft
-- * AND the duration of the call was less than a minute.
-- ***********************************************************************************

-- 		name_caller | phone_caller 	 | name_receiver | phone_receiver | duration
-- 		Ernest 		| (367) 555-5533 | Berthold      | (367) 555-5533 | 	 45
-- -----------------------------------------------------------------------------------------

-- SO thief’s accomplice, who helped them escape IS BERTHOLD

--- SUMMARY:
-- ----------
-- Who is the thief?:
--THE THIEFT IS ERNEST

-- To What city does the thief escaped? -
-- To LONDON

-- Who is the thief’s accomplice, who helped him escape?
-- The ACCOMPLICE IS BERTHOLD


