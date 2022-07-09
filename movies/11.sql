select distinct m.title
from movies as m inner join stars as s on m.id = s.movie_id
                 inner join people as p on p.id = s.person_id
                 inner join ratings as r on m.id = r.movie_id
where lower(p.name) = 'chadwick boseman'
order by r.rating DESC
LIMIT 5;

