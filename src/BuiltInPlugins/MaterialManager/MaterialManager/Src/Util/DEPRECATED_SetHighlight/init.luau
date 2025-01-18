local l_CoreGui_0 = game:GetService("CoreGui");
return function(v1, v2) --[[ Line: 4 ]]
    -- upvalues: l_CoreGui_0 (copy)
    if not v1 then
        v1 = Instance.new("Highlight");
        v1.Parent = l_CoreGui_0;
        v1.FillTransparency = 1;
    end;
    if v2 and v2:IsA("BasePart") then
        v1.Adornee = v2;
        return v1;
    else
        v1.Adornee = nil;
        return v1;
    end;
end;