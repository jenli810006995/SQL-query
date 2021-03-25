Solution:
```
select str(round(LONG_W, 4), 10, 4) from station
where LAT_N = (select min(LAT_N) from station where LAT_N > 38.770)

```
Link: https://www.hackerrank.com/challenges/weather-observation-station-17/problem 
