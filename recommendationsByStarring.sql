test=> ALTER TABLE movies3
test-> ADD lexemesStarring tsvector;
ALTER TABLE
test=> UPDATE movies3
test-> SET lexemesStarring = to_tsvector(Starring);

test=> UPDATE movies3
test-> SET rank = ts_rank(lexemesStarring,plainto_tsquery(
test(> (
test(> SELECT Starring FROM movies3 WHERE url='Abominable')));
test=> CREATE TABLE recommendationsBasedOnStarring AS
test-> SELECT url, rank FROM movies3 WHERE rank > 0.01 ORDER BY rank DESC LIMIT 50;
test=> CREATE TABLE recommendationsBasedOnStarring2 AS
SELECT url, rank FROM movies3 WHERE rank > 0.0 ORDER BY rank DESC LIMIT 50;
test=> \copy (SELECT * FROM recommendationsBasedOnStarring) to '/home/pi/RSL2/recommendationsByTitle.csv' WITH csv;

## explain for both starring and title why there are no or so little outcomes
