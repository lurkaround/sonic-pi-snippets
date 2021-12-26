# Loading previous buffer contents. Please wait...# This is Quarantooli by Toolee Bits, enjoy exploring the different layers of this tune


##| live_loop :beat do
##|   sample :bd_808, amp: 0
##|   play chord(:c3, :sus4), attack: 1, release: 3, pitch: 25, amp: 0.2
##|   play chord(:c2, :sus4), attack: 0.9, release: 4, pitch: 15, amp: 0.2
##|   sleep 1
##| end

##| live_loop :beat_1, sync: :beat do
##|   with_fx :reverb, room: 0.4, mix: 0.2 do
##|     sample :bd_haus, amp: 1
##|     sleep 0.250
##|     sample :drum_cymbal_closed, amp: 0.7, rate: 0.7, lpf: 120
##|     sleep 0.250
##|   end
##| end



##| live_loop :beat_2, sync: :beat do
##|   with_fx :reverb, mix: 0.5, amp: 1 do
##|     sample :tabla_tun1 , amp: 0.3, lpf: 100
##|     sleep 0.5
##|     sample :bd_klub, amp: 0.8
##|     sample :elec_hi_snare, rate: 0.9, lpf: 130
##|     sleep 0.5
##|   end
##| end

##| live_loop :synth, sync: :beat do
##|   with_fx :echo, mix: 0.3, amp: 0.6 do # amp: 0.6
##|     use_synth :dpulse
##|     play chord(:c3, :sus4), attack: 0.9, release: 4, pitch: 15
##|     play chord(:c2, :sus4), attack: 0.9, release: 1.5, pitch: 15
##|     sleep 4
##|     play chord(:f3, :sus4), attack: 0.9, release: 4, pitch: 15
##|     play chord(:f2, :sus4), attack: 0.9, release: 1.5, pitch: 15
##|     sleep 4
##|     play chord(:g3, :sus4), attack: 0.9, release: 4, pitch: 15
##|     play chord(:g2, :sus4), attack: 0.9, release: 1.5, pitch: 15
##|     sleep 4
##|     play chord(:g4, :sus4), attack: 0.9, release: 4, pitch: 15
##|     play chord(:g2, :sus4), attack: 0.9, release: 1.5, pitch: 15
##|     sleep 4
##|   end
##| end

##| live_loop :synth_2, sync: :beat do
##|   with_fx :echo, mix: 0.3, amp: 0.5 do #amp: 0.5
##|     use_synth :dtri
##|     use_random_seed 30 #30,40
##|     16.times do
##|       play chord(:c2, :sus4, num_octaves: 2).mirror.choose, release: 0.4, pitch: 20
##|       sleep 0.250
##|     end
##|     16.times do
##|       play chord(:f2, :sus4, num_octaves: 2).mirror.choose, release: 0.4, pitch: 20
##|       sleep 0.250
##|     end
##|     16.times do
##|       play chord(:g2, :sus4, num_octaves: 2).mirror.choose, release: 0.4, pitch: 20
##|       sleep 0.250
##|     end
##|     16.times do
##|       play chord(:g3, :sus4, num_octaves: 2).mirror.choose, release: 0.4, pitch: 20
##|       sleep 0.250
##|     end
##|   end
##| end


##| live_loop :beat do
##|   tick
##|   sample :bd_haus, amp: 4, cutoff: 85 if (spread 8,16).look
##|   sample :sn_dub, amp: ring(0,0,3,0).look, cutoff: 120
##|   sleep 0.5
##| end


##| live_loop :synth_3, sync: :beat_1 do
##|   with_fx :echo, mix: 0.5, amp: 0.5 do # amp: 0.5
##|     use_synth :dpulse
##|     play chord(:c3, :sus4).mirror.tick, release: 0.2, pitch: 15
##|     sleep 0.25
##|   end
##| end

##| live_loop :drums do
##|   stop

##|   sample :drum_heavy_kick, amp: 2
##|   sleep 1

##|   sample :drum_snare_hard, rate: 0.75, amp: 0.8
##|   sleep 1
##| end

##| live_loop :bass do
##|   with_fx :lpf, cutoff: 60, cutoff_slide: 64 do |e|
##|     control e, cutoff: 130
##|     16.times do
##|       7.times do
##|         t = ring(0.75, 0.25, 0.5, 1, 0.5, 0.25, 0.75).tick
##|         k = 7
##|         with_fx :slicer, phase: 0.5, wave: 0, mix: 1 do
##|           synth :saw,  note: (knit :a1, k, :d1, k, :e1, k, :c1, k).look, sustain: 0, release: t, amp: 5
##|           synth :dsaw, note: (knit :a2, k, :d2, k, :e2, k, :c2, k).look, sustain: t, release: 0, amp: 5, detune: 0.2, cutoff: 110

