local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.getBoundingBox = function(_, _, v4) --[[ Line: 10 ]] --[[ Name: getBoundingBox ]]
    return v4:getBoundingBox();
end;
v0.shouldScaleFromCenter = function(_, _, _, _) --[[ Line: 16 ]] --[[ Name: shouldScaleFromCenter ]]
    return true;
end;
v0.axesToScale = function(v9, _, v11) --[[ Line: 21 ]] --[[ Name: axesToScale ]]
    if v9._draggerContext:isShiftKeyDown() then
        return {
            X = true, 
            Y = true, 
            Z = true
        };
    else
        return ({
            {
                X = true
            }, 
            {
                Y = true
            }, 
            {
                Z = true
            }
        })[v11];
    end;
end;
v0.beginScale = function(v12, _, v14, _) --[[ Line: 29 ]] --[[ Name: beginScale ]]
    local v16, v17, v18 = v14:getBoundingBox();
    v12._baseBoundingBoxSize = v18;
    v12._baseBoundingBox = v16 + v17;
    v12._vertexEditingTool = v12._draggerContext.vertexEditingTool;
end;
v0.getMinMaxSizes = function(_, _, _, _) --[[ Line: 36 ]] --[[ Name: getMinMaxSizes ]]
    return Vector3.zero, Vector3.one * 1e999;
end;
v0.updateScale = function(v23, v24, v25) --[[ Line: 40 ]] --[[ Name: updateScale ]]
    assert(v25 == Vector3.new(0, 0, 0, 0), "localOffset should be (0,0,0).");
    assert(v23:shouldScaleFromCenter(), "shouldScaleFromCenter should always return true.");
    local v26 = v23._baseBoundingBoxSize + v24;
    local v27 = Vector3.new(if v23._baseBoundingBoxSize.X ~= 0 then v26.X / v23._baseBoundingBoxSize.X else v26.X, if v23._baseBoundingBoxSize.Y ~= 0 then v26.Y / v23._baseBoundingBoxSize.Y else v26.Y, if v23._baseBoundingBoxSize.Z ~= 0 then v26.Z / v23._baseBoundingBoxSize.Z else v26.Z);
    v23._vertexEditingTool:scaleSelected(v23._baseBoundingBox, v27);
    return v24, v25;
end;
v0.endScale = function(v28) --[[ Line: 54 ]] --[[ Name: endScale ]]
    v28._baseBoundingBoxSize = nil;
    v28._baseBoundingBox = nil;
    v28._vertexEditingTool:addWaypoint();
end;
v0.render = function(_, _, _) --[[ Line: 61 ]] --[[ Name: render ]]
    return nil;
end;
return v0;