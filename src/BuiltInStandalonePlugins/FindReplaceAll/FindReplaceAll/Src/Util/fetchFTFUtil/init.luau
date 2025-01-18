return function() --[[ Line: 1 ]]
    local l_script_FirstAncestorWhichIsA_0 = script:FindFirstAncestorWhichIsA("Plugin");
    local v1 = nil;
    local v2 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
        -- upvalues: l_script_FirstAncestorWhichIsA_0 (copy)
        return l_script_FirstAncestorWhichIsA_0:GetPluginComponent("FTFUtil");
    end);
    if l_status_0 then
        v1 = l_result_0;
        return v1, (v1:ConfigPathAsync());
    else
        warn("No FTFUtil:", l_result_0);
        return v1, v2;
    end;
end;