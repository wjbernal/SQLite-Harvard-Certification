select distinct p.name
from people as p inner join stars as s on p.id = s.person_id
                 inner join movies as m on m.id = s.movie_id
where m.year = 2004
order by p.birth ASC;