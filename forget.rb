use_bpm 120
mel1 = ring(65,67,69,69,69,72,67,67,67,65,67,67,67,65,62)
mel2 = ring(65,67,69,72,74,76,74,72,69,65,67,67,67,65,62)
mel3 = ring(65,64,64,62,65,64,64,65,64,62)
tm1 = [1,2,3,2,2,1,2,2,3,1,3,2,2,1,5]
tm2 = [1,2,2,2,2,2,2,2,3,1,3,2,2,1,5]
tm3 = [1,2,3,10,1,2,3,1,1,4]

mel4 = ring(74,74,74,72,74.6,74,72,69,72,74,74,74,74,72,74.6,74,72,74,69,67,65)
mel5 = ring(74,74,74,72,74.6,74,72,69,72,74,74,74,74,72,74.6,74,72,72,72,72,74,77,81)
tm4 = [1,1,1,1,1,1,4,1,2,3,1,1,1,1,1,1,4,1,1,1,3]
tm5 = [1,1,1,1,1,1,4,1,2,3,1,1,1,1,1,1,3,1,1,2,2,2,1]

puts tm5.sum
puts tm5.length

live_loop :melody do
  tick(:i)
  mel = [mel1,mel1,mel2,mel3,mel4,mel5].ring.look(:i)-24
  tt = [tm1,tm1,tm2,tm3,tm4,tm5].ring.look(:i)
  t = [0.25,0.25,0.25,0.25,0.5,0.5].ring.look(:i)
  tick_reset(:ii)
  with_fx :echo, phase: 0.75, decay: 5, mix: 0.7 do
    with_fx :bitcrusher do
      tt.length.times do
        tick(:ii)
        synth :fm, note: mel.look(:ii)-12, release: 0.75
        sleep tt.ring.look(:ii)*t
      end
    end
  end
end

live_loop :bass do
  tick
  if look==0
    sleep 1
  else
    sleep 0
  end
  synth :prophet, note: ring(65,67,69).look-36, sustain: ring(4,4,8).look*1, release: 0
  synth :tb303, note: ring(65,67,69).look-24, sustain: ring(4,4,8).look*1, release: 0
  sleep ring(4,4,8).look*1
end

live_loop :kicky do
  tick
  if look==0
    sleep 1
  else
    sleep 0
  end
  sample :bd_haus, cutoff: 90, amp: 3
  sleep 2
end
