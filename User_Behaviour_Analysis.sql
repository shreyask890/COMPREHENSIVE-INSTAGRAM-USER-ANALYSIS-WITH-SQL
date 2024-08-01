use ig_clone;

describe users;

select * from users;

-- 1. Find the 5 oldest user of Instagram from the database
select username , created_at
from users
order by created_at
limit 5;

-- 2.Find the users who have never posted a single photo on instagram

Select * from photos,users;

select u.username
from users u
left join photos p
on u.id = p.user_id
where image_url is null
order by u.username;

-- 3.Identify the winner of the contest(most no. of likes) and provide details of their team

Select * from likes,photos,users;

select likes.photo_id , users.username , count(likes.user_id) as nooflikes
from likes inner join photos on likes.photo_id = photos.id
inner join users on photos.user_id = users.id
group by likes.photo_id , users.username
order by nooflikes desc;

-- 5.Identify the top 5 most commonly used hastags
select * from photo_tags;

select tag_name , count(tag_id) as total_count
from photo_tags
inner join tags
on photo_tags.tag_id = tags.id
group by tag_name
order by total_count desc
limit 5;

-- 5. what day of the week most users register on

select * from users;

select DATE_FORMAT((created_at), '%W') , count(username)
from users
group by 1
order by 2 desc;


-- 6.Provide how many times an average user post on instagram

select * from users, photos;


 with base as( select u.id as userid, count(p.id) as photoid 
 from users u 
 left join photos p 
 on p.user_id=u.id 
 group by u.id) select sum(photoid) as totalphotos, count(userid) as total_users, sum(photoid)/count(userid) as photoperuser 
 from base;
 

 
 