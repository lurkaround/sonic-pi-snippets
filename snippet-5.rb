use_bpm 140

##| live_loop :bass do
##|   with_fx :gverb, room: 30, release: 4, mix: 0.4, amp: 0.3 do
##|     with_fx :distortion, distort: 0.8, mix: 1 do
##|       with_fx :wobble, phase: 7, cutoff_max: 80, cutoff_min: 40, mix: 0 do
##|         l = 3
##|         8.times do
##|           tick
##|           notle = ring(72,70,69,65,65,65,72,74,75,74,72,68,68,68,69,70).look
##|           synth :fm, note: notle-24, release: 0.35*l, depth: 5, amp: 3
##|           synth :dsaw, note: notle-36, release: 0.35*l, detune: 0.3, amp: 9, cutoff: 105, env_curve: 7
##|           sleep ring(0.75,0.75,0.75,0.25,0.5,0.5,0.25,0.25).look*2
##| ##|         end
##| ##|       end
##| ##|     end
##| ##|   end
##| ##| end

##| ## synth
##| live_loop :shimmy do
##|   with_fx :gverb, room: 60, release: 4, mix: 0.4 do
##|     with_fx :slicer, phase: 0.25, mix: 0 do
##|       4.times do
##|         tick
##|         synth :zawa, note: ring(72,70,69,65,65,65,72,74,75,74,72,68,74,65,72,70).look+0, sustain: 6, release: 0.5, detune: 0.3, amp: 0.06
##|       end
##|       sleep 8
##|     end
##|   end
##| end

##| bass
##| live_loop :bass do
##|   with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
##|     synth :dsaw, note: ring(65,68,63,63).tick(:ii)-36, sustain: 8, release: 0, detune: 0.3, amp: 1, cutoff: 125
##|     sleep 8
##|   end
##| end

##| ##  BEAT
##| live_loop :beat do
##|   with_fx :ixi_techno,  distort: 0.8, mix: 1 do
##|     sample :bd_haus, amp: 1.5, cutoff: 65
##|     sleep 2
##|   end
##| end




live_loop :bass do
  with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
    synth :dsaw, note: ring(65,68,63,63).tick(:ii)-36, sustain: 8, release: 0, detune: 0.3, amp: 6, cutoff: 125
    sleep 1
    with_fx :lpf, cutoff: 60, cutoff_slide: 40, mix: 1 do |t|
      control t, cutoff: 120
      e = synth :dsaw, note: 60, note_slide: 0.5, detune: 0.3, sustain: 40, release: 0, amp: 1.2
      ee =  synth :tb303, note: chord(60, :major), note_slide: 0.5, amp: 1, release: 20, cutoff: 100, sustain: 24, detune: 0.2
      1.times do
        synth :chipbass, note: chord(20+12, :major, invert: -2), amp: 1, attack: 1, release: 1r, hard: 0.99, vel: 0.96
        sleep 8
      end
    end
  end
end


