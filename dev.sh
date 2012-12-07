
cd `dirname $0`
subl -a .

echo '-- start watching'

jade -O page/ -wP src/*jade &
livescript -o page/ -wbc src/*ls &
stylus -o page/ -w src/*styl &
doodle page/ &

read

pkill -f jade
pkill -f livescript
pkill -f stylus
pkill -f doodle

echo '-- stop watching'