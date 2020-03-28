/*
album(asin, title, artist, price, release, label, rank)
track(album, dsk, posn, song)
*/

/*
1
*/
SELECT title, artist
  FROM album JOIN track
    ON (album.asin = track.album)
  WHERE song = 'Alison'

/*
2
*/
SELECT artist
  FROM album JOIN track
    ON (album.asin = track.album)
  WHERE song = 'Exodus'

/*
3
*/
SELECT song
  FROM album JOIN track
    ON (album.asin = track.album)
  WHERE title = 'Blur'

/*
4
*/
SELECT title, COUNT(*)
  FROM album JOIN track
    ON (asin = album)
  GROUP BY title

/*
5
*/
SELECT title, COUNT(*)
  FROM album JOIN track
    ON (asin = album)
  WHERE song LIKE '%Heart%'
  GROUP BY title

/*
6
*/
SELECT song
  FROM album JOIN track
    ON (asin = album)
  WHERE song = title

/*
7
*/
SELECT title
  FROM album
  WHERE artist = title

/*
8
*/
SELECT song, COUNT(DISTINCT(title))
  FROM album JOIN track
    ON (asin = album)
  GROUP BY song
  HAVING COUNT(DISTINCT(title)) > 2

/*
9
*/
SELECT title, price, COUNT(song)
  FROM album JOIN track
    ON (asin = album)
  GROUP BY title
  HAVING (price / COUNT(song)) < 0.50

/*
10
*/
SELECT title, COUNT(asin)
  FROM album JOIN track
    ON (asin = album)
  GROUP BY asin
  ORDER BY COUNT(asin) DESC, title


