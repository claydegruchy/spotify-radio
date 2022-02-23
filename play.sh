
if [ "$EUID" -ne 0 ]
  then echo "This script requires root access to read /opt/music/spotify. Please run as root."
  exit
fi

pkill  "sox"  
pkill  "play"

librespot  --system-cache ./cache/ --name "Spotify Radio" --backend pipe --device /opt/music/spotify --bitrate 160 --disable-audio-cache --enable-volume-normalisation  &
echo "If its not working, just kill and restart" & 
sh radio_effect.sh $1 &
wait 

pkill  "sox"
pkill  "play"

