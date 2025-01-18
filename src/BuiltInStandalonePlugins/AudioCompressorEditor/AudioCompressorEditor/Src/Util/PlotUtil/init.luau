local v0 = {
    getXMin = function() --[[ Line: 10 ]] --[[ Name: getXMin ]]
        return -80;
    end, 
    getXMax = function() --[[ Line: 14 ]] --[[ Name: getXMax ]]
        return 30;
    end, 
    getYMin = function() --[[ Line: 18 ]] --[[ Name: getYMin ]]
        return -80;
    end, 
    getYMax = function() --[[ Line: 22 ]] --[[ Name: getYMax ]]
        return 30;
    end
};
v0.plotToView = function(v1, v2) --[[ Line: 26 ]] --[[ Name: plotToView ]]
    -- upvalues: v0 (copy)
    local v3 = Vector2.one * math.min(v2.X, v2.Y);
    local v4 = v2 / 2;
    local v5 = Rect.new(v4 - v3 / 2, v4 + v3 / 2);
    local v6 = Vector2.new((v1.X - v0.getXMin()) / (v0.getXMax() - v0.getXMin()), 1 - (v1.Y - v0.getYMin()) / (v0.getYMax() - v0.getYMin()));
    v6 = Vector2.new(v5.Min.X + v6.X * (v5.Max.X - v5.Min.X), v5.Min.Y + v6.Y * (v5.Max.Y - v5.Min.Y));
    return (Vector2.new(v6.X / v2.X, v6.Y / v2.Y));
end;
v0.viewToPlot = function(v7, v8) --[[ Line: 44 ]] --[[ Name: viewToPlot ]]
    -- upvalues: v0 (copy)
    local v9 = Vector2.one * math.min(v8.X, v8.Y);
    local v10 = v8 / 2;
    local v11 = Rect.new(v10 - v9 / 2, v10 + v9 / 2);
    local v12 = Vector2.new(v7.X * v8.X, v7.Y * v8.Y);
    v12 = Vector2.new((v12.X - v11.Min.X) / (v11.Max.X - v11.Min.X), (v12.Y - v11.Min.Y) / (v11.Max.Y - v11.Min.Y));
    return (Vector2.new(v12.X * (v0.getXMax() - v0.getXMin()) + v0.getXMin(), (1 - v12.Y) * (v0.getYMax() - v0.getYMin()) + v0.getYMin()));
end;
v0.plotToAbs = function(v13, v14) --[[ Line: 62 ]] --[[ Name: plotToAbs ]]
    -- upvalues: v0 (copy)
    return v0.plotToView(v13, v14) * v14;
end;
v0.absToPlot = function(v15, v16) --[[ Line: 66 ]] --[[ Name: absToPlot ]]
    -- upvalues: v0 (copy)
    return v0.viewToPlot(v15 / v16, v16);
end;
v0.viewToAbs = function(v17, v18) --[[ Line: 70 ]] --[[ Name: viewToAbs ]]
    return v17 * v18;
end;
v0.absToView = function(v19, v20) --[[ Line: 74 ]] --[[ Name: absToView ]]
    return v19 / v20;
end;
v0.mouseToPlot = function(v21, v22) --[[ Line: 78 ]] --[[ Name: mouseToPlot ]]
    -- upvalues: v0 (copy)
    if not v22 then
        return Vector2.new(v0.getXMin(), v0.getYMin());
    else
        local l_AbsoluteSize_0 = v22.AbsoluteSize;
        local v24 = v21 - v22.AbsolutePosition;
        return v0.absToPlot(v24, l_AbsoluteSize_0);
    end;
end;
return v0;