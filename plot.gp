set datafile separator ","
set terminal dumb; set key outside
plot 'plot.txt' using 1:2 with lines title "echo 1",'plot.txt' using 1:3 with lines title "echo $x"
