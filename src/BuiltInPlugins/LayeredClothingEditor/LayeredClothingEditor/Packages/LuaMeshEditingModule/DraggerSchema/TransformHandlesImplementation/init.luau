local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0._resetAxisAngleData = function(v2) --[[ Line: 10 ]] --[[ Name: _resetAxisAngleData ]]
    v2._totalAngle = 0;
    v2._previousAngle = nil;
    v2._axis = nil;
    v2._previousAxis = nil;
    v2._sign = 1;
end;
v0._updateAxisAngleData = function(v3, v4) --[[ Line: 22 ]] --[[ Name: _updateAxisAngleData ]]
    local v5, v6 = v4:ToAxisAngle();
    if v6 ~= 0 and not v3._axis then
        v3._axis = v5;
    end;
    if v3._previousAngle then
        local v7 = false;
        if v3._previousAxis and v3._previousAxis:Dot(v5) >= 0 then
            v7 = true;
        end;
        v3._sign = v3._axis:Dot(v5) >= 0 and -1 or 1;
        if v7 then
            if math.deg(v6) >= 90 then
                v3._totalAngle = v3._totalAngle - v3._sign * (6.283185307179586 - v3._previousAngle - v6);
            else
                v3._totalAngle = v3._totalAngle + v3._sign * (v3._previousAngle + v6);
            end;
        else
            v3._totalAngle = v3._totalAngle + v3._sign * (v6 - v3._previousAngle);
        end;
    else
        v3.totalAngle = v6;
    end;
    if v3._axis then
        v3._previousAngle = v6;
        v3._previousAxis = v5;
    end;
end;
v0.beginDrag = function(v8, _, v10) --[[ Line: 61 ]] --[[ Name: beginDrag ]]
    local v11, v12 = v10:getBoundingBox();
    v8._baseBoundingBoxCenter = v11.p + v12;
    v8._vertexEditingTool = v8._draggerContext.vertexEditingTool;
    v8:_resetAxisAngleData();
end;
v0.updateDrag = function(v13, v14) --[[ Line: 75 ]] --[[ Name: updateDrag ]]
    v13:_updateAxisAngleData(v14);
    v13._vertexEditingTool:transformSelected(v14, v13._baseBoundingBoxCenter, v13._axis, v13._totalAngle);
    return v14;
end;
v0.endDrag = function(v15) --[[ Line: 90 ]] --[[ Name: endDrag ]]
    v15._vertexEditingTool:addWaypoint();
    v15._vertexEditingTool = nil;
    v15._baseBoundingBoxCenter = nil;
    v15:_resetAxisAngleData();
end;
v0.render = function(_, _) --[[ Line: 102 ]] --[[ Name: render ]]
    return nil;
end;
return v0;