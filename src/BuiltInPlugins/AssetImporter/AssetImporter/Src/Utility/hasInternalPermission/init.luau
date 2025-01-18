local l_status_0, l_result_0 = pcall(function() --[[ Line: 2 ]]
    return game:GetService("StudioService"):HasInternalPermission();
end);
local v2 = l_status_0 and l_result_0;
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    return v2;
end;