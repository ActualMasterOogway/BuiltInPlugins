return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getVector2FromUDim2Scale ]]
    if v1 ~= nil and v1:IsA("GuiBase2d") then
        return Vector2.new(v0.X.Offset + v0.X.Scale * v1.AbsoluteSize.X, v0.Y.Offset + v0.Y.Scale * v1.AbsoluteSize.Y);
    else
        return Vector2.zero;
    end;
end;