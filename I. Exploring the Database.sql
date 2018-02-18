Exploring the Database 

1. How many users have signed up? 

select count(*) from people_person

- The answer is 64416. 

2. How many users signed up prior to 2017-01-12?  

select count(*) from people_person  
where date_joined < "2017-01-12 00:00:00.000000"

- The answer is 35500. 

3. What percentage of users have added pets? 

select(  
select count(distinct people_person.id) from people_person join pets_pet 
on pets_pet.owner_id = people_person.id 
) 
/ 
( 
( 
select count(*) from people_person  
) / 100.00 
) 

- The answer is 80.44%.  

4. Of those users, how many pets have they added on average?   

select round(avg(count),3)  
from 
( 
select count(people_person.id) count from people_person join pets_pet 
on pets_pet.owner_id = people_person.id 
group by people_person.id 
) as average 

- The answer is 1.496. 
 
5. What percentage of pets play well with cats?  

select(  
select count(id) from pets_pet  
where plays_cats = 1 
)  
/  
( (  
select count(*) from pets_pet  
) / 100.00  
)  

- The answer is 24.78%. 