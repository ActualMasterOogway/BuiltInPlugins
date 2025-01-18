local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 24 ]] --[[ Name: useSizeCalculator ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(nil);
    local v5, v6 = v1.useState(function() --[[ Line: 26 ]]
        -- upvalues: v3 (copy)
        if v3 then
            return v3.AbsoluteSize;
        else
            return Vector2.zero;
        end;
    end);
    local v8 = v1.useCallback(function(v7) --[[ Line: 35 ]]
        -- upvalues: v4 (copy)
        v4(v7);
    end, {});
    v1.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v3 (copy), v6 (copy)
        local l_v3_0 = v3;
        if l_v3_0 == nil then
            v6(Vector2.zero);
            return nil;
        else
            local v10 = l_v3_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 46 ]]
                -- upvalues: v6 (ref), l_v3_0 (copy)
                v6(l_v3_0.AbsoluteSize);
            end);
            v6(l_v3_0.AbsoluteSize);
            return function() --[[ Line: 52 ]]
                -- upvalues: v10 (copy)
                v10:Disconnect();
            end;
        end;
    end, {
        v3
    });
    if v3 then
        v5 = v3.AbsoluteSize;
    end;
    local v11 = Vector2.new(v2.Width, v2.HeaderHeight) + v2.Padding;
    local v12 = v2.MaxHeight - v2.HeaderHeight - v2.InnerPadding - v2.Padding.Y;
    local v13 = math.clamp(v5.Y, 0, v12);
    local v14 = UDim2.new(1, 0, 0, v13);
    if v13 > 0 then
        v11 = v11 + Vector2.new(0, v13 + v2.InnerPadding);
    end;
    local l_freeze_0 = table.freeze;
    local v16 = {};
    local v17 = false;
    if v3 ~= nil then
        v17 = v5.Y > 0;
    end;
    v16.loaded = v17;
    v16.contentFrameRef = v8;
    v16.size = v11;
    v16.scrollingFrameSize = v14;
    return l_freeze_0(v16);
end;