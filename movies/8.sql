select p.name 
from movies as m inner join stars as s on m.id = s.movie_id
                 inner join people as p on p.id = s.person_id
where lower(m.title) = 'toy story';
