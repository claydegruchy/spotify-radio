# Spotify Radio
A system to apply radio style audio effect to a Spotify stream.

# How do I get this working?
## Requirements
This is designed to work with MacOS. You might get it working with windows or linux, but I can't help much there.

## Install
You'll need the following installed:
- `librespot` https://github.com/librespot-org/librespot
- `sox` http://sox.sourceforge.net/
- (optional) `git` https://git-scm.com/download/mac 

Both of these can be installed via Brew for MacOS (https://brew.sh/) which makes the process much easier. With brew, you just need to run

```
brew install librespot
brew install sox
```

And you should be good to go. Then you need to either git clone this repo or hit the `download zip` button under the code dropdown above.

## Setup
After you've isntalled everything, we need to get `librespot` running. Open a terminal windows and navigate to the download location, then run

```
sudo sh setup.sh
```

To activate the installer. This will prompt you for your spotify username and password and will store them in the nearby `cache` folder.

## Run
To run, simply enter 
```
sudo sh play.sh 
```

Once this script is running, go to Spotify. This can be the mobile App or desktop, then just select "Spotify Radio" from the `Connect to Device` list.


Options:
- `play.sh` accepts an argument to modify how tinny and crappy the radio will sound. This is just a value from 1-10, with 1 being the best quality. 
	- Example `sudo sh play.sh 10` will produce a very tinny crappy radio sound, as though the radio was cheap and far from the transmitter.


## Issues
Closing the script will make you need to redo the connection procedure. If anyone knows a way to keep librespot running while sox is taken offline (like to change the effects) then let me know or drop in a PR.

# How does work
This system uses `librespot` to connect to spotify. The output of this is piped into a named pipe. It then uses `sox` to manipulate the audio into a radio ish effect, then `play` to send the audio to the computer speakers.

# Why
This was made mainly for Table Top RPGs, specifically the Alien RPG, where I wanted some low quality audio without needing to download a bunch of files (from a legal source ofc) and apply effects. With this tool, you can easily stream whatever songs are on Spotify and make it sound like its coming from a handheld radio circa 1979.

# Other stuff and future plans
What I'd really wanted for this was a system that could play from spotify but also play adverts that are specific to the setting. As such, the `adverts/` folder contains a bunch of ready to use adverts extracted from various films by people on YouTube that I thought would fit well in my own RPG games. These films include
- Robocop
- Total Recall (the old one, not that 2012 disaster)
- 6th Day
- Alien: Isolation
- Others probably

Plus some random 80s adverts for Nikon from Japan. Given the limits of how Spotify and their API works, this part of the project is seeming more difficult but I thought I should share some of the work done either way.


