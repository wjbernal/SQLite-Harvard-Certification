select count(m.title) numMovies
from movies as m inner join ratings as r on m.id = r.movie_id
where r.rating = 10.0;
