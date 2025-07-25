use_bpm 110

mel1a = ring(64,66,67,69,71,71,69,67,66,64,66,67,69,71,71,69,64)
mel1b = ring(64,66,67,69,71,71,69,67,67,66,66,64,64,66,67,69,71,71,69)
mel2 = ring(62,64,71,71,71,71,69,67,71,71,71,71,71,69,69,67,69,69,71,69,67,69,67,64,62)
mel3 = ring(62,64,71,71,71,71,69,67,71,71,67,71,71,69,71,69,69,64,69,69,67,69,67,67,64)
tm1a = [2,2,2,1,2,1,2,2,2,2,2,2,1,2,1,5,1]
tm1b = [2,2,2,1,2,1,1,1,1,1,1,1,2,2,2,1,2,1,5.5]
tm2 = [0.5,9,1,1,1,0.5,1,1.5,1,13,1,2,3,1,7,1,1.5,1.5,2,0.5,1,1,0.5,10,1.5]
tm3 = [0.5,9,1,1,1,0.5,1,1.5,1,11,1,1.5,1.5,1,3,1,7,1,1.5,1.5,1,3,1,1,11]

puts mel3.length
puts tm3.length
puts tm2.sum

live_loop :melody do
  tick(:i)
  mel = [mel1a,mel1b,mel2,mel3].ring.look(:i)
  tm = [tm1a,tm1b,tm2,tm3].ring.look(:i)
  oo = [12,12,0,0].ring.look(:i)
  tick_reset(:ii)
  with_fx :flanger, mix: 1 do
    gg = synth :dsaw, note: mel[0]+oo, note_slide: 0.25, sustain: (tm.sum*0.5)-2, release: 6
    with_fx :echo, phase: 0.75, decay: 6, mix: 0.7 do
      tm.length.times do
        tick(:ii)
        control gg, note: mel.look(:ii)+oo
        synth :dsaw, note: mel.look(:ii)+oo
        sleep tm.ring.look(:ii)*0.5
      end
    end
  end
end

live_loop :melody do
  with_fx :flanger, room: 69, release: 5, mix: 0.2, decay: 1 do
    
    tm1a.length.times do
      tick
      synth :chipbass, note: mel1a.look+24
      synth :dtri, note: mel1a.look+12
      synth :bass_foundation, note: mel1a.look+24, amp: 1, release: 1, sustain: 0
      sleep tm1a.ring.look*1
    end
  end
end


bass1 = ring(64,69,64,69,62)
bass2 = ring(64,67,62,64,64,67,62,60)
tb1 = [16,16,16,10,6]
tb2 = [16,16,16,16,16,16,16,16]
bassr = ring(0,12,0,12,0,0,12,0)

cha = ring(64,69,64,69,64,62)
chn1a = ring('sus4',:minor,'sus4','sus4',:minor)
chn1b = ring('sus4',:minor)
chn1c = ring(:minor,:minor)
chn1d = ring(:major)
chn3 = ring('5','5','5','5','5','5','5','5')
cht1a = [2,3,2,1,8]
cht1b = [2,3]
cht1c = [2,1]
cht1d = [8]
cht2 = [8,8,8,8,8,8,8,8]
riff1 = [chn1a,chn1a,chn1a,chn1b,chn1c,chn1d]
trf1 = [cht1a,cht1a,cht1a,cht1b,cht1c,cht1d]



live_loop :bass1 do
  tick(:i)
  bass = [bass1,bass2].ring.look(:i)
  tb = [tb1,tb2].ring.look(:i)
  tick_reset(:ii)
  tb.length.times do
    tick(:ii)
    with_fx :slicer, phase: 0.25, wave: 0, mix: 1 do
      synth :dpulse, note: bassr.look(:ii)-0, sustain: tb.ring.look(:ii)*0.5, release: 0, amp: 2
    end
    with_fx :wobble, phase: tb.ring.look(:ii)*0.5, cutoff_max: 90, cutoff_min: 40, wave: 0, mix: 1 do
      synth :dsaw, note: bass.look(:ii)-36, sustain: tb.ring.look(:ii)*0.5, release: 0, amp: 2.5
    end
    with_fx :flanger, mix: 1 do
      tb.ring.look(:ii).times do
        tick(:iii)
        synth :fm, note: bass.look(:ii)+bassr.look(:iii)-24, release: 0.5, depth: 2, amp: 1.7
        sleep 0.5
      end
    end
  end
end

live_loop :kick do
  4.times do
    sample :bd_haus, amp: 4
    sleep 1
  end
end

live_loop :smf do
  with_fx :gverb, room: 69, release: 4, mix: 0.3, amp: 1.3 do
    2.times do
      sleep 1
      synth :cnoise, release: 0.75, amp: 1
      sample :elec_blip, rate: 0.8
      sleep 1
    end
  end
end

live_loop :whip do
  sleep 94.5
  synth :cnoise, attack: 0.5, release: 0
  sleep 0.5
  with_fx :gverb, room: 69, release: 6, mix: 1, amp: 1.2 do
    synth :chipbass, release: 0.75
    sample :drum_bass_hard, rate: 0.5
    sleep 1
  end
end
