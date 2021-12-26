##| use_bpm 140

##| solenoids = "C:/Users/rhelo/Documents/samples/bassLoop"

##| live_loop :solenoid1 do
##|   sample solenoids, "loop_4", beat_stretch: 4, amp: 2
##|   sleep 4
##| end


##| chords1 = [:c3, :d3]

##| define :drum do
##|   sample :drum_heavy_kick
##|   play :c2, attack: 0.2, release: 1
##|   sleep 0.5
##|   sample :drum_snare_hard
##|   play :d2, attack: 0.2, release: 1
##|   sleep 0.5
##|   sample :drum_heavy_kick
##|   play :c2, attack: 0.2, release: 1
##| end



##| live_loop :bass do
##|   sample :bass_hard_c, attack: 0.2, release: 1.2
##|   play :c4
##|   sleep 0.25
##|   sample :bass_voxy_hit_c, attack: 0.2, release: 1.2
##|   play :e4
##|   sleep 0.5
##|   sample :bass_voxy_c, attack: 0.2, release: 1.2
##|   play :g4
##|   sleep 0.75
##|   sample :bass_voxy_hit_c, attack: 0.2, release: 1.2
##|   play :d4
##|   sleep 1
##| end

##| loop  do
##|   drum
##|   sleep 1
##| end
