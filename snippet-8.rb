solenoids = "C:/Users/rhelo/Documents/samples/bassLoop.wav"
drummy = "C:/Users/rhelo/Documents/samples/drumLoop.wav"
use_bpm 80


live_loop :solenoid1 do
  sample drummy, release: 2, decay_level: 2
  sleep 9
end

live_loop :solenoid2 do
  sync :solenoid1
  sample solenoids, release: 4,  rpitch: -1
  sleep 4
end

live_loop :drums do
  sample :bd_haus, rate: 0.2, decay: 1, release: 0.5, amp: 0.1
  sleep 1
  sample :bd_haus, rate: 0.2, decay: 1, release: 0.5, amp: 0.1
  sleep 1
end



##| live_loop :solenoid2 do
##|   samplename = ["hit_1", "hit_2", "hit_3", "hit_4", "hit_5", "hit_6", "hit_7"].choose
##|   time = [0.5, 0.75, 1].choose
##|   sample solenoids, samplename, amp: 1.5, rate: 2, pan: rrand(-0.8, 0.8)
##|   sleep time
##| end

##| with_fx :reverb do
##|   live_loop :solenoid3 do
##|     sleep 2
##|     sample solenoids, "hit_6", rate: (ring 0.5, 0.55, 0.6, 0.65).tick, amp: 1.5
##|     sleep 2
##|   end
##| end
