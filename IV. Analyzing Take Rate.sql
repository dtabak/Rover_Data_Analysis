1. In each month, what were the gross billings and net revenue? 
(Note: month is determined by when the request actually booked, i.e. booked_at).

select strftime('%Y-%m', booked_at) date, sum(c.booking_total) booking_total, 
round(sum((booking_total+(booking_total*p.fee)))) gross_billings,  
round(sum(booking_total*s.fee))+round(sum(booking_total*p.fee)) net_revenue 
from conversations_conversation as c  
join people_person as p 
on c.requester_id = p.id 
join services_service as s 
on s.id = c.service_id 
where c.booked_at is not NULL  
and c.cancelled_at is NULL  
group by (date) 
order by (date) desc 

- Please find results below. 

date,booking_total,gross_billings,net_revenue
2017-07,234691,250271,60277
2017-06,570219,607619,146438
2017-05,523672,557742,133802
2017-04,465989,495889,117807
2017-03,415800,442036,104406
2017-02,339438,360644,84609
2017-01,326143,346195,80421
2016-12,315108,334175,76738
2016-11,277119,292237,64742
2016-10,274443,287815,62287

2016-09,250962,263247,56867
2016-08,230309,241433,50592
2016-07,193232,202623,41621
2016-06,181906,190731,38354
2016-05,151164,158431,30710
2016-04,134530,140831,26481
2016-03,123762,129527,24329
2016-02,77507,81072,15191
2016-01,69311,72364,13450
2015-12,56149,58122,10395
2015-11,36749,37484,6247
2015-10,35564,36275,6046
2015-09,18940,19319,3220
2015-08,11621,11853,1975
2015-07,1035,1056,176

2. Define take rate to be the percentage of gross billings that is net revenue. 
In the previous example, the take rate is slightly more than 19% since $20/$105 is approximately 0.1905. 
In each month, what was the aggregate take rate? 

select strftime('%Y-%m', booked_at) date, sum(c.booking_total) booking_total, round(sum((booking_total+(booking_total*p.fee)))) gross_billings,  
round(sum(booking_total*s.fee)+sum(booking_total*p.fee)) net_revenue,  
round(((sum(booking_total*p.fee)+sum(booking_total*s.fee))*100)/(sum(booking_total+(booking_total*p.fee)))) take_rate 
from conversations_conversation as c  
join people_person as p 
on c.requester_id = p.id 
join services_service as s 
on s.id = c.service_id 
where c.booked_at is not NULL  
and c.cancelled_at is NULL  
group by (date) 
order by (date) desc 

- Please find results below. 

date,booking_total,gross_billings,net_revenue,take_rate
2017-07,234691,250271,60277,24
2017-06,570219,607619,146438,24
2017-05,523672,557742,133803,24
2017-04,465989,495889,117807,24
2017-03,415800,442036,104406,24
2017-02,339438,360644,84609,23
2017-01,326143,346195,80421,23
2016-12,315108,334175,76738,23
2016-11,277119,292237,64742,22
2016-10,274443,287815,62287,22
2016-09,250962,263247,56868,22
2016-08,230309,241433,50592,21
2016-07,193232,202623,41621,21
2016-06,181906,190731,38354,20
2016-05,151164,158431,30710,19
2016-04,134530,140831,26480,19
2016-03,123762,129527,24329,19
2016-02,77507,81072,15191,19
2016-01,69311,72364,13450,19
2015-12,56149,58122,10395,18
2015-11,36749,37484,6247,17
2015-10,35564,36275,6046,17
2015-09,18940,19319,3220,17
2015-08,11621,11853,1976,17
2015-07,1035,1056,176,17

Why did take rate have an upward trend? 

- Owner fees increased. 

select strftime('%Y-%m', c.added ) date ,p.fee from conversations_conversation c
join people_person p
on c.requester_id = p.id
group by date
order by date asc

- Service fees increased. 

select strftime('%Y-%m', c.added ) date ,s.fee from conversations_conversation c
join services_service s
on c.service_id = s.id
group by date
order by date asc

- Conversations involved in more pets by time. 

select strftime('%Y-%m', c.added ) date, count(p.pet_id) from conversations_conversation c
join conversations_conversation_pets p
on c.id = p.conversation_id
group by date
order by date asc
