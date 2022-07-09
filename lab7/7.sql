select avg(energy) as AvgEnergy
from songs as s inner join artists as a on s.artist_id = a.id and lower(a.name) = 'drake';
