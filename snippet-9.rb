use_bpm 60

sleep 2

play 28, release: 2

sleep 2.2

live_loop :noot28 do
  use_synth [:hollow, :dark_ambience, :prophet, :blade, :beep].choose
  play 18.28, rate: 0.8, release: 2, amp: rrand(0.2,0.9)
  play 28.28, rate: 1.4, release: 3, amp: rrand(0.2,0.9)
  play 28.28, rate: 1.2, attack: 0.5, release: 4, amp: rrand(0.4,0.9)
  sleep [16, 8, 4].choose
end


live_loop :melody do
  with_fx [:compressor, :echo, :reverb].choose, mix: rrand(0.3,0.6) do
    use_synth [:hollow, :dark_ambience, :prophet, :blade].choose
    r = [0.25, 0.75, 0.5, 1, 2,2.5,0.88, 3,4].choose
    play (chord :c, :minor).choose, attack: -0.25+r, release: r, amp: rrand(0.2, 0.8)
    sleep r+0.25
  end
end

sleep 12

live_loop :keys do
  with_fx :ixi_techno, mix: rrand(0.2, 0.6) do
    use_synth :blade
    play chord(:c, :minor), amp: rrand(0.2,0.6)
    sleep 0.5
  end
end

sleep 8

live_loop :bass do
  with_fx [:compressor, :echo, :reverb].choose, mix: rrand(0.4,0.7) do
    use_synth [:hollow, :dark_ambience].choose
    n = (chord :c2, :minor).tick
    7.times do
      play n, amp: rrand(0.8, 3.6)
      sleep [0.5, 1].choose
    end
    play n
    sleep 0.5
    play (chord :c2, :minor).tick, amp: rrand(0.8, 1.8)
    sleep 0.5
  end
end

sleep 4

live_loop :beathaus1 do
  sample [:bd_klub, :bd_haus].choose, rate: 0.8, cutoff: rrand(90, 120), amp: rrand(0.6,1.3)
  sleep 4
end

sleep 8

live_loop :beathaus2 do
  sample [:bd_808, :bd_klub, :bd_tek, :bd_haus].choose, rate: 0.6, cutoff: rrand(60, 110), amp: rrand(0.3,1.6)
  sleep 0.5
end

sleep 8

live_loop :koortje do
  sample :sn_dolf, rate: [1,0.4,-0.5, 1.2, -1.8, 0.28, 0.88, -1.2].choose, cutoff: rrand(70,110), amp: rrand(0.2,0.6)
  sleep 16
end

with_fx :reverb do
  live_loop :DrumzTijd, auto_cue: false do
    
    sample :drum_bass_hard, amp: rrand(0.09,1.1), room: rrand(0.4,0.8)
    sleep 1
    
  end
end


sleep 90


with_fx :ixi_techno, mix: 0.06 do
  with_fx :gverb, mix: 0.05 do
    
    live_loop :bassorumpu do
      sample [:bd_808, :bd_klub, :bd_tek, :bd_haus].choose, amp: rrand(0.2,0.8)
      sleep [0.25, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 2].choose
      #sleep 2
    end
    
    live_loop :luuppibiitti do
      sample [:drum_bass_soft, :drum_bass_hard].choose, amp: rrand(0.2,1.2)
      #sample :bd_808
      #sleep [0.25, 0.5, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5, 1].choose
      sleep 0.5
    end
    
    live_loop :BassoraitA do
      use_synth [:blade, :zawa, :zawa, :saw, :zawa, :zawa, :tb303, :tb303, :gnoise, :cnoise].choose
      #use_synth :tb303
      use_synth_defaults release: rrand(0.05, 0.24), amp: rrand(0.5, 1.5)
      with_fx :ixi_techno, mix: 0.6 do
        nuotit = (ring :C2, :C3, :r, :Eb3, :r, :G2, :Bb2, :r)
        play nuotit.tick, cutoff: rrand(30, 120)
      end
      sleep [0.25, 0.125, 0.125, 0.5, 0.125, 0.25, 0.125, 0.125].choose
    end
    
    live_loop :BassoraitB do
      #use_synth [:blade, :zawa, :zawa, :saw, :zawa, :zawa, :tb303].choose
      use_synth :prophet
      use_synth_defaults release: rrand(0.05, 0.24), amp: rrand(0.2, 0.8)
      with_fx :ixi_techno, mix: 0.6 do
        nuotit = (ring :C2, :C3, :r, :Eb3, :r, :G2, :Bb2, :r)
        play nuotit.tick, cutoff: rrand(30, 120)
      end
      #sleep [0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.125, 0.125].choose
      sleep 0.25
    end
    
    
    
    live_loop :hihat do
      sample :drum_cymbal_pedal, amp: rrand(0.1, 0.7)
      sleep [0.25, 0.125, 0.125, 0.5, 0.125, 0.25, 0.125, 0.125, 1, 2].choose
    end
    
    live_loop :virveli do
      sleep 1
      with_fx :ixi_techno, mix: 0.8 do
        sample [:perc_snap, :perc_snap2, :bd_haus].choose, amp: rrand(0.5,1.4)
      end
      sleep 1
    end
    
    
  end
