function multiply_framerate()
    local fps = mp.get_property_number("container-fps")
    if not fps then
        return
    end

    local new_fps = fps
    -- fps = math.floor(fps)
    if fps >= 1 and fps < 2 then
        new_fps = fps * 48
    elseif fps >= 2 and fps < 3 then
        new_fps = fps * 24
    elseif fps >= 3 and fps < 4 then
        new_fps = fps * 16
    elseif fps >= 4 and fps < 5 then
        new_fps = fps * 12
    elseif fps >= 5 and fps < 6 then
        new_fps = fps * 10
    elseif fps >= 6 and fps < 7 then
        new_fps = fps * 8
    elseif fps >= 7 and fps < 8 then
        new_fps = fps * 7
    elseif fps >= 8 and fps < 10 then
        new_fps = fps * 6
    elseif fps >= 10 and fps < 12 then
        new_fps = fps * 5
    elseif fps >= 12 and fps < 16 then
        new_fps = fps * 4
    elseif fps >= 16 and fps < 24 then
        new_fps = fps * 3
        -- special case for 23.976
        -- if fps >= 23 then
        --     new_fps = fps * 2
        -- end
    elseif fps >= 24 and fps < 30 then
        new_fps = fps * 2
    elseif fps >= 30 and fps < 60 then
        new_fps = fps * 2
    end

    if new_fps > fps then
        mp.set_property("vf", "fps=" .. new_fps)
    end
end

mp.register_event("file-loaded", multiply_framerate)