##|         end
##|         synth :fm, note: (knit :a2, k, :d2, k, :e2, k, :c2, k).look, sustain: 0, release: t, amp: 6, depth: 3
##|         sleep t
##|       end
##|     end
##|   end
##| end

##| in_thread do
##|   live_loop :beatbot2 do
##|     sleep 1
##|     4.times do
##|       tick
##|       with_fx :gverb, room: 50, mix: 0.7 do
##|         with_fx :echo, phase: 0.5, decay: 4, mix: 1 do
##|           synth :cnoise, release: rrand(0.15,0.25), amp: 1.1, env_curve: 3, res: 0.33, cutoff: rrand(110,115)
##|           synth :dsaw, note: ring(65,68,63,63).tick(:ii)-0, sustain: 0, release: 0.2, detune: 0.2, amp: 2, cutoff: 125
##|         end
##|         sleep ring(0.75,0.75,1,1).look*2
##|       end
##|     end
##|   end
##| end

use_bpm 120

chord_amp = 0.6
pulse_amp = 0.2
pulse_attack = 0
pulse_release = 0.2
hihat_cutoff = 120
closed_hihat_amp = 0.66
open_hihat_amp = 0.33
fade_out = (line 1,0, steps: 2, inclusive: true)
master = (ramp *range(0, 1, 0.01))
kick_cutoffs = range(60, 80, 0.5).mirror
solenoids = "C:/Users/rhelo/Documents/samples/bassLoop.wav"

define :intro_bd_thump do
  132.times do
    if (spread 1, 4).tick then
      sample solenoids, amp: master.look,
        cutoff: kick_cutoffs.look
    end
    sleep 0.25
  end
end

define :basic_bd_thump do
  8.times do
    sample solenoids, cutoff: 60
    sleep 1
  end
end

define :basic_hihat do
  2.times do
    sleep 0.5
    sample solenoids, amp: closed_hihat_amp, cutoff: hihat_cutoff
    sleep 0.25
    sample solenoids, amp: closed_hihat_amp, cutoff: hihat_cutoff
    sleep 0.75
    sample solenoids, amp: closed_hihat_amp, cutoff: hihat_cutoff
    sleep 1
    sample solenoids, amp: closed_hihat_amp, cutoff: hihat_cutoff
    sleep 1
    sample solenoids, amp: closed_hihat_amp, cutoff: hihat_cutoff
    sleep 0.5
  end
end

define :open_and_shut_hihat do
  2.times do
    sleep 0.5
    sample solenoids, amp: open_hihat_amp, cutoff: hihat_cutoff
    sleep 0.25
    sample solenoids, amp: closed_hihat_amp, cutoff: hihat_cutoff
    sleep 0.75
    sample solenoids, amp: open_hihat_amp, cutoff: hihat_cutoff
    sleep 1
    sample solenoids, amp: open_hihat_amp, cutoff: hihat_cutoff
    sleep 1
    sample solenoids, amp: open_hihat_amp, cutoff: hihat_cutoff
    sleep 0.5
  end
end

define :basic_snare do
  4.times do
    sleep 1
    sample solenoids
    sleep 1
  end
end

define :full_intro do
  in_thread do
    basic_bd_thump
  end
  basic_snare
end

define :first_beat do
  in_thread do
    basic_bd_thump
  end
  in_thread do
    basic_hihat
  end
  basic_snare
end

define :second_beat do
  in_thread do
    basic_bd_thump
  end
  in_thread do
    open_and_shut_hihat
  end
  basic_snare
end

define :basic_melody_line do
  use_synth :fm
  play :c3
  sleep 0.25
  play :ds3
  sleep 0.5
  play :c3
  sleep 0.75
  play :as3
  sleep 1
  play :as3
  sleep 0.5
  play :gs3
  sleep 0.5
  play :g3
  sleep 4.5
end

define :minimised_melody_line do
  use_synth :fm
  play :c3
  sleep 8
end
define :simple_melody_line do
  use_synth :fm
  play :c3, release: 12, amp: 0.75
  sleep 4
  play :ds3, release: 12, amp: 0.75
  sleep 4
  play :f3, release: 12, amp: 0.75
  sleep 8
end
define :basic_melo_intro do
  in_thread do
    full_intro
  end
  basic_melody_line
end

define :ibiza_verse_1 do
  use_synth :beep
  play chord(:c4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:c4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:c4, :minor), sustain: 1, amp: chord_amp
  sleep 1
  play chord(:as4, :major), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:as4, :major), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 1
  play chord(:f4, :major), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:f4, :major), sustain: 1, amp: chord_amp
  sleep 0.75
end

define :ibiza_verse_1_part_2 do
  use_synth :beep
  play chord(:c4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:c4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:c4, :minor), sustain: 1, amp: chord_amp
  sleep 1
  play chord(:as4, :major), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:as4, :major), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 1
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
  play chord(:g4, :minor), sustain: 1, amp: chord_amp
  sleep 0.75
end

define :hihatless_ibiza_verse do
  in_thread do
    ibiza_verse_1
  end
  in_thread do
    full_intro
  end
  basic_melody_line
end

define :drumless_ibiza_verse do
  in_thread do
    ibiza_verse_1
  end
  basic_melody_line
end

define :first_hihat_ibiza_verse do
  in_thread do
    ibiza_verse_1
  end
  in_thread do
    first_beat
  end
  minimised_melody_line
end

define :pulse do
  use_synth :dpulse
  128. times do
    play :c4, attack: pulse_attack, release: pulse_release, cutoff: 85, amp: pulse_amp
    sleep 0.25
  end
end

define :shaker do
  16.times do
    with_fx :slicer, mix: 1, phase: 0.25, pulse_width: rrand(0.1,0.2) do
      with_fx :hpf, cutoff: 130 do
        with_synth :noise do
          play :c1, decay: 1
        end
      end
    end
    sleep 1
  end
end

define :bassline do
  use_synth :fm
  play :c3
  sleep 1.75
  play :c3
  sleep 0.5
  play :ds3
  sleep 0.25
  play :c3
  sleep 0.5
  play :c3
  sleep 0.5
  play :c4
  sleep 0.5
end

define :wah do
  with_fx :ixi_techno, phase: 0.25, res: 0.1, amp: 0.6, mix: 0.8 do
    use_synth :fm
    play chord(:c4, :minor), release: 12
    sleep 4
    play chord(:ds4, :major), release: 12
    sleep 4
    play chord(:f4, :minor), release: 12
    sleep 4
    play chord(:cs4, :major), release: 12
    sleep 4
  end
end

define :first_pulse_hihat_ibiza_verse do
  in_thread do
    4.times do
      ibiza_verse_1
    end
  end
  in_thread do
    4.times do
      first_beat
    end
  end
  in_thread do
    pulse
  end
  2.times do
    3.times do
      bassline
    end
    sleep 4
  end
end

define :first_pulse_hihat_shaker_ibiza_verse do
  in_thread do
    2.times do
      shaker
    end
  end
  in_thread do
    4.times do
      ibiza_verse_1_part_2
    end
  end
  in_thread do
    4.times do
      first_beat
    end
  end
  in_thread do
    pulse
  end
  2.times do
    3.times do
      bassline
    end
    sleep 4
  end
end

define :first_pulse_open_and_shut_hihat_shaker_ibiza_verse do
  in_thread do
    2.times do
      shaker
    end
  end
  in_thread do
    4.times do
      ibiza_verse_1_part_2
    end
  end
  in_thread do
    4.times do
      second_beat
    end
  end
  in_thread do
    pulse
  end
  2.times do
    3.times do
      bassline
    end
    sleep 4
  end
end

define :first_pulse_open_and_shut_hihat_shaker_wah_ibiza_verse do
  in_thread do
    2.times do
      shaker
    end
  end
  in_thread do
    4.times do
      with_fx :level, amp: fade_out.tick do
        ibiza_verse_1_part_2
      end
    end
  end
  in_thread do
    4.times do
      second_beat
    end
  end
  in_thread do
    pulse
  end
  in_thread do
    2.times do
      wah
    end
  end
  2.times do
    simple_melody_line
  end
end

define :first_pulse_open_and_shut_hihat_shaker_wah_verse do
  in_thread do
    2.times do
      shaker
    end
  end
  in_thread do
    4.times do
      second_beat
    end
  end
  in_thread do
    pulse
  end
  in_thread do
    2.times do
      wah
    end
  end
  2.times do
    simple_melody_line
  end
end

define :first_pulse_shaker_wah_verse do
  in_thread do
    2.times do
      shaker
    end
  end
  in_thread do
    4.times do
      full_intro
    end
  end
  in_thread do
    pulse
  end
  in_thread do
    2.times do
      wah
    end
  end
  2.times do
    simple_melody_line
  end
end

define :bd_snare_wah_verse do
  in_thread do
    4.times do
      full_intro
    end
  end
  2.times do
    wah
  end
end

##| -------track arrangement----------
with_fx :reverb do
  intro_bd_thump
  3.times do
    hihatless_ibiza_verse
  end
  drumless_ibiza_verse
  3.times do
    first_hihat_ibiza_verse
  end
  drumless_ibiza_verse
  first_pulse_hihat_shaker_ibiza_verse
  first_pulse_open_and_shut_hihat_shaker_ibiza_verse
  first_pulse_open_and_shut_hihat_shaker_wah_ibiza_verse
  first_pulse_open_and_shut_hihat_shaker_wah_verse
  first_pulse_shaker_wah_verse
  wah
  wah
end
