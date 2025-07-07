#DREAMS

use_bpm 120

live_loop :met1 do
  sleep 1
end

cmaster1 = 120
cmaster2 = 120
cmaster3 = 120

##PERC

live_loop :bigkick, sync: :met1 do
  ##| stop
  a = 4
  
  kick = use_synth :kalimba
  sample kick, amp: a, cutoff: cmaster1
  sleep 1
end

##| live_loop :clap, sync: :met1 do
##|   ##| stop
##|   clap = "/Users/sarah/Desktop/dj_dave/samples/Velvia/clap.wav"
##|   sleep 1
##|   sample clap, amp: 1, cutoff: cmaster1
##|   sleep 1
##| end

##| live_loop :hhc1, sync: :met1 do
##|   ##| stop
##|   a = 0.3
##|   hhc = "/Users/sarah/Desktop/dj_dave/samples/Velvia/hhc.wav"
##|   sample hhc, amp: a, finish: 0.25, cutoff: cmaster3
##|   sleep 0.25
##| end

##| live_loop :hho1, sync: :met1 do
##|   ##| stop
##|   hho = "/Users/sarah/Desktop/dj_dave/samples/Velvia/hho_02.wav"
##|   sleep 0.5
##|   sample hho, cutoff: cmaster3
##|   sleep 0.5
##| end

with_fx :reverb, mix: 0.6 do
  live_loop :ding1, sync: :met1 do
    ##| stop
    dong = "C:\Users\rhelo\Desktop\samples\ecotone\ecotone.wav"
    sleep 0.5
    sample dong, amp: 0.1, pan: 0.5, cutoff: cmaster1
    sleep 3.5
  end
end

live_loop :smash, delay: 32, sync: :met1 do
  stop
  a = 0.25
  smash = "C:\Users\rhelo\Desktop\samples\giveittome\giveittome.wav"
  sample smash, amp: a
  sleep 1000000
end


##| #################################################################################################

##| ##| live_loop :sounds, sync: :met1 do
##| ##|   ##| stop
##| ##|   p = 0.3
##| ##|   a = 1
##| ##|   hho = "/Users/sarah/Desktop/dj_dave/samples/samples/hho_analog.wav"
##| ##|   plate = "/Users/sarah/Desktop/dj_dave/samples/samples/plate.wav"
##| ##|   rimshot = "/Users/sarah/Desktop/dj_dave/samples/samples/rimshot.wav"
##| ##|   sample [plate, hho, rimshot].choose, pan: p, cutoff: cmaster2, rate: 2, amp: a if pattern "x--x--x--x--x---"
##| ##|   sleep 0.25
##| ##| end

live_loop :hhc, sync: :met1 do
  ##| stop
  a = 1
  hhc = "C:\Users\rhelo\Desktop\samples\ecotone\ecotone.wav"
  sample hhc, cutoff: cmaster1, amp: a
  sleep 0.25
end

##| ##| live_loop :hho, sync: :met1 do
##| ##|   ##| stop
##| ##|   p = -0.2
##| ##|   a = 1
##| ##|   hho = "/Users/sarah/Desktop/dj_dave/samples/samples/hho_analog.wav"
##| ##|   sleep 0.5
##| ##|   sample hho, pan: p, cutoff: cmaster3, amp: a
##| ##|   sleep 0.5
##| ##| end

live_loop :clap, sync: :met1 do
  ##| stop
  a = 0.75
  clap = "C:\Users\rhelo\Desktop\samples\ecotone\ecotone.wav"
  sleep 1
  sample clap, amp: a, cutoff: cmaster1
  sleep 1
end

live_loop :cowbell, sync: :met1 do
  stop
  a = 0.5
  p = 0.3
  cowbell = "C:\Users\rhelo\Desktop\samples\ecotone\ecotone.wav"
  sleep 0.5
  sample cowbell, pan: p, amp: a, cutoff: cmaster2
  sleep 7.5
end

##| ##| live_loop :shaker, sync: :met1 do
##| ##|   ##| stop
##| ##|   a = 1
##| ##|   p = -0.3
##| ##|   shaker = "/Users/sarah/Desktop/dj_dave/samples/0203/shaker.wav"
##| ##|   sample shaker, pan: p, amp: a, cutoff: cmaster1 if pattern "--xx--x---------"
##| ##|   sleep 0.25
##| ##| end

##| ################################################################################################

##| with_fx :reverb, mix: 0.6 do
##|   with_fx :flanger do
##|     live_loop :verse1, sync: :met1 do
##|       stop
##|       a = 1
##|       c = 80
##|       v1_1 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.1.wav"
##|       v1_2 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.2.wav"
##|       v1_3 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.3.wav"
##|       v1_4 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.4.wav"
##|       v1_5 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.5.wav"
##|       sleep 1
##|       sample v1_1, start: 0.01, amp: a, cutoff: c
##|       sleep 8
##|       sample v1_2, amp: a, cutoff: c, start: 0.01
##|       sleep 8
##|       sample v1_3, amp: a, cutoff: c, start: 0.01
##|       sleep 16
##|       sample v1_4, amp: a, cutoff: c, start: 0.01
##|       sleep 14.6
##|       sample v1_5, amp: a, cutoff: c, start: 0.01
##|       sleep 10.4
##|       10.times do
##|         sample v1_5, start: 0.685, amp: a, cutoff: c
##|         sleep 4
##|       end
##|       sleep 100000
##|     end
##|   end
##| end

##| with_fx :reverb, mix: 0.6 do
##|   with_fx :flanger do
##|     live_loop :verse2, sync: :met1 do
##|       stop
##|       a = 1
##|       c = 100
##|       v2 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v2.wav"
##|       v2_2 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v2.2.wav"
##|       sleep 1
##|       sample v2, amp: a, cutoff: c, start: 0.01
##|       sleep 31.9
##|       sample v2_2, amp: a, cutoff: c, finish: 0.58
##|       sleep 14.7
##|       sample v2_2, amp: a, cutoff: c, start: 0.6
##|       sleep 1000000
##|     end
##|   end
##| end

##| with_fx :reverb, mix: 0.6 do
##|   live_loop :vox, sync: :met1 do
##|     stop
##|     a = 1.2
##|     c = 90
##|     wrap = "/Users/sarah/Desktop/dj_dave/samples/Dreams/prechorus_01.wav"
##|     heart = "/Users/sarah/Desktop/dj_dave/samples/Dreams/heartbeat.wav"
##|     like = "/Users/sarah/Desktop/dj_dave/samples/Dreams/likeaheartbeat.wav"
##|     heart2 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/heartbeat_solo.wav"
##|     4.times do
##|       sleep 0.5
##|       sample wrap, amp: a, cutoff: c, start: 0.015
##|       sleep 5.43
##|       sample heart, amp: a, cutoff: c
##|       sleep 2.08
##|     end
##|     2.times do
##|       sleep 1
##|       sample like, amp: a, cutoff: c
##|       sleep 3
##|     end
##|     sleep 0.5
##|     sample wrap, amp: a, cutoff: c, start: 0.015
##|     sleep 5.43
##|     sample heart, amp: a, cutoff: c
##|     sleep 2.08
##|     2.times do
##|       sleep 1
##|       sample like, amp: a, cutoff: c
##|       sleep 3
##|     end
##|     sleep 0.5
##|     sample wrap, amp: a, cutoff: c, start: 0.015
##|     sleep 5.43
##|     sample heart, amp: 0.6
##|     sleep 2.08

##|     sleep 1000000
##|   end
##| end

##| with_fx :reverb, mix: 0.6 do
##|   live_loop :chorus, sync: :met1 do
##|     ##| stop
##|     a = 1
##|     c = 100
##|     chorus1 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/chorus_01.wav"
##|     chorus2 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/chorus_02.wav"
##|     chorus3 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/chorus_03.wav"
##|     chorus4 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/chorus_04.wav"
##|     sample chorus1, amp: a, cutoff: c
##|     sleep 15.7
##|     sample chorus2, amp: a, cutoff: c
##|     sleep 16.15
##|     sample chorus3, amp: a, cutoff: c
##|     sleep 16.15
##|     sample chorus4, amp: a, cutoff: c
##|     sleep 16
##|   end
##| end

with_fx :reverb do
  ##| with_fx :slicer, mix: 0.75 do
  live_loop :likea, sync: :met1 do
    stop
    a = 1
    c = 100
    p = [-0.6, 0.6].choose
    like = "C:\Users\rhelo\Desktop\samples\ecotone\ecotone.wav"
    sleep 1
    sample like, amp: a, cutoff: c, pan: p
    sleep 3
  end
  ##| end
end

with_fx :reverb, mix: 0.6 do
  live_loop :arp, sync: :met1 do
    ##| stop
    a = 0.6
    r = line(0.25, 0.5, steps: 128).mirror.look
    p = line(-0.25, 0.25, steps: 128).mirror.look
    use_synth :saw
    notes = (scale :a3, :minor_pentatonic).shuffle
    tick
    play notes.look, amp: a, cutoff: 70, release: r, pan: p
    sleep 0.25
  end
end



##########################################################################################


with_fx :reverb, mix: 0.4 do
  live_loop :bass_highend, sync: :met1 do
    ##| stop
    a = 0.6
    c = 50
    r = 0.5
    c2 = 60
    use_synth :saw
    32.times do
      play :a1, cutoff: c, amp: a, release: r
      play :a2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :f1, cutoff: c, amp: a, release: r
      play :f2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :d1, cutoff: c, amp: a, release: r
      play :d2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :f1, cutoff: c, amp: a, release: r
      play :f2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
  end
end



with_fx :reverb do
  with_fx :slicer, mix: 0.75 do
    live_loop :fm, delay: 5, sync: :met1 do
      stop
      a = 0.5
      c = 100
      3.times do
        sample t1, amp: a, cutoff: c
        sleep 8.25
      end
      4.times do
        sample t2, amp: a, cutoff: c, start: 0.005
        sleep 8.25
      end
      sample t1, amp: a, cutoff: c
      sleep 8
    end
  end
end

with_fx :reverb, mix: 0.4 do
  live_loop :chipbass, sync: :met1 do
    stop
    a = 0.7
    c = 50
    r = 0.4
    use_synth :saw
    32.times do
      play :a1, cutoff: c, amp: a, release: r
      play :a2, cutoff: c, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :g1, cutoff: c, amp: a, release: r
      play :g2, cutoff: c, amp: a, release: r
      sleep 0.25
    end
    64.times do
      play :f1, cutoff: c, amp: a, release: r
      play :f2, cutoff: c, amp: a, release: r
      sleep 0.25
    end
  end
end
