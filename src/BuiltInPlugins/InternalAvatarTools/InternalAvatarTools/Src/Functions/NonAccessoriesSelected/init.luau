local l_Selection_0 = game:GetService("Selection");
return function() --[[ Line: 3 ]]
    -- upvalues: l_Selection_0 (copy)
    local v1 = l_Selection_0:Get();
    if not v1 then
        return false;
    else
        for _, v3 in ipairs(v1) do
            if not v3:IsA("Accessory") then
                return true;
            end;
        end;
        return false;
    end;
end;