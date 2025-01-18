local v0 = nil;
return function() --[[ Line: 5 ]] --[[ Name: hasInternalPermission ]]
    -- upvalues: v0 (ref)
    if v0 ~= nil then
        return v0;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
            return game:GetService("StudioService"):HasInternalPermission();
        end);
        v0 = l_status_0 and l_result_0;
        return v0;
    end;
end;