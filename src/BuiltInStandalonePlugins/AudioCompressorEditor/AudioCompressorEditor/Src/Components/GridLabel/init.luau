local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local v4 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v5) --[[ Line: 22 ]] --[[ Name: GridLabel ]]
    -- upvalues: l_useMemo_0 (copy), v4 (copy), v2 (copy), l_joinTags_0 (copy)
    local v8 = l_useMemo_0(function() --[[ Line: 23 ]]
        -- upvalues: v4 (ref), v5 (copy)
        local v6 = v4.plotToAbs(v5.Position, v5.PlotAbsoluteSize);
        local v7 = 2 * v5.Offset * (Vector2.new(0.5, 0.5) - v5.AnchorPoint);
        return (UDim2.fromOffset(v6.X + v7.X, v6.Y + v7.Y));
    end, {
        v5.Position, 
        v5.AnchorPoint, 
        v5.Offset, 
        v5.PlotAbsoluteSize
    });
    local v9 = l_useMemo_0(function() --[[ Line: 30 ]]
        -- upvalues: v5 (copy)
        if v5.AnchorPoint.X <= 0.4 then
            return Enum.TextXAlignment.Left;
        elseif v5.AnchorPoint.X >= 0.6 then
            return Enum.TextXAlignment.Right;
        else
            return Enum.TextXAlignment.Center;
        end;
    end, {
        v5.AnchorPoint
    });
    local v10 = l_useMemo_0(function() --[[ Line: 40 ]]
        -- upvalues: v5 (copy)
        if v5.AnchorPoint.Y <= 0.4 then
            return Enum.TextYAlignment.Top;
        elseif v5.AnchorPoint.Y >= 0.6 then
            return Enum.TextYAlignment.Bottom;
        else
            return Enum.TextYAlignment.Center;
        end;
    end, {
        v5.AnchorPoint
    });
    return v2.createElement("TextLabel", {
        AnchorPoint = v5.AnchorPoint, 
        Position = v8, 
        Size = UDim2.fromOffset(10, 10), 
        Text = v5.Label, 
        TextXAlignment = v9, 
        TextYAlignment = v10, 
        [v2.Tag] = l_joinTags_0("GridLabel", v5.Tag)
    });
end;