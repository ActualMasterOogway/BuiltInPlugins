local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        _draggerContext = v3, 
        _availableSoftSnaps = {}, 
        _currentSoftSnap = nil
    }, v2));
end;
v2.setSnaps = function(v4, v5) --[[ Line: 22 ]] --[[ Name: setSnaps ]]
    v4._availableSoftSnaps = v5;
end;
v2.clearSnaps = function(v6) --[[ Line: 26 ]] --[[ Name: clearSnaps ]]
    v6._availableSoftSnaps = {};
    v6._currentSoftSnap = nil;
end;
v2.updateCurrentSnap = function(v7, v8, v9) --[[ Line: 31 ]] --[[ Name: updateCurrentSnap ]]
    if #v7._availableSoftSnaps == 0 then
        return nil;
    else
        local v10 = nil;
        local v11 = 1e999;
        for _, v13 in v7._availableSoftSnaps do
            local v14 = math.abs(v13.Distance - v8);
            if v14 < v11 then
                v10 = v13;
                v11 = v14;
            end;
        end;
        local _ = nil;
        if (if v7._draggerContext:shouldGridSnap() then 0.5 * v7._draggerContext:getGridSize() else 0.4 * v7._draggerContext:getHandleScale(v10.Point)) * v7._draggerContext:getSoftSnapMarginFactor() < v11 then
            v7._currentSoftSnap = nil;
            return nil;
        else
            local v16 = math.abs(v10.Distance - v8);
            if not v9 or v16 < v9 + 0.01 then
                v7._currentSoftSnap = v10;
                return v10.Distance;
            else
                v7._currentSoftSnap = nil;
                return nil;
            end;
        end;
    end;
end;
v2.render = function(v17, v18) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local v19 = {};
    for v20, v21 in v17._availableSoftSnaps do
        local v22 = v17._draggerContext:getGridColor();
        local v23 = v17._draggerContext:getChosenColor();
        local v24 = v18 and v21 == v17._currentSoftSnap;
        local v25 = v17._draggerContext:getHandleScale(v21.Point);
        v19["SnapPoint" .. v20] = v1.createElement("SphereHandleAdornment", {
            AlwaysOnTop = true, 
            Color3 = if v24 then v23 else v22, 
            Radius = v25 * (v24 and 0.2 or 0.15), 
            CFrame = CFrame.new(v21.Point), 
            Adornee = workspace.Terrain, 
            ZIndex = 1
        });
    end;
    return v1.createFragment(v19);
end;
return v2;