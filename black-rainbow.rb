use_bpm 100

bassy = ring(60,62,63,60,58,60,62,58,56,58,60,56,58,56,55,53)

timender = ring(1,1,1,13)

live_loop :bass do
  with_fx :bitcrusher, sample_rate: 9000, mix: 1 do
    with_fx :wobble, phase: 16, cutoff_max: 100, cutoff_min: 50, mix: 1 do
      with_fx :distortion, distort: 0.8, mix: 0 do
        4.times do
          tick
          synth :dsaw, note: bassy.look-36, sustain: timender.look*0.5, release: 0
          synth :prophet, note: bassy.look-24, sustain: timender.look*0.5, release: 0
          synth :fm, note: bassy.look-12, sustain: timender.look*0.5, release: 0, depth: 3
          sleep timender.look*0.5
        end
      end
    end
  end
end

live_loop :highstring do
  with_fx :distortion do
    with_fx :gverb, room: 49, release: 4, mix: 0.25 do
      with_fx :slicer, phase: 1, wave: 2, mix: 1 do
        synth :pluck, note: bassy.look-12, sustain: timender.look*0.5, release: 0, depth: 3, amp: 1
        sleep timender.look*0.5
      end
    end
  end
end



