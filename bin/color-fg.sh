#! /bin/zsh

colors=(\
'{55769,15163, 7196}' \
'{54998,32639, 1285}' \
'{52428,41891,    0}' \
'{40863,44718, 6168}' \
'{21588,44718,16962}' \
'{ 7710,43176,40349}' \
'{ 7196,34695,54227}' \
'{30840,29812,59367}' \
'{41120,19789,48316}' \
'{52171, 4112,36237}');

# get which number terminal this is
term_count=`tty | sed 's/^[^0-9]*//'`;

# randomize by the day of the year for variety
day_of_year=`date +%j`;

# multiply by 3 to spread our choices out
seed=`expr 3 \* $term_count + $day_of_year`;

# the color we're going to use
color_num=`expr $seed % ${#colors} + 1`;

# use AppleScritp to set the text color
osascript -e "tell application \"Terminal\" to set normal text color of front window to $colors[$color_num]"