local _ = script.Parent.Parent.Parent;
return function(v1, v2) --[[ Line: 3 ]]
    if v2 ~= nil and v2:IsA("GuiBase2d") then
        local l_AbsoluteSize_0 = v2.AbsoluteSize;
        local v4 = if l_AbsoluteSize_0.X ~= 0 then v1.X.Scale + v1.X.Offset / l_AbsoluteSize_0.X else 0;
        local v5 = if l_AbsoluteSize_0.Y ~= 0 then v1.Y.Scale + v1.Y.Offset / l_AbsoluteSize_0.Y else 0;
        return UDim2.fromScale(v4, v5);
    else
        return UDim2.new();
    end;
end;