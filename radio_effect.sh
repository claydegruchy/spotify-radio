#qaulity

#1-10 value



level="${1:-"10"}"

tin=$(($level*100))


let boost="$tin/100"

stream_loc="/opt/music/spotify"

echo "opening stream from $stream_loc"


# echo $level $tin $boost
# sox --i $stream_loc
sox -t raw -c 2 -r 44k -e signed-integer -L -b 16 $stream_loc -t .wav - | play - sinc -n 32767 "$tin-6000" compand 0.1,1 6:-70,-60,-20 -5 -90 0.2 overdrive $boost	