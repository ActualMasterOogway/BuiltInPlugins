return function(v0, v1) --[[ Line: 1 ]] --[[ Name: isRefClicked ]]
    local l_current_0 = v0.current;
    if l_current_0 == nil or v1.UserInputType ~= Enum.UserInputType.MouseButton1 and v1.UserInputType ~= Enum.UserInputType.Touch then
        return false;
    else
        local l_Position_0 = v1.Position;
        local l_X_0 = l_current_0.AbsolutePosition.X;
        local l_Y_0 = l_current_0.AbsolutePosition.Y;
        local v6 = l_current_0.AbsoluteSize.X + l_X_0;
        local v7 = l_current_0.AbsoluteSize.Y + l_Y_0;
        local v8 = false;
        if l_X_0 <= l_Position_0.X then
            v8 = false;
            if l_Position_0.X <= v6 then
                v8 = false;
                if l_Y_0 <= l_Position_0.Y then
                    v8 = l_Position_0.Y <= v7;
                end;
            end;
        end;
        return v8;
    end;
end;