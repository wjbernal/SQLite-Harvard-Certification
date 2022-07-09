select avg(r.rating) as avgRating
from movies as m inner join ratings as r on m.id = r.movie_id
where m.year = 2012;
