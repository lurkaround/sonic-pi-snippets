use_bpm 92

mel1 = ring(59,62,59,57,55,59,52,55,52,55,57,59)
mel2 = ring(59,62,59,57,55,59,59,52,55,52,55,50,50,52)
mel3 = ring(59,60,62,59,57,55,57,59,52,55,52,55,52,57,50,50)
tm1a = [2,2,2,2,1,8,1,2,1,2,2,7]
tm2 = [2,1,4,1,1,1,7,1,2,1,4,1,1,6]
tm1b = [1,2,2,2,1,8,1,2,1,2,2,7]
tm3 = [1,1,1,4,1,1,1,5,1,1,1,1,3,2,1,9]

chmel1 = ring(62,62,57,55,55,59,57,55,57,62,62,57,55,55,55,52,55,59,50,50)
chmel2 = ring(57,57,55,59,57,55,55,57,59,57,50,50,57)
chmel3 = ring(57,57,55,59,57,55,55,57,59,57,50,50,52)
tch1 = [2,2,2,1,11,2,1,2,9,2,2,2,1,5,2,1,5,2,1,8]
tch2 = [1,2,2,1,1,1,9,2,2,1,1,1,8]
tch3 = [1,2,2,1,1,1,9,1,2,2,2,1,6]

puts tch3.sum

live_loop :melody, delay: 3 do
  tick(:i)
  mel = [mel1,mel2,mel1,mel3,chmel1,chmel2,chmel3].ring.look(:i)
  tm = [tm1a,tm2,tm1b,tm3,tch1,tch2,tch3].ring.look(:i)
  tick_reset(:ii)
  with_fx :echo, phase: 0.75, decay: 6, mix: 0.7 do
    tm.length.times do
      tick(:ii)
      tt = tm.ring.look(:ii)*0.5
      synth :tb303, note: mel.look(:ii)-24, release: 0.75, cutoff: 95
      sleep tt
    end
  end
end

bass1 = ring(59,62,64)
bass2 = ring(57,59,55,62)
tb1 = [8,4,4]
tb2 = [8,8,8,8]

live_loop :bass do
  tick(:i)
  bass = knit(bass1,8,bass2,4).look(:i)
  tb = knit(tb1,8,tb2,4).look(:i)
  tick_reset(:ii)
  with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
    tb.length.times do
      tick(:ii)
      tt = tb.ring.look(:ii)*0.5
      synth :fm, note: bass.look(:ii)-24, sustain: tt, release: 0, depth: 1
      sleep tt
    end
  end
end

ch1 = ring(:major,:major,:major)
ch2 = ring('5','m7','5','5')

live_loop :chord do
  tick(:i)
  bass = knit(bass1,8,bass2,4).look(:i)
  tb = knit(tb1,8,tb2,4).look(:i)
  ch = knit(ch1,8,ch2,4).look(:i)
  tick_reset(:ii)
  with_fx :flanger, mix: 1 do
    tb.length.times do
      tick(:ii)
      tt = tb.ring.look(:ii)*0.5
      synth :tri, note: chord(bass.look(:ii)-12,ch.look(:ii)), sustain: tt, release: 0, amp: 2
      sleep tt
    end
  end
end
