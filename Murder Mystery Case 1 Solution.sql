/*--THE CRIME WAS A MURDER
THAT OCCURED SOMRTIME ON JAN.15.2018
AND THAT IT TOOK PLACE IN SQL CITY.*/

SELECT * FROM crime_scene_report 
WHERE Date = 20180115 and crime_type = 'murder' AND city = 'SQL City'


/*Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".*/
	
--FIRST WITNESS = Morty schapiro, id = 14887 License_id = 118009, ssn = 111564949 
SELECT * FROM person 
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC

--SECOND WITNESS = 'Annabel Miller', id = 16371, License_id = 490173, ssn = 318771143
SELECT * FROM person 
WHERE  name LIKE '%Annabel%' And address_street_name = 'Franklin Ave' 


--To KNOW WHAT EACH WITNESS SAID 
SELECT * FROM interview 
WHERE person_id In (14887,16371)

/*First witness
I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z". 
Only gold members have those bags. The man got into a car with a plate that included "H42W".*/
/* SECOND WITNESS
I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.*/

SELECT * FROM get_fit_now_member 
WHERE id LIKE '48Z%' AND membership_status = 'gold'

/* FIRST SUSPECT = Joe Germuska , get_fit_id = 48Z7A, PERSON_ID =28819, 
SECOND SUSPECT = Jeremy Bowers, get_fit_id = 48Z55, Person_id = 67318 */ 

--CHECK FROM WHO WAS AT GYM ON 9th OF JAN 
SELECT * FROM get_fit_now_check_in
WHERE check_in_date = 20180109 AND membership_id IN ('48Z7A', '48Z55')
--THEY BOTH WENT TO THE GYM 

--CHECK FOR THE PLATE NUMBER 
SELECT * FROM drivers_license
WHERE plate_number LIKE ('%H42W%') 
--id = 183779, 423327, 664760

--CHECK THE 3 ids
SELECT * FROM person
WHERE license_id IN (183779, 423327, 664760)
--OUR MURDERER IS JEREMY BOWERS 

--CHECK HIS INTERVIEW 
SELECT * FROM interview 
WHERE person_id = 67318 

/*I was hired by a woman with a lot of money. 
I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. 
I know that she attended the SQL Symphony Concert 3 times in December 2017.*/

Select * From drivers_license
Where Gender = 'female' AND height BETWEEN 65 AND 67  AND car_make = 'Tesla' AND car_model ='Model S' AND hair_color = 'red'

--TO GET THE PERSON _ID 
SELECT * FROM person
WHERE license_id IN (202298,291182,918773)
--ID = 78881','90700','99716


--CHECK FOR THE CONCERT 
SELECT * FROM facebook_event_checkin
where person_id IN ('78881','90700','99716') AND event_name = 'SQL symphony concert'
--Person_id = 99716

SELECT * FROM person
where id = 99716
--Master mind = 'Miranda priestly'


--JOIN TABLE 
SELECT f.person_id , f.event_name, p.name 
FROM facebook_event_checkin AS f
LEFT JOIN person AS p 
ON f.person_id = p.id 
where P.id = 99716



	
--CHECK FOR THE FACEBOOK_EVENT_CHECKIN 
SELECT * FROM facebook_event_checkin
where person_id IN ('28819','67318')  














































































