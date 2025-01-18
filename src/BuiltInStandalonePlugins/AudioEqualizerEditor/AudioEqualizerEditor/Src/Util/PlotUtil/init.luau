local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = {};
local v3 = 200;
local v4 = 20000;
local v5 = -80;
local v6 = 10;
local v7 = 3;
v2.log2 = function(v8) --[[ Line: 15 ]] --[[ Name: log2 ]]
    return math.log(v8) * 1.44269504089;
end;
v2.setInstanceType = function(v9) --[[ Line: 19 ]] --[[ Name: setInstanceType ]]
    -- upvalues: v1 (copy), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref)
    if v9 == v1.EQUALIZER then
        v3 = 200;
        v4 = 20000;
        v5 = -80;
        v6 = 10;
        v7 = 3;
        return;
    elseif v9 == v1.FILTER then
        v3 = 20;
        v4 = 22000;
        v5 = -30;
        v6 = 30;
        v7 = 1;
        return;
    else
        assert(false);
        return;
    end;
end;
v2.getXMin = function() --[[ Line: 37 ]] --[[ Name: getXMin ]]
    -- upvalues: v3 (ref)
    return v3;
end;
v2.getXMax = function() --[[ Line: 41 ]] --[[ Name: getXMax ]]
    -- upvalues: v4 (ref)
    return v4;
end;
v2.getYMin = function() --[[ Line: 45 ]] --[[ Name: getYMin ]]
    -- upvalues: v5 (ref)
    return v5;
end;
v2.getYMax = function() --[[ Line: 49 ]] --[[ Name: getYMax ]]
    -- upvalues: v6 (ref)
    return v6;
end;
v2.plotToView = function(v10) --[[ Line: 53 ]] --[[ Name: plotToView ]]
    -- upvalues: v2 (copy), v7 (ref)
    local v11 = v2.log2(v2.getXMin());
    local v12 = v2.log2(v2.getXMax());
    local v13 = (v2.log2(v10.X) - v11) / (v12 - v11);
    local _ = (v2.log2(v10.X) - v2.log2(v2.getXMin())) / (v2.log2(v2.getXMax()) - v2.log2(v2.getXMin()));
    local v15 = 1 - ((math.clamp(v10.Y, v2.getYMin(), v2.getYMax()) - v2.getYMin()) / (v2.getYMax() - v2.getYMin())) ^ v7;
    return Vector2.new(v13, v15);
end;
v2.viewToPlot = function(v16) --[[ Line: 69 ]] --[[ Name: viewToPlot ]]
    -- upvalues: v2 (copy), v7 (ref)
    local _ = v2.log2(v2.getXMin());
    local _ = v2.log2(v2.getXMax());
    local v19 = 2 ^ (v16.X * v2.log2(v2.getXMax()) + (1 - v16.X) * v2.log2(v2.getXMin()));
    local v20 = math.clamp(1 - v16.Y, 0, 1) ^ (1 / v7) * (v2.getYMax() - v2.getYMin()) + v2.getYMin();
    return Vector2.new(v19, v20);
end;
v2.plotToAbs = function(v21, v22) --[[ Line: 83 ]] --[[ Name: plotToAbs ]]
    -- upvalues: v2 (copy)
    return v2.plotToView(v21) * v22;
end;
v2.absToPlot = function(v23, v24) --[[ Line: 87 ]] --[[ Name: absToPlot ]]
    -- upvalues: v2 (copy)
    return v2.viewToPlot(v23 / v24);
end;
v2.viewToAbs = function(v25, v26) --[[ Line: 91 ]] --[[ Name: viewToAbs ]]
    return v25 * v26;
end;
v2.absToView = function(v27, v28) --[[ Line: 95 ]] --[[ Name: absToView ]]
    return v27 / v28;
end;
v2.mouseToPlot = function(v29, v30) --[[ Line: 99 ]] --[[ Name: mouseToPlot ]]
    -- upvalues: v2 (copy)
    if not v30 then
        return Vector2.new(v2.getXMin(), v2.getYMin());
    else
        local l_AbsoluteSize_0 = v30.AbsoluteSize;
        local v32 = v29 - v30.AbsolutePosition;
        return v2.absToPlot(v32, l_AbsoluteSize_0);
    end;
end;
return v2;