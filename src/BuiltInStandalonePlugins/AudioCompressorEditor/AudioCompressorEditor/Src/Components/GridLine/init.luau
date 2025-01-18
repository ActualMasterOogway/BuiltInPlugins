local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v3.useMemo;
local v5 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v6) --[[ Line: 31 ]] --[[ Name: GridLine ]]
    -- upvalues: l_useMemo_0 (copy), v5 (copy), v3 (copy), l_join_0 (copy), l_joinTags_0 (copy)
    local v9 = l_useMemo_0(function() --[[ Line: 32 ]]
        -- upvalues: v6 (copy), v5 (ref)
        local v7 = Vector2.new(0, 0);
        local v8 = Vector2.new(0, 0);
        if v6.Orientation == "Vertical" then
            v7 = Vector2.new(v6.Position, v5.getYMin());
            v8 = Vector2.new(v6.Position, v5.getYMax());
        elseif v6.Orientation == "Horizontal" then
            v7 = Vector2.new(v5.getXMin(), v6.Position);
            v8 = Vector2.new(v5.getXMax(), v6.Position);
        end;
        return {
            v5.plotToAbs(v7, v6.PlotAbsoluteSize), 
            (v5.plotToAbs(v8, v6.PlotAbsoluteSize))
        };
    end, {
        v6.Position, 
        v6.Orientation, 
        v6.PlotAbsoluteSize
    });
    local v11 = l_useMemo_0(function() --[[ Line: 50 ]]
        -- upvalues: v9 (copy)
        local v10 = (v9[1] + v9[2]) / 2;
        return UDim2.fromOffset(v10.X, v10.Y);
    end, {
        v9
    });
    local v14 = l_useMemo_0(function() --[[ Line: 55 ]]
        -- upvalues: v9 (copy), v6 (copy)
        local l_Magnitude_0 = (v9[2] - v9[1]).Magnitude;
        local v13 = UDim2.fromOffset(0, 0);
        if v6.Orientation == "Vertical" then
            return (UDim2.fromOffset(v6.Thickness, l_Magnitude_0));
        else
            if v6.Orientation == "Horizontal" then
                v13 = UDim2.fromOffset(l_Magnitude_0, v6.Thickness);
            end;
            return v13;
        end;
    end, {
        v9
    });
    return v3.createElement("Frame", l_join_0(v6.Props, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v11, 
        Size = v14, 
        BackgroundTransparency = 1 - if v6.Alpha ~= nil then v6.Alpha else 1, 
        [v3.Tag] = l_joinTags_0("GridLine", v6.Tag)
    }), v6.Children);
end;