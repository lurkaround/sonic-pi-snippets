use_bpm 92

mel1 = ring(59,59,64,62,59,57,55,52,52,55,52,59,59)
mel2 = ring(57,59,62,64,62,59,57,55,52,55,52,62,59)
mel3 = ring(52,55,59,55,57,52,52,55,59,55,57,55,52,59,55,57,55,52,62,59,57,59,59,59,59,57,55,57,52,52)
tm1 = [1,11,1,1,1,1,1,2,1,2,1,1,8]
tm2 = [1,10,1,1.5,0.5,1,1,1,3,2,1,1,6]
tm3 = [1,1,1,1,1,3,1,1,1,1,1,2,2,2,1,1,2,3,2,2,4,1,3,1,2,5,2,2,1,15]

live_loop :melody do
  tick(:i)
  mel = [mel1,mel2,mel3].ring.look(:i)
  tm = [tm1,tm2,tm3].ring.look(:i)
  tick_reset(:ii)
  with_fx :flanger, mix: 1 do
    ff = synth :fm, note: mel[0], note_slide: 0.25, sustain: tm.sum*0.5, release: 0, amp: 0.6
    with_fx :echo, phase: 0.75, decay: 6, mix: 0.7 do
      tm.length.times do
        tick(:ii)
        tt = tm.ring.look(:ii)
        control ff, note: mel.look(:ii)+12
        synth :fm, note: mel.look(:ii)-12
        sleep tt*0.5
      end
    end
  end
end

bass1 = ring(64,67,60,66,59)
bass2 = ring(64,67,60,65,66,59,64,64,64,64)
chn1 = ring('m7','9',:major7,'m7','7')
chn2 = ring('m7','9',:major7,'9','7sus4','7',:minor,'m+5','m6','m+5')
tb1 = [4,4,4,2,2]
tb2 = [4,4,4,4,4,4,2,2,2,2]

live_loop :basschord do
  tick(:i)
  bass = [bass1,bass1,bass2].ring.look(:i)
  tb = [tb1,tb1,tb2].ring.look(:i)
  chn = [chn1,chn1,chn2].ring.look(:i)
  tick_reset(:ii)
  with_fx :flanger, mix: 1 do
    tb.length.times do
      tick(:ii)
      tt = tb.ring.look(:ii)
      synth :fm, note: bass.look(:ii)-24, sustain: tt, release: 0
      synth :zawa, note: chord(bass.look(:ii), chn.look(:ii)), sustain: tt, release: 0, range: 15, cutoff: 85
      sleep tt
    end
  end
end
