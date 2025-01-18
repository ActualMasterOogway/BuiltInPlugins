return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getUDim2OffsetFromScale ]]
    if v1 ~= nil and v1:IsA("GuiBase2d") then
        return UDim2.fromOffset(v0.X.Offset + v0.X.Scale * v1.AbsoluteSize.X, v0.Y.Offset + v0.Y.Scale * v1.AbsoluteSize.Y);
    else
        return UDim2.new();
    end;
end;