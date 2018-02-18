1. What is the daily booking rate (defined in Question II.2)  for each of the 90 days prior to the snapshot?

select strftime('%d-%m-%Y', added) date, count(c.id) requests, count(c.booked_at) booked, 
(count(c.booked_at)*100) / count(c.id) booking_rate  
from conversations_conversation c
where added > datetime('2017-07-11','-90 days') 
group by date  
order by added desc 

- Please find the result set below. 

date,requests,booked,booking_rate
10-07-2017,290,18,6
09-07-2017,320,70,21
08-07-2017,274,66,24
07-07-2017,278,91,32
06-07-2017,269,111,41
05-07-2017,315,135,42
04-07-2017,278,132,47
03-07-2017,307,122,39
02-07-2017,279,127,45
01-07-2017,281,139,49
30-06-2017,295,130,44
29-06-2017,262,101,38
28-06-2017,276,106,38
27-06-2017,266,126,47
26-06-2017,279,127,45
25-06-2017,282,138,48
24-06-2017,297,123,41
23-06-2017,279,136,48
22-06-2017,287,116,40
21-06-2017,281,122,43
20-06-2017,273,115,42
19-06-2017,282,113,40
18-06-2017,267,127,47
17-06-2017,279,117,41
16-06-2017,251,109,43
15-06-2017,280,136,48
14-06-2017,239,99,41
13-06-2017,269,122,45
12-06-2017,262,117,44
11-06-2017,262,115,43
10-06-2017,263,125,47
09-06-2017,288,135,46
08-06-2017,264,124,46
07-06-2017,241,110,45
06-06-2017,254,106,41
05-06-2017,280,129,46
04-06-2017,220,95,43
03-06-2017,275,128,46
02-06-2017,254,108,42
01-06-2017,270,113,41
31-05-2017,276,113,40
30-05-2017,265,119,44
29-05-2017,263,117,44
28-05-2017,237,105,44
27-05-2017,273,114,41
26-05-2017,251,113,45
25-05-2017,248,106,42
24-05-2017,271,116,42
23-05-2017,228,104,45
22-05-2017,230,99,43
21-05-2017,228,84,36
20-05-2017,249,120,48
19-05-2017,273,138,50
18-05-2017,222,91,40
17-05-2017,267,125,46
16-05-2017,250,96,38
15-05-2017,250,102,40
14-05-2017,230,101,43
13-05-2017,251,95,37
12-05-2017,272,127,46
11-05-2017,242,106,43
10-05-2017,242,112,46
09-05-2017,239,105,43
08-05-2017,245,113,46
07-05-2017,224,104,46
06-05-2017,217,98,45
05-05-2017,247,102,41
04-05-2017,212,90,42
03-05-2017,236,104,44
02-05-2017,228,115,50
01-05-2017,237,95,40
30-04-2017,199,84,42
29-04-2017,238,106,44
28-04-2017,221,89,40
27-04-2017,215,90,41
26-04-2017,219,93,42
25-04-2017,208,85,40
24-04-2017,205,95,46
23-04-2017,249,122,48
22-04-2017,205,93,45
21-04-2017,229,118,51
20-04-2017,212,95,44
19-04-2017,220,104,47
18-04-2017,239,100,41
17-04-2017,207,84,40
16-04-2017,206,94,45
15-04-2017,213,87,40
14-04-2017,213,93,43
13-04-2017,226,103,45
12-04-2017,213,108,50
