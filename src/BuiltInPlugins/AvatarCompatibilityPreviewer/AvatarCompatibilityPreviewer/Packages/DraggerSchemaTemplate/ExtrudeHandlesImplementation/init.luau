local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.getBoundingBox = function(_, _, v4) --[[ Line: 20 ]] --[[ Name: getBoundingBox ]]
    return v4:getBoundingBox();
end;
v0.shouldScaleFromCenter = function(v5, _, _, _) --[[ Line: 27 ]] --[[ Name: shouldScaleFromCenter ]]
    return v5._draggerContext:isCtrlKeyDown();
end;
v0.axesToScale = function(_, _, _) --[[ Line: 36 ]] --[[ Name: axesToScale ]]
    return {
        X = true, 
        Y = true, 
        Z = true
    };
end;
v0.getMinMaxSizes = function(_) --[[ Line: 51 ]] --[[ Name: getMinMaxSizes ]]
    return Vector3.zero, Vector3.one * 1e999;
end;
v0.beginScale = function(v13, v14, v15, _) --[[ Line: 57 ]] --[[ Name: beginScale ]]
    local v17, v18, v19 = v13:getBoundingBox(v14, v15);
    v13._originalBoundingBoxCFrame = v17 * CFrame.new(v18);
    v13._originalBoundingBoxSize = v19;
end;
v0.updateScale = function(v20, v21, v22) --[[ Line: 67 ]] --[[ Name: updateScale ]]
    local _ = v20._originalBoundingBoxCFrame * CFrame.new(v22);
    local _ = (v20._originalBoundingBoxSize + v21) / v20._originalBoundingBoxSize;
    return v21, v22;
end;
v0.endScale = function(_) --[[ Line: 87 ]] --[[ Name: endScale ]]

end;
v0.getPriority = function(_) --[[ Line: 97 ]] --[[ Name: getPriority ]]
    return 0;
end;
v0.render = function(_, _, _) --[[ Line: 102 ]] --[[ Name: render ]]
    return nil;
end;
return v0;