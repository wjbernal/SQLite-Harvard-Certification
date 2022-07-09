select m.title, r.rating
from movies as m inner join ratings as r on m.id = r.movie_id
where m.year = 2010
order by r.rating DESC, m.title ASC;