total_duration = 267
finish_value = 55 / total_duration.to_f

live_loop :cry do
  with_fx :reverb, mix: 0.5 do
    with_fx :gverb, mix: 0.5 do
      with_fx :distortion, distort: 0.3 do
        with_fx :bitcrusher, mix: 0.15 do
          with_fx :echo, mix: 0.1 do
            with_fx :pitch_shift, pitch: -0.25 do
              sample "C:/Users/rhelo/desktop/kmetfs-in.mp3", rate: 0.85
            end
          end
        end
      end
    end
  end
  sleep total_duration
end