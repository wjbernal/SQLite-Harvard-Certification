select m.title, m.year
from movies as m
where lower(m.title) like 'harry potter%'
ORDER BY m.year ASC;