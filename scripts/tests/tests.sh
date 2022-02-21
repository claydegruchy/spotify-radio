#original 
# play ENG_M.wav stretch 1.2 75.33 lin 0.2 0.4 \
# overdrive 10 10 echo 0.4 0.8 15 0.8 \
# synth sine fmod 10 echo 0.8 0.8 29 0.8


	# play $file \
	# # slows down the clip
	# # stretch 1.2 133.33 \
	# # seems to control the feedback
	# # not sure
	# # lin 0.3 0.5 \
	# overdrive 10 10 \
	# # not sure
	# echo 0.4 0.8 15 0.8 \
	# # not sure
	# synth \
	# # not sure
	# sine \
	# # not sure
	# fmod 10 \
	# # not sure
	# echo 0.8 0.8 29 0.8 



# sox ENG_M.wav ENG_M2.wav rate 48000

#new 
tin=10
let boost="$tin/100"
play ENG_M.wav sinc -n 32767 "$tin-6000" compand 0.1,1 6:-70,-60,-20 -5 -90 0.2 overdrive $boost
# bandpass: cuts things that are outside a given frequency


# slows down the clip

# stretch 1.2 133.33 \
# seems to control the feedback
# not sure
# lin 0.3 0.5 \
	# overdrive 10 10 \
	# # not sure
	# echo 0.4 0.8 15 0.8 \
	# # not sure
	# synth \
	# # not sure
	# sine \
	# # not sure
	# fmod 10 \
	# # not sure
	# echo 0.8 0.8 29 0.8 


