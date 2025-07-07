use_bpm 100


mel1 = knit(64,3,67,2,62,2,64,3,67,1,69,1,62,1)
mel2 = knit(64,4,67,1,62,2,64,6,67,1,69,1,62,1)
tm1 = [1,1,1,1,1,1,2,1,1,1,1,1,3]
tm2 = [0.5,0.5,1,2,1,1,1,1,0.5,0.5,1,0.5,0.5,1,1,2]

chmel1 = ring(64,62,64,64,64,62,64,64,64,62,64,64,62,64,67,64,64,64,62)
chmel2 = ring(64,64,67,64,62,64,64,67,64,62,64,64,67,67,67,67,69,64,64,64,62)
chmel3 = ring(67,64,67,64,62,67,64,67,64,62)
chmel4 = ring(64,64,64,64,64,67,66,64)
chmel5 = ring(64,67,66,64)

tch1 = [1,1,2,4,1,1,2,4,1,1,2,1,1,2,1,1,2,1,3]
tch2 = [1,1,2,1,3,1,1,2,1,3,1,1,2,1,1,2,1,1,2,1,3]
tch3 = [2,4,2,1,7,2,4,2,1,13]
tch4 = [2,2,1,3,2,3,3,8]
tch5a = [2,3,3,8]
tch5b = [2,3,3,12]

puts tch3.sum

a = 1

live_loop :vox do
  tick(:i)
  if look(:i)==0
    sleep 0.5
  else
    sleep 0
  end
  mel = [mel1,mel2,chmel1,chmel2,chmel3,chmel4,chmel5,chmel5,chmel5,chmel5].ring.look(:i)
  tt = [tm1,tm2,tch1,tch2,tch3,tch4,tch5a,tch5a,tch5a,tch5b].ring.look(:i)
  ff = knit(0.5,2,0.25,8).look(:i)
  with_fx :echo, phase: 0.75, decay: 6, mix: 0.8, amp: 1 do
    ##| roach = synth :dsaw, sustain: tt.sum*0.5-2, release: 4, detune: 0.3
    tick_reset(:ii)
    tt.length.times do
      tick(:ii)
      ##| control roach, note: mel.look(:ii)+12
      synth :dsaw, note: mel.look(:ii)+12, release: 0.75, detune: 0.2
      sleep tt.ring.look(:ii)*ff
    end
  end
end

live_loop :bass do
  with_fx :slicer, phase: 0.25, wave: 0, mix: 0 do
    with_fx :distortion, distort: 0.999, mix: 0.6, amp: 0.7 do
      tick(:iii)
      synth :dsaw, note: ring(64,67,62,62,62).look(:iii)-36, sustain: knit(2,3,1,2).look(:iii), release: 0
      synth :dsaw, note: ring(64,67,62,62,62).look(:iii)-24, sustain: knit(2,3,1,2).look(:iii), release: 0
      2.times do
        tick(:i)
        gg = ring(0.25,0.5)
        synth :fm, note: knit(64,2,62,2,60,2,59,2,62,2).look(:i)-24, release: gg.look(:i)
        synth :dsaw, note: knit(64,2,62,2,60,2,59,2,62,2).look(:i)-24, release: gg.look(:i)
        sleep 0.25
      end
      tick(:ii)
      sleep knit(1.5,3,0.5,2).look(:ii)
    end
  end
end

live_loop :gitty do
  with_fx :distortion, distort: 0.999, mix: 0.6, amp: 0.4 do
    mm = knit(2,2,1,4)
    mm.length.times do
      tick
      ##| synth :dsaw, note: chord(ring(64-0,67-0,64,67,69,62).look-12, '5'), release: mm.look, depth: 20, amp: 0.5, cutoff: 100
      sleep mm.look
    end
  end
end

live_loop :arpeg do
  ap = ring(64,62,60,62)
  ap2 = ring(ap.look(:i),67,66,67,71,67,66,67)
  4.times do
    tick(:i)
    8.times do
      tick(:ii)
      ##| synth :dsaw, note: ap2.look(:ii)+0, release: 0.25, amp: 2
      sleep 0.25
    end
  end
end
