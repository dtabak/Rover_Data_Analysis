1. Did conversations with the new conversation page book at a higher rate? 

select ((count(c.booked_at)*100)/count(c.added)) booking_rate_percentage
from people_testsegmentation p
inner join conversations_conversation c 
on c.added = p.added
where p.test_name = 'New Conversation Flow' and
p.test_group = 'holdout' and
c.cancelled_at is NULL
union all
select ((count(c.booked_at)*100)/count(c.added)) booking_rate_percentage
from people_testsegmentation p
inner join conversations_conversation c 
on c.added = p.added
where p.test_name = 'New Conversation Flow' and
p.test_group = 'variant' and
c.cancelled_at is NULL

- Please find the result set below. 

The first row is the booking rate for holdout group and 
the second row is the booking rate for the variant group. 

booking_rate_percentage
37
44
