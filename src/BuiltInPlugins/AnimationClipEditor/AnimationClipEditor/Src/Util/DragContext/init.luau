local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7, v8, v9) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v4 (copy), v5 (copy)
    v6 = v1.Dictionary.join({}, v6);
    v6.Instances = v1.Dictionary.join({}, v6.Instances);
    for v10, v11 in pairs(v7) do
        v6.Instances[v10] = v1.Dictionary.join({}, v6.Instances[v10]);
        v6.Instances[v10].Tracks = v1.Dictionary.join({}, v6.Instances[v10].Tracks);
        local v12 = v6.Instances[v10];
        for v13, _ in pairs(v11) do
            v12.Tracks[v13] = v3(v12.Tracks[v13]);
        end;
    end;
    v7 = v3(v7);
    local v15, v16 = v2.getSelectionBounds(v6, v7);
    local v17 = {
        animationData = v6, 
        selectedKeyframes = v7, 
        pivotTick = v8, 
        newTick = v8, 
        pivotValue = v9, 
        newValue = v9, 
        scale = 1, 
        earliestTick = v15, 
        latestTick = v16, 
        dragMode = v4.DRAG_MODE.Keyframe
    };
    setmetatable(v17, v5);
    return v17;
end;
v5.newTangentContext = function(v18, v19, v20, v21, v22) --[[ Line: 55 ]] --[[ Name: newTangentContext ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy)
    local v23 = v2.getTrack(v18, v19, v20);
    if not v23 then
        return nil;
    else
        local v24 = v23.Data[v21];
        if not v24 then
            return nil;
        else
            local v25 = {
                instance = v19, 
                path = v20, 
                tck = v21, 
                value = v24.Value, 
                side = v22, 
                dragMode = v4.DRAG_MODE.Tangent, 
                trackType = v23.Type
            };
            setmetatable(v25, v5);
            return v25;
        end;
    end;
end;
v5.moveKeyframes = function(v26, v27, v28) --[[ Line: 82 ]] --[[ Name: moveKeyframes ]]
    v26.newTick = v27;
    v26.newValue = v28;
end;
v5.scaleKeyframes = function(v29, v30) --[[ Line: 88 ]] --[[ Name: scaleKeyframes ]]
    v29.newTick = v30;
    local l_pivotTick_0 = v29.pivotTick;
    v29.scale = (l_pivotTick_0 == v29.latestTick and l_pivotTick_0 - v30 or v30 - l_pivotTick_0) / (v29.latestTick - v29.earliestTick);
end;
v5.newEvents = function(v32, v33, v34, v35) --[[ Line: 96 ]] --[[ Name: newEvents ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy)
    v32 = v1.Dictionary.join({}, v32);
    v32.Events = v3(v32.Events);
    v33 = v3(v33);
    local v36 = {
        pivotTick = v35, 
        newTick = v35, 
        animationData = v32, 
        eventFilters = v34, 
        selectedEvents = v33
    };
    setmetatable(v36, v5);
    return v36;
end;
v5.moveEvents = function(v37, v38) --[[ Line: 116 ]] --[[ Name: moveEvents ]]
    v37.newTick = v38;
end;
return v5;