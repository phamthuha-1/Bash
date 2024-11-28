#!/bin/bash
curl -o HaPham.csv https://raw.githubusercontent.com/yinghaoz1/tmdb-movie-dataset-analysis/master/tmdb-movies.csv
head -n +1 HaPham.csv
(head -n 1 HaPham.csv && tail -n 2 HaPham.csv||sort -t ',' -k16,16r) > HaPham_1.csv
(head -n 1 HaPham_1.csv && awk -F ',' '$19>7.5' HaPham_1.csv) > HaPham_2.csv
awk -F ',' 'NR > 1 {print $6 "," $5}' HaPham.csv | sort -t ',' -k2,2nr | head -n 1 | awk -F ',' '{print "movie name: " $1 ", highest revenue: " $2}'
awk -F ',' 'NR > 1 && $6 != "" && $5 != "" {print $6 "," $5}' HaPham.csv | sort -t ',' -k2,2n | awk -F ',' 'NR == 1 {min_revenue = $2} $2 == min_revenue {print "movie name: " $1 ", lowest revenue: " $2}'
awk -F ',' 'NR > 1 {sum += $5} END {print "Total revenue: " sum}' HaPham.csv
awk -F ',' 'NR > 1 {profit = $5 - $4; print $6 "," profit}' HaPham.csv | sort -t ',' -k2,2nr | head -n 10 | awk -F ',' '{print "Movie name: " $1 ", Profit: " $2}'





