return function(v0) --[[ Line: 1 ]] --[[ Name: findTopLevelGui ]]
    local l_v0_0 = v0;
    while true do
        if l_v0_0 ~= nil then
            if l_v0_0:IsA("ScreenGui") or l_v0_0:IsA("SurfaceGui") then
                return l_v0_0;
            else
                l_v0_0 = l_v0_0.Parent;
            end;
        else
            return nil;
        end;
    end;
end;