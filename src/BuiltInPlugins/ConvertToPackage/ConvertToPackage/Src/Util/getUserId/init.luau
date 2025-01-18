local l_StudioService_0 = game:GetService("StudioService");
return function() --[[ Line: 4 ]]
    -- upvalues: l_StudioService_0 (copy)
    local v1 = 0;
    pcall(function() --[[ Line: 6 ]]
        -- upvalues: v1 (ref), l_StudioService_0 (ref)
        v1 = l_StudioService_0:GetUserId();
    end);
    return v1;
end;