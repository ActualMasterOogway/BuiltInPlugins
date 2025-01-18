local v4 = {
    plotToViewPosition = function(v0, v1) --[[ Line: 21 ]] --[[ Name: plotToViewPosition ]]
        return Vector2.new((v0.X - v1.Min.X) / v1.Width, 1 - (v0.Y - v1.Min.Y) / v1.Height);
    end, 
    viewToPlotPosition = function(v2, v3) --[[ Line: 28 ]] --[[ Name: viewToPlotPosition ]]
        return Vector2.new(v3.Min.X + v3.Width * v2.X, v3.Min.Y + v3.Height * (1 - v2.Y));
    end
};
v4.plotToAbsolutePosition = function(v5, v6, v7) --[[ Line: 35 ]] --[[ Name: plotToAbsolutePosition ]]
    -- upvalues: v4 (copy)
    return v7 * v4.plotToViewPosition(v5, v6);
end;
v4.absoluteToPlotPosition = function(v8, v9, v10) --[[ Line: 39 ]] --[[ Name: absoluteToPlotPosition ]]
    -- upvalues: v4 (copy)
    return v4.viewToPlotPosition(v8 / v10, v9);
end;
v4.mouseCoordsToPlotPosition = function(v11, v12, v13) --[[ Line: 43 ]] --[[ Name: mouseCoordsToPlotPosition ]]
    -- upvalues: v4 (copy)
    if not v13 then
        return v12.Min;
    else
        local l_AbsoluteSize_0 = v13.AbsoluteSize;
        local v15 = v11 - v13.AbsolutePosition;
        return v4.absoluteToPlotPosition(v15, v12, l_AbsoluteSize_0);
    end;
end;
v4.rectContains = function(v16, v17, v18) --[[ Line: 54 ]] --[[ Name: rectContains ]]
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
v4.clampLineToRect = function(v20, v21, v22) --[[ Line: 62 ]] --[[ Name: clampLineToRect ]]
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
v4.plotToViewPolar = function(v30, v31) --[[ Line: 96 ]] --[[ Name: plotToViewPolar ]]
    -- upvalues: v4 (copy)
    return v4.plotToAbsolutePolar(v30, v31, Vector2.one);
end;
v4.plotToAbsolutePolar = function(v32, v33, v34) --[[ Line: 100 ]] --[[ Name: plotToAbsolutePolar ]]
    local v35 = v34 / 2;
    local v36 = math.min(v34.X, v34.Y) / 2;
    local v37 = v36 * 0.15;
    local v38 = v32.Y * (v36 - v37) + v37;
    return v35 + Vector2.new((v33 and 1 or -1) * math.sin(v32.X * 3.141592653589793 / 180), -math.cos(v32.X * 3.141592653589793 / 180)) * v38;
end;
v4.absoluteToPlotPolar = function(v39, v40) --[[ Line: 113 ]] --[[ Name: absoluteToPlotPolar ]]
    local v41 = v40 / 2;
    local v42 = math.min(v40.X, v40.Y) / 2;
    local v43 = v42 * 0.15;
    local v44 = math.atan2(-(v39 - v41).Y, (v39 - v41).X) * 180 / 3.141592653589793;
    v44 = if v44 > 0 then math.abs(v44 - 90) else 180 - math.abs(v44 + 90);
    local v45 = ((v39 - v41).Magnitude - v43) / (v42 - v43);
    return Vector2.new(v44, v45);
end;
v4.mouseToPlotPolar = function(v46, v47) --[[ Line: 131 ]] --[[ Name: mouseToPlotPolar ]]
    -- upvalues: v4 (copy)
    if not v47 then
        return Vector2.zero;
    else
        local l_AbsoluteSize_1 = v47.AbsoluteSize;
        local v49 = v46 - v47.AbsolutePosition;
        return v4.absoluteToPlotPolar(v49, l_AbsoluteSize_1);
    end;
end;
v4.toOffset = function(v50) --[[ Line: 142 ]] --[[ Name: toOffset ]]
    return Vector2.new(v50.X.Offset, v50.Y.Offset);
end;
v4.makeControlPoint = function(v51, v52, v53) --[[ Line: 146 ]] --[[ Name: makeControlPoint ]]
    if not v51 then
        return Path2DControlPoint.new();
    elseif not v52 or not v53 then
        return Path2DControlPoint.new(UDim2.fromOffset(v51.X, v51.Y));
    else
        return Path2DControlPoint.new(UDim2.fromOffset(v51.X, v51.Y), UDim2.fromOffset(v52.X, v52.Y), UDim2.fromOffset(v53.X, v53.Y));
    end;
end;
v4.makePolarCurve = function(v54, v55, v56) --[[ Line: 164 ]] --[[ Name: makePolarCurve ]]
    -- upvalues: v4 (copy)
    local v57 = {};
    local v58 = 0;
    local v59 = #v54;
    local v60 = 1;
    local v61 = v54[1];
    while v60 <= v59 do
        local v62 = v54[v60];
        local v63 = v4.plotToAbsolutePolar(v62, v55, v56);
        if v60 == 1 then
            table.insert(v57, v4.makeControlPoint(v63));
            v58 = v58 + 1;
            v60 = v60 + 1;
            v61 = v62;
        else
            local l_v61_0 = v61;
            if l_v61_0.X == v62.X then
                table.insert(v57, v4.makeControlPoint(v63));
                v58 = v58 + 1;
                v60 = v60 + 1;
                v61 = v62;
            else
                local v65 = false;
                while v62.X > l_v61_0.X + 90 do
                    v65 = true;
                    v62 = (l_v61_0 + v62) / 2;
                    v63 = v4.plotToAbsolutePolar(v62, v55, v56);
                end;
                local v66 = v4.plotToAbsolutePolar(l_v61_0, v55, v56);
                local v67 = v56 / 2;
                local v68 = v66 - v67;
                local v69 = v63 - v67;
                local l_Unit_0 = (v4.plotToAbsolutePolar(l_v61_0 + (v62 - l_v61_0) * 0.001, v55, v56) - v66).Unit;
                local l_Unit_1 = (v4.plotToAbsolutePolar(v62 + (v62 - l_v61_0) * 0.001, v55, v56) - v63).Unit;
                local v72 = l_Unit_0 * v68.Magnitude * 1.3333333333333333 * math.tan(3.141592653589793 / (2 * (360 / math.abs(l_v61_0.X - v62.X))));
                local v73 = l_Unit_1 * v69.Magnitude * 1.3333333333333333 * math.tan(3.141592653589793 / (2 * (360 / math.abs(l_v61_0.X - v62.X))));
                v57[v58] = v4.makeControlPoint(v66, v4.toOffset(v57[v58].LeftTangent), v72);
                table.insert(v57, v4.makeControlPoint(v63, -v73, v73));
                v58 = v58 + 1;
                if not v65 then
                    v60 = v60 + 1;
                end;
                v61 = v62;
            end;
        end;
    end;
    return v57;
end;
return v4;