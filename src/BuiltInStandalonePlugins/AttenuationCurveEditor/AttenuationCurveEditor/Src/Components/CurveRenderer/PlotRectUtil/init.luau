local v4 = {
    plotToViewPosition = function(v0, v1) --[[ Line: 20 ]] --[[ Name: plotToViewPosition ]]
        return Vector2.new((v0.X - v1.Min.X) / v1.Width, 1 - (v0.Y - v1.Min.Y) / v1.Height);
    end, 
    viewToPlotPosition = function(v2, v3) --[[ Line: 27 ]] --[[ Name: viewToPlotPosition ]]
        return Vector2.new(v3.Min.X + v3.Width * v2.X, v3.Min.Y + v3.Height * (1 - v2.Y));
    end
};
v4.plotToAbsolutePosition = function(v5, v6, v7) --[[ Line: 34 ]] --[[ Name: plotToAbsolutePosition ]]
    -- upvalues: v4 (copy)
    return v7 * v4.plotToViewPosition(v5, v6);
end;
v4.absoluteToPlotPosition = function(v8, v9, v10) --[[ Line: 38 ]] --[[ Name: absoluteToPlotPosition ]]
    -- upvalues: v4 (copy)
    return v4.viewToPlotPosition(v8 / v10, v9);
end;
v4.mouseCoordsToPlotPosition = function(v11, v12, v13) --[[ Line: 42 ]] --[[ Name: mouseCoordsToPlotPosition ]]
    -- upvalues: v4 (copy)
    if not v13 then
        return v12.Min;
    else
        local l_AbsoluteSize_0 = v13.AbsoluteSize;
        local v15 = v11 - v13.AbsolutePosition;
        return v4.absoluteToPlotPosition(v15, v12, l_AbsoluteSize_0);
    end;
end;
v4.rectContains = function(v16, v17, v18) --[[ Line: 53 ]] --[[ Name: rectContains ]]
    v18 = v18 or 0.001;
    local v19 = false;
    if v16.X >= v17.Min.X - v18 then
        v19 = false;
        if v16.X <= v17.Max.X + v18 then
            v19 = false;
            if v16.Y >= v17.Min.Y - v18 then
                v19 = v16.Y <= v17.Max.Y + v18;
            end;
        end;
    end;
    return v19;
end;
v4.clampLineToRect = function(v20, v21, v22) --[[ Line: 61 ]] --[[ Name: clampLineToRect ]]
    -- upvalues: v4 (copy)
    local v23 = Vector2.new(math.min(v20.X, v21.X), (math.min(v20.Y, v21.Y)));
    local v24 = Vector2.new(math.max(v20.X, v21.X), (math.max(v20.Y, v21.Y)));
    if v4.rectContains(v20, v22, 0.001) and v4.rectContains(v21, v22, 0.001) then
        return {
            v20, 
            v21
        };
    elseif v24.X < v22.Min.X or v24.Y < v22.Min.Y or v23.X > v22.Max.X or v23.Y > v22.Max.Y then
        return nil;
    else
        local v25 = v21 - v20;
        local v26 = Vector2.new(0, 0);
        local v27 = Vector2.new(1, 1);
        if v25.X ~= 0 then
            v26 = Vector2.new((v22.Min.X - v20.X) / v25.X, v26.Y);
            v27 = Vector2.new((v22.Max.X - v20.X) / v25.X, v27.Y);
        end;
        if v25.Y ~= 0 then
            v26 = Vector2.new(v26.X, (v22.Min.Y - v20.Y) / v25.Y);
            v27 = Vector2.new(v27.X, (v22.Max.Y - v20.Y) / v25.Y);
        end;
        local v28 = math.max(0, math.min(v26.X, v27.X), (math.min(v26.Y, v27.Y)));
        local v29 = math.min(1, math.max(v26.X, v27.X), (math.max(v26.Y, v27.Y)));
        if v29 <= v28 then
            return nil;
        else
            return {
                v20:Lerp(v21, v28), 
                v20:Lerp(v21, v29)
            };
        end;
    end;
end;
return v4;