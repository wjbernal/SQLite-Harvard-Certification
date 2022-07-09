select m.title
from movies as m inner join stars as s on m.id = s.movie_id
                 inner join people as p on p.id = s.person_id
where lower(p.name) = lower('johnny depp')
and m.id in (
            select m2.id
            from movies as m2 inner join stars as s2 on m2.id = s2.movie_id
                             inner join people as p2 on p2.id = s2.person_id
            where lower(p2.name) = lower('Helena Bonham Carter')
            );

