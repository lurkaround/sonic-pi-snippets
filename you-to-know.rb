use_bpm 120

mel1 = ring(69,67,69,62,62,62,69,67,69,62,62,69,67,69,62,62,65,65,67,67,62)
mel2 = ring(74,74,74,72,74,72,74,69,69,69,72,74,72,74,69,69,69,72,74,72,74,76,72,69,69)
mel3 = ring(69,69,69,72,74,72,74,69,69,69,72,74,72,74,69,69,69,72,74,74,72,74,72,76,72,69)
mel4 = ring(72,72,72,71,71,71,69,69,69,67,67,67,66,66,66,64,64,64,64,64,62,62,64,65,65,74)
mel5 = ring(72,72,72,72,71,71,69,69,67,67,67,66,66,66,64,64,64,62,62,64,65,65,72,74,74,74,77,76,76,74)
mel6 = ring(74,79,78,74,74,79,78,74,74,79,77,76,74,74,76,77,77)
mel7 = ring(74,79,78,74,74,79,78,74,74,79,77,76,74,74,76,77,77,74,84,74,84,74,84,74,79,78)
tm1 = [4,3,2,1,5,1,4,3,2,1,6,4,3,2,1,4,1,4,3,1,6]
tm2 = [1,1,1,1,1,1,2,1,1,1,1,1,1,2,1,1,1,1,1,1,3,1,0.5,0.5,5]
tm3 = [1,1,1,1,1,1,2,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,2,1,6]
tm4 = [0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,1,1,1,1,1,1,6,8]
tm5 = [0.5,1,1,1,1,1,1,1.5,0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,1,1,1,1,2,1,1,2,1,1,1,1,2]
tm6 = [1,1,6,1,1,3,3,1,1,2,2,2,1,1,1,1,4]
tm7 = [1,2,5,1,1,3,3,1,1,2,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,5]

puts mel5.length
puts tm5.length
puts tm5.sum


live_loop :melody do
  tick(:i)
  mel = [mel1,mel2,mel3,mel4,mel5,mel6,mel7].ring.look(:i)
  tm = [tm1,tm2,tm3,tm4,tm5,tm6,tm7].ring.look(:i)
  tick_reset(:ii)
  with_fx :echo, phase: 0.75, decay: 6, mix: 0.7 do
    with_fx :bitcrusher do
      tm.length.times do
        tick(:ii)
        synth :fm, note: mel.look(:ii), release: 0.5
        sleep tm.ring.look(:ii)*0.5
      end
    end
  end
end

bass1 = ring(62,60,53,55)
bass2 = ring(62,55)
tb1 = [4,4,4,4]
tb2 = [4,4]
tb3a = [2,2,2,2]
tb3b = [2,2,2,4]
ch1a = ring('m7','5','5','5')
ch1b = ring(:minor,:major,:major,:major)
ch2a = ring('m7','5')
ch2b = ring(:minor,:major)

live_loop :bass do
  tick(:i)
  bass = [bass1,bass1,bass2,bass2,bass1,bass1].ring.look(:i)
  tb = [tb1,tb1,tb2,tb2,tb3a,tb3b].ring.look(:i)
  chn = [ch1b,ch1b,ch2b,ch2b,ch1b,ch1b].ring.look(:i)
  tick_reset(:ii)
  with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
    with_fx :flanger, mix: 1 do
      tb.length.times do
        tick(:ii)
        tt = tb.ring.look(:ii)*2
        synth :tb303, note: bass.look(:ii)-24, sustain: tt, release: 0, cutoff: 120
        synth :tb303, note: bass.look(:ii)-36, sustain: tt, release: 0, cutoff: 120
        synth :fm, note: bass.look(:ii)-36, sustain: tt, release: 0
        sleep tt
      end
    end
  end
end

live_loop :chord do
  tick(:i)
  bass = [bass1,bass1,bass2,bass2,bass1,bass1].ring.look(:i)
  tb = [tb1,tb1,tb2,tb2,tb3a,tb3b].ring.look(:i)
  chn = [ch1b,ch1b,ch2b,ch2b,ch1b,ch1b].ring.look(:i)
  tick_reset(:ii)
  with_fx :slicer, phase: 0.5, wave: 0, mix: 0 do
    with_fx :flanger, mix: 1 do
      tb.length.times do
        tick(:ii)
        tt = tb.ring.look(:ii)*2
        synth :zawa, note: chord(bass.look(:ii)-0,chn.look(:ii)), sustain: tt, release: 0, cutoff: 80, range: 15
        sleep tt
      end
    end
  end
end
