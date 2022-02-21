#!/bin/bash


if [ "$EUID" -ne 0 ]
  then echo "This script requires root access to create directories and save creds. Please run as root."
  exit
fi

echo "Creating named pipe path..."
mkdir -p /opt/music/
echo "Creating named pipe..."
mkfifo /opt/music/spotify


echo "Creating cache for Spotify creds..."
mkdir cache
echo "Creating Spotify creds..."



echo "Spotify Username (looks like 6esgx8w5wp5y77udeitcge6ey):" 
read  username
echo

# Read Password
echo Spotify Password: 
read -s password
echo



# Run Command
echo "Testing creds against Spotify..."

TIMEOUT=2
output=$(
    ( librespot --username $username --password $password --system-cache ./cache/ 2>&1 ) & pid=$!
    ( sleep $TIMEOUT && kill -HUP $pid ) 2>/dev/null & watcher=$!
    wait $pid 2>/dev/null && pkill -HUP -P $watcher
)


BRANCH_REGEX="Authenticated as"


if [[ $output =~ $BRANCH_REGEX ]];
then
    echo "Success! Connected to Spotify. You can now use play.sh to play the radio"    
else
	echo "Looks like the connection failed. Please ensure your username and password are correct."
    echo "Note that the username is not your email, but a long series of characters. It can be found in your spotify user page"
    echo "Response from spotify: \n===\n$output"
fi