end


use_bpm 60

sleep 2

play 28, release: 2

sleep 2.2

live_loop :noot28 do
  use_synth [:hollow, :dark_ambience, :prophet, :blade, :beep].choose
  play 18.28, rate: 0.8, release: 2, amp: rrand(0.2,0.9)
  play 28.28, rate: 1.4, release: 3, amp: rrand(0.2,0.9)
  play 28.28, rate: 1.2, attack: 0.5, release: 4, amp: rrand(0.4,0.9)
  sleep [16, 8, 4].choose
end

live_loop :melody do
  with_fx [:compressor, :echo, :reverb].choose, mix: rrand(0.3,0.6) do
    use_synth [:hollow, :dark_ambience, :prophet, :blade].choose
    r = [0.25, 0.75, 0.5, 1, 2,2.5,0.88, 3,4].choose
    play (chord :c, :minor).choose, attack: -0.25+r, release: r, amp: rrand(0.2, 0.8)
    sleep r+0.25
  end
end

sleep 12

live_loop :keys do
  with_fx :ixi_techno, mix: rrand(0.2, 0.6) do
    use_synth :blade
    play chord(:c, :minor), amp: rrand(0.2,0.6)
    sleep 0.5
  end
end

sleep 8

live_loop :bass do
  with_fx [:compressor, :echo, :reverb].choose, mix: rrand(0.4,0.7) do
    use_synth [:hollow, :dark_ambience].choose
    n = (chord :c2, :minor).tick
    7.times do
      play n, amp: rrand(0.8, 3.6)
      sleep [0.5, 1].choose
    end
    play n
    sleep 0.5
    play (chord :c2, :minor).tick, amp: rrand(0.8, 1.8)
    sleep 0.5
  end
end

sleep 4

live_loop :beathaus1 do
  sample [:bd_klub, :bd_haus].choose, rate: 0.8, cutoff: rrand(90, 120), amp: rrand(0.6,1.3)
  sleep 4
end

sleep 8

live_loop :beathaus2 do
  sample [:bd_808, :bd_klub, :bd_tek, :bd_haus].choose, rate: 0.6, cutoff: rrand(60, 110), amp: rrand(0.3,1.6)
  sleep 0.5
end

sleep 8

live_loop :koortje do
  sample :sn_dolf, rate: [1,0.4,-0.5, 1.2, -1.8, 0.28, 0.88, -1.2].choose, cutoff: rrand(70,110), amp: rrand(0.2,0.6)
  sleep 16
end

with_fx :reverb do
  live_loop :DrumzTijd, auto_cue: false do
    
    sample :drum_bass_hard, amp: rrand(0.09,1.1), room: rrand(0.4,0.8)
    sleep 1
  end
end

sleep 90

with_fx :ixi_techno, mix: 0.06 do
  with_fx :gverb, mix: 0.05 do
    live_loop :bassorumpu do
      sample [:bd_808, :bd_klub, :bd_tek, :bd_haus].choose, amp: rrand(0.2,0.8)
      sleep [0.25, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 2].choose
      #sleep 2
    end
    
    live_loop :luuppibiitti do
      sample [:drum_bass_soft, :drum_bass_hard].choose, amp: rrand(0.2,1.2)
      #sample :bd_808
      #sleep [0.25, 0.5, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5, 1].choose
      sleep 0.5
    end
    
    live_loop :BassoraitA do
      use_synth [:blade, :zawa, :zawa, :saw, :zawa, :zawa, :tb303, :tb303, :gnoise, :cnoise].choose
      #use_synth :tb303
      use_synth_defaults release: rrand(0.05, 0.24), amp: rrand(0.5, 1.5)
      with_fx :ixi_techno, mix: 0.6 do
        nuotit = (ring :C2, :C3, :r, :Eb3, :r, :G2, :Bb2, :r)
        play nuotit.tick, cutoff: rrand(30, 120)
      end
      sleep [0.25, 0.125, 0.125, 0.5, 0.125, 0.25, 0.125, 0.125].choose
    end
    
    live_loop :BassoraitB do
      #use_synth [:blade, :zawa, :zawa, :saw, :zawa, :zawa, :tb303].choose
      use_synth :prophet
      use_synth_defaults release: rrand(0.05, 0.24), amp: rrand(0.2, 0.8)
      with_fx :ixi_techno, mix: 0.6 do
        nuotit = (ring :C2, :C3, :r, :Eb3, :r, :G2, :Bb2, :r)
        play nuotit.tick, cutoff: rrand(30, 120)
      end
      #sleep [0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.125, 0.125].choose
      sleep 0.25
    end
    
    
    
    live_loop :hihat do
      sample :drum_cymbal_pedal, amp: rrand(0.1, 0.7)
      sleep [0.25, 0.125, 0.125, 0.5, 0.125, 0.25, 0.125, 0.125, 1, 2].choose
    end
    
    live_loop :virveli do
      sleep 1
      with_fx :ixi_techno, mix: 0.8 do
        sample [:perc_snap, :perc_snap2, :bd_haus].choose, amp: rrand(0.5,1.4)
      end
      sleep 1
    end
  end
end
