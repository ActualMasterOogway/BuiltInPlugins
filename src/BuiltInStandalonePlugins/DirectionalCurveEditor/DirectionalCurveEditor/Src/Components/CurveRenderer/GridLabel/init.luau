local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_Parent_0.PlotRectUtil);
return function(v4) --[[ Line: 21 ]] --[[ Name: GridLabel ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3.plotToAbsolutePosition(v4.Position, v4.PlotRect, v4.PlotAbsoluteSize) + v4.OffsetDirection * 5;
    local v6 = UDim2.fromOffset(v5.X, v5.Y);
    local l_Center_0 = Enum.TextXAlignment.Center;
    if v4.OffsetDirection.X < -0.1 then
        l_Center_0 = Enum.TextXAlignment.Right;
    elseif v4.OffsetDirection.X > 0.1 then
        l_Center_0 = Enum.TextXAlignment.Left;
    end;
    local l_Center_1 = Enum.TextYAlignment.Center;
    if v4.OffsetDirection.Y < -0.1 then
        l_Center_1 = Enum.TextYAlignment.Bottom;
    elseif v4.OffsetDirection.Y > 0.1 then
        l_Center_1 = Enum.TextYAlignment.Top;
    end;
    return v2.createElement("TextLabel", {
        Position = v6, 
        Size = UDim2.fromOffset(0, 0), 
        Text = string.format(v4.FormatString, v4.Value), 
        TextXAlignment = l_Center_0, 
        TextYAlignment = l_Center_1, 
        [v2.Tag] = "GridLabel"
    });
end;