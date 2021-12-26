use_bpm 120

live_loop :backbeat do
  sleep 1
  sample :sn_dub
  sleep 1
end

live_loop :thumpy do
  sample :bd_808
  sleep 0.25
  5.times do
    sample :bd_haus
    sleep 0.75
  end
  sample :bd_haus
  sleep 0.75
  sample :bd_haus
  sleep 1
  sample :bd_haus
  sleep 1.5
  sample :bd_haus
  sleep 2.25
  sample :bd_haus
  sleep 0.5
  sample :bd_haus
  sleep 0.75
  
end

live_loop :mujik do
  sample :bass_drop_c
  sleep 8
end

live_loop :heart do
  sample :drum_bass_hard, cutoff: 100
  sleep 0.75
  sample :drum_bass_hard, cutoff: 100
  sleep 1
end


with_fx :compressor do
  live_loop :dark, delay: 4 do
    use_synth :dpulse
    use_synth_defaults res: 0.9, cutoff: rrand(80, 95), amp: 0.8
    play :c2, sustain: 3
    play :c3, sustain: 3
    sleep 6
    play :d2, sustain: 1.5
    play :d3, sustain: 1.5
    sleep 2
    play :e2, sustain: 4
    play :e3, sustain: 4
    sleep 8
  end
end



##| arp = (ring :g3, :e3, :a3, :c3, :g4, :e3, :a3, :c3)
##| live_loop :arp, delay: 4 do
##|   use_octave -1
##|   use_synth :tb303
##|   play arp.tick, cutoff: (line 40, 120, steps: 100).reflect.look, sustain: 0.25, release: 0.5
##|   sleep 0.25
##| end




##| live_loop :bass do
##|   with_fx :lpf, cutoff: 60, cutoff_slide: 64 do |e|
##|     control e, cutoff: 130
##|     16.times do
##|       7.times do
##|         t = ring(0.75, 0.25, 0.5, 1, 0.5, 0.25, 0.75).tick
##|         k = 7
##|         with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
##|           synth :saw,  note: (knit :a1, k, :d1, k, :e1, k, :c1, k).look, sustain: 0, release: t, amp: 3
##|           synth :dsaw, note: (knit :a2, k, :d2, k, :e2, k, :c2, k).look, sustain: t, release: 0, amp: 3, detune: 0.2, cutoff: 110

##|         end
##|         synth :fm, note: (knit :g3, k, :e3, k, :a3, k, :c3, k, :g4, k, :e3, k, :a3, k, :c3, k).look, sustain: 0, release: t, amp: 4, depth: 3
##|         sleep t
##|       end
##|     end
##|   end
##| end


##| in_thread do
##|   live_loop :beat do
##|     2.times do
##|       sample :bd_haus, amp: 10, cutoff: 75
##|       sample :sn_dub, amp: ring(0,4).tick, rate: 1
##|       sleep ring(1.5, 0.5).look
##|       sleep 1
##|     end
##|     with_fx :gverb, room: 34, tail_level: 0.9, release: 4, mix: 0.6, damp: 0 do
##|       sample :elec_ping, amp: ring(4,0).tick, rate: 2
##|     end
##|     sleep 2
##|   end
##| end


##| in_thread do
##|   live_loop :synth3 do
##|     with_fx :gverb, room: 35, mix: 1 do
##|       with_fx :slicer, phase: 0.125, wave: 1, pulse_width: 0.12, mix: 1 do
##|         s = synth :tb303, note: :g6, note_slide: 16, attack: 16, release: 8, amp: 1, detune: 0.3
##|         control s, note: :g5
##|         sleep 16
##|         stop
##|       end
##|     end
##|   end
##| end
##| with_fx :echo, decay: 8 do
##|   with_fx :flanger, phase: 2 do
##|     live_loop :amb, delay: 4 do
##|       if one_in 4
##|         sample :ambi_lunar_land, rate: rrand(-1, 1)
##|       else
##|         if one_in 2
##|           sample :ambi_glass_hum, beat_stretch: rrand(3, 5)
##|         end
##|       end
##|       sample :ambi_soft_buzz, beat_stretch: 3, amp: 2
##|       sleep 8
##|     end
##|   end
##| end
