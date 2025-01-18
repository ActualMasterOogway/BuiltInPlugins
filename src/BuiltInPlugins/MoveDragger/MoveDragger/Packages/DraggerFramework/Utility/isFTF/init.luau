local l_script_FirstAncestorWhichIsA_0 = script:FindFirstAncestorWhichIsA("Plugin");
assert(l_script_FirstAncestorWhichIsA_0:isA("Plugin"));
local l_status_0, _ = pcall(function() --[[ Line: 7 ]]
    -- upvalues: l_script_FirstAncestorWhichIsA_0 (copy)
    return l_script_FirstAncestorWhichIsA_0:GetPluginComponent("FTFUtil");
end);
return function() --[[ Line: 11 ]]
    -- upvalues: l_status_0 (copy)
    return l_status_0;
end;