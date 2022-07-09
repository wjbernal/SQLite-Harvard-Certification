select distinct p.name
from directors as d inner join movies as m on m.id = d.movie_id
                    inner join ratings as r on m.id = r.movie_id
                    inner join people as p on p.id = d.person_id
where r.rating >=9.0;

