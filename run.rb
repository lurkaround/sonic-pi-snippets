use_bpm 140

mel1a = ring(60,60,63,60,60,60,63,60,60,62,63,67,63,62,63)
mel1b = ring(nil,60,60,63,60,60,60,63,60,60,62,63,67,63,62,63)
mel2 = ring(nil,63,62,63,63,62,63,62,62,62,58,58,60,60,60)
mel3 = ring(nil,63,62,63,63,62,63,65,63,62,62,62,58,58,60,60,60)
tm1a = [3,1,2,3,2,1,2,2,2,2,2,2,3,1,4]
tm1b = [1,2,1,2,3,2,1,2,2,2,2,2,2,3,1,4]
tm2 = [1,2,1,5,2,1,5,2,1,2,1,1,3,1,4]

bass = ring(60,60,60,60,60,62,63,65,65,65,67)
bassy = ring(60,60,60,60,60,62,62,62,62,67)
tb = [2,3,3,5,1,1,1,2,3,3,8]

puts tm2.sum

live_loop :melody do
  tick(:i)
  a = look(:i)
  mel = [mel1a,mel1b,mel2,mel2].ring[a]
  tt = [tm1a,tm1b,tm2,tm2].ring[a]
  tick_reset(:ii)
  with_fx :bitcrusher, phase: 0.25, decay: 5, mix: 0.3 do
    with_fx :flanger, phase: 0.25, decay: 8, mix: 0.4 do
      with_fx :slicer, phase: 0.25*2, wave: 0.5, mix: 1 do
        with_fx :distortion do
          tt.length.times do
            tick(:ii)
            synth :dsaw, note: mel.look(:ii)-12, release: 0.5
            ##| synth :pulse, note: mel.look(:ii)-24, release: 0.5
            synth :pulse, note: mel.look(:ii)-36, release: 0.5
            sleep tt.ring.look(:ii)*0.5
          end
        end
      end
    end
  end
end


live_loop :bass do
  tick
  with_fx :flanger, phase: 0.25*2, wave: 0, mix: 0.5 do
    with_fx :bitcrusher do
      with_fx :distortion, phase: 0.25*2, wave: 0, mix: 1 do
        with_fx :slicer, phase: 0.25*2, wave: 0.5, mix: 1  do
          synth :saw, note: bassy.look-24, depth: 3, env_curve: 0.5, wave: 1, pulse_width: 0.25,  sustain: tb.ring.look*0.75, release: 0
          synth :tb303, note: bassy.look-36, amp: 2, depth: 1, sustain: tb.ring.look*0.5, release: 0
          sleep tb.ring.look*0.5
        end
      end
    end
  end
  
  ##| end
  
  live_loop :bass2 do
    tick
    ##| synth :dark_ambience, note: chord(ring(60,65,60,67).look, ring('m7','9sus4','m7','m11').look, invert: ring(0,-1,0,-3).look), sustain: 2, release: 0, amp: 4
    sleep 4
    
    
    # Use reverb for overall atmosphere
    with_fx :reverb, room: 0.8 do
      
      # Define the kick drum pattern
      define :kick_pattern do
        in_thread do
          16.times do |i|
            sample :bd_ada, amp: 2.5 if [0, 4, 8, 12].include?(i)
            sleep 0.25
          end
        end
      end
      
      ##| # Define the snare drum pattern
      define :snare_pattern do
        with_fx :slicer, phase: 0.25 do
          in_thread do
            16.times do |i|
              if [2, 6, 10, 14].include?(i)
                ##| sample :sn_dolf, amp: 1, rate: 0.8  # Lower the rate for a deeper tone
              end
              sleep 0.5
            end
          end
        end
      end
      
      ##| # Define the hi-hat pattern
      define :hihat_pattern do
        with_fx :slicer do
          with_fx :distortion do
            in_thread do
              16.times do |i|
                ##| sample :drum_cymbal_closed, beat_stretch: 1, amp: 0.3, finish: 0.5 if i % 2 == 0
                sleep 0.5
              end
            end
          end
        end
      end
      
      ##| # Additional elements for variety
      define :variations do
        use_bpm 120
        in_thread do
          16.times do |i|
            ##| Add distortion to the kick for a gritty effect
            with_fx :distortion, distort: 0.6 do
              with_fx :bitcrusher do
                ##| sample :bd_ada, amp: 2 if [4, 12].include?(i)
              end
            end
            
            ##| Lower pitched claps with reverb
            if [8].include?(i)
              with_fx :reverb, phase: 0.25 do
                with_fx :echo, phase: 0.25 do
                  with_fx :octaver do
                    ##| sample :perc_impact1, amp: 0.5, pan: -1, rpitch: -2, rate: 0.75
                  end
                end
              end
              sleep 0.25
            end
          end
        end
      end
      
      ##|       # Play the loops
      ##| live_loop :drums do
      ##|   with_fx :distortion, amp: 1 do
      ##|     with_fx :reverb do
      ##|       kick_pattern
      ##|       snare_pattern
      ##|       hihat_pattern
      ##|       variations
      ##|       sleep 4  # Repeat every 4 beats (16 steps at 0.25s each)
    end
  end
end
##| end
##| end
##| end

