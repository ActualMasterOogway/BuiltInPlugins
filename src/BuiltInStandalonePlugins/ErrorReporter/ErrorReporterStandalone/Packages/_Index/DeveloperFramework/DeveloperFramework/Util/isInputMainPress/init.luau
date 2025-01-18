return function(v0) --[[ Line: 4 ]] --[[ Name: isInputMainPress ]]
    local v1 = true;
    if v0.UserInputType ~= Enum.UserInputType.MouseButton1 then
        v1 = v0.UserInputType == Enum.UserInputType.Touch;
    end;
    return v1;
end;