1. What are the possible services and what is the average price per unit for each service type?
  
select service_type,round(avg(price), 2) average_price_per_unit from services_service  
group by service_type 

- Please find the result set below. 

service_type,average_price_per_unit
boarding,34.51
day-care,27.01
dog-walking,21.98

2. How many requests have there been for each service type and what percentage of those have booked? The percentage of those that have booked is called booking rate, i.e. what is the booking rate by service?  

select  s.service_type, count(c.id) requests, count(c.booked_at) booked, 
(count(c.booked_at)*100) / count(c.id) booking_rate  
from conversations_conversation c
join services_service s
on c.service_id = s.id 
group by s.service_type  

- Please find the result set below. 

service_type,requests,booked,booking_rate
boarding,26665,10862,40
day-care,26362,9417,35
dog-walking,26716,12811,47


3. What are the cancellation rates for each service?  

select s.service_type, count(c.id) requests, count(c.booked_at) booked, count(c.cancelled_at) cancelled, (count(c.cancelled_at)*100) / count(c.booked_at) cancellation_rate
from conversations_conversation c
join services_service s 
on c.service_id = s.id 
group by s.service_type  

- Please find the result set below. 

service_type,requests,booked,cancelled,cancellation_rate
boarding,26665,10862,1051,9
day-care,26362,9417,919,9
dog-walking,26716,12811,1218,9

4. For un-cancelled bookings, is the owner or provider more likely to leave a review and which tends to leave better reviews? 
How would you narrate this finding to a business partner? 
Feel free to use whatever “proof” you need to share these findings (visualizations, graphs, talking points, etc.).  

- Please find the result set below. 

/* The total count of cases that a requester leaves a review */

select count(*) TOTAL_COUNT
from conversations_conversation c 
join conversations_review r
on c.id = r.conversation_id 
where c.booked_at is not NULL and 
c.cancelled_at is NULL and 
c.requester_id = r.reviewer_id  

TOTAL_COUNT
22493

/* The distribution of ratings of cases that a requester leaves a review */
 
select r.stars, count(r.stars) count  
from conversations_conversation c 
join conversations_review r
on c.id = r.conversation_id 
where c.booked_at is not NULL and 
c.cancelled_at is NULL and 
c.requester_id = r.reviewer_id  
group by r.stars

stars,count
1,1368
2,1359
3,1246
4,1324
5,17196

/* The cases that a service provider leaves a review */ 

select count(*) TOTAL_COUNT
from conversations_conversation c 
join conversations_review r
on c.id = r.conversation_id 
where c.booked_at is not NULL and 
c.cancelled_at is NULL and 
c.requester_id != r.reviewer_id  

TOTAL_COUNT
6043

/* The distribution of ratings of cases that a service provider leaves a review */
 
select r.stars, count(r.stars) count  
from conversations_conversation c 
join conversations_review r
on c.id = r.conversation_id 
where c.booked_at is not NULL and 
c.cancelled_at is NULL and 
c.requester_id != r.reviewer_id  
group by r.stars

stars,count
1,683
2,673
3,651
4,680
5,3356

