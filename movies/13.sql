select distinct p.name
from people as p inner join stars as s on p.id = s.person_id
                inner join movies as m on m.id = s.movie_id
where lower(p.name) != lower('Kevin Bacon')
and m.id in (
            select m2.id
            from movies as m2 inner join stars as s2 on m2.id = s2.movie_id
                              inner join people as p2 on p2.id = s2.person_id
            where lower(p2.name) = lower('Kevin Bacon')
            and p2.birth = 1958
            );