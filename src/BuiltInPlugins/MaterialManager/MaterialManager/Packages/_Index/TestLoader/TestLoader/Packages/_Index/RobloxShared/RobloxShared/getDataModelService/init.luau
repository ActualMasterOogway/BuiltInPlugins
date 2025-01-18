return function(v0) --[[ Line: 2 ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 3 ]]
        -- upvalues: v0 (copy)
        local l_game_Service_0 = game:GetService(v0);
        local _ = l_game_Service_0.Name;
        return l_game_Service_0;
    end);
    return l_status_0 and l_result_0 or nil;
end;