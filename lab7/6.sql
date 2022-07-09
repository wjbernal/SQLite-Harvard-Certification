select s.name
from songs as s inner join artists as a on s.artist_id = a.id and lower(a.name) = 'post malone';


