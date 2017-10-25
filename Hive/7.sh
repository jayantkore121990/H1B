rm /home/hduser/project/1.dat

hive -e "select year,count(*) as applications from h1b_final where year like '201%' group by  year;" > /home/hduser/project/1.dat

gnuplot -persist <<-EOFMarker
set boxwidth 0.5
set style fill solid
plot "/home/hduser/project/1.dat" using 1:2:xtic(1) with boxes
EOFMarker


