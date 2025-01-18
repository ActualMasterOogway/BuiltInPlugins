local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utility.CursorGroupName);
local v2 = require(l_Parent_0.Utility.DragHelper);
local v3 = require(l_Parent_0.Flags.getFFlagDraggerExternalHover);
local v4 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local function v11(v5, v6) --[[ Line: 11 ]] --[[ Name: DEPRECATED_findAllPartsOnRay ]]
    -- upvalues: v3 (copy), v1 (copy)
    assert(not v3(), "Remove with FFlagDraggerExternalHover");
    local v7 = {};
    local v8 = RaycastParams.new();
    v8.FilterType = Enum.RaycastFilterType.Blacklist;
    v8.FilterDescendantsInstances = v7;
    v8.BruteForceAllSlow = true;
    v8.CollisionGroup = v1;
    repeat
        local v9 = workspace:Raycast(v5.Origin, v5.Direction, v8);
        local v10 = v6:gizmoRaycast(v5.Origin, v5.Direction, v8);
        if v10 and (not v9 or v10.Distance < v9.Distance) then
            v9 = v10;
        end;
        if v9 then
            table.insert(v7, v9.Instance);
            v8.FilterDescendantsInstances = v7;
        end;
    until not v9;
    return v7;
end;
local function v18(v12, v13) --[[ Line: 33 ]] --[[ Name: DEPRECATED_findAllHitsOnRay ]]
    -- upvalues: v3 (copy), v1 (copy)
    assert(v3(), "New method under flag");
    local v14 = {};
    local v15 = RaycastParams.new();
    v15.FilterType = Enum.RaycastFilterType.Blacklist;
    v15.FilterDescendantsInstances = v14;
    v15.BruteForceAllSlow = true;
    v15.CollisionGroup = v1;
    repeat
        local v16 = workspace:Raycast(v12.Origin, v12.Direction, v15);
        local v17 = v13:gizmoRaycast(v12.Origin, v12.Direction, v15);
        if v17 and (v13:shouldDrawConstraintsOnTop() or not v16 or v17.Distance < v16.Distance) then
            v16 = v17;
        end;
        if v16 then
            table.insert(v14, v16);
            v15:AddToFilter(v16.Instance);
        end;
    until not v16;
    return v14;
end;
local function v26(v19, v20) --[[ Line: 58 ]] --[[ Name: getAllSelectables ]]
    -- upvalues: v3 (copy)
    assert(not v3(), "Remove with FFlagDraggerExternalHover");
    local v21 = {};
    local v22 = {};
    for _, v24 in ipairs(v19) do
        local v25 = v20.getSelectableWithCache(v24, true, v22);
        if v25 and not v24:IsA("Texture") and not v24:IsA("Decal") then
            table.insert(v21, v25);
        end;
    end;
    return v21;
end;
local function v35(v27, v28) --[[ Line: 73 ]] --[[ Name: filterHits ]]
    -- upvalues: v3 (copy)
    assert(v3(), "New method under flag");
    local v29 = table.create(#v27);
    local v30 = table.create(#v27);
    local v31 = {};
    for _, v33 in v27 do
        local v34 = v28.getSelectableWithCache(v33.Instance, true, v31);
        if v34 then
            table.insert(v29, v33);
            table.insert(v30, v34);
        end;
    end;
    return v29, v30;
end;
local v36 = {};
v36.__index = v36;
v36.new = function(v37, v38) --[[ Line: 93 ]] --[[ Name: new ]]
    -- upvalues: v36 (copy)
    return (setmetatable({
        _draggerContext = v37, 
        _draggerSchema = v38, 
        _cachedRaycastResults = {}, 
        _cachedSelectables = {}, 
        _currentIndex = 0, 
        _analyticsNumberOfClicks = 0, 
        _hasCycled = false
    }, v36));
end;
v36.size = function(v39) --[[ Line: 105 ]] --[[ Name: size ]]
    return #v39._cachedSelectables;
end;
v36.getNextSelectable = function(v40, v41) --[[ Line: 109 ]] --[[ Name: getNextSelectable ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    if v3() and not v40:isValid() then
        v40:computeSelectionCycleCandidates();
    end;
    if v40._currentIndex == 0 then
        return nil;
    else
        local v42 = v40._cachedSelectables[v40._currentIndex];
        local v43 = if v3() then v40._cachedRaycastResults[v40._currentIndex] else nil;
        if v41 then
            if v40._currentIndex == #v40._cachedSelectables then
                v40._currentIndex = 1;
            else
                v40._currentIndex = v40._currentIndex + 1;
            end;
            v40._analyticsNumberOfClicks = v40._analyticsNumberOfClicks + 1;
            if v3() then
                v40._hasCycled = true;
            end;
        end;
        if v3() then
            local l__draggerContext_0 = v40._draggerContext;
            local v45 = if l__draggerContext_0:shouldGridSnap() then l__draggerContext_0:getGridSize() else nil;
            local v46 = nil;
            local v47 = nil;
            if v43.Instance:IsA("PVInstance") then
                if v4() then
                    local v48 = v2.getSurfaceMatrix(v40._draggerContext:getMouseRay(), v43, nil, v45);
                    if v48 then
                        v46 = v48.matrix;
                        v47 = v48.size;
                        l__draggerContext_0.PreviousTargetMatrix = v46;
                    end;
                else
                    local v49 = nil;
                    local v50 = nil;
                    local v51, v52, v53 = v2.getSurfaceMatrix(v40._draggerContext:getMouseRay(), {}, nil);
                    v46 = v51;
                    v49 = v52;
                    v50 = v53;
                    v47 = Vector3.zero;
                    l__draggerContext_0.PreviousTargetMatrix = v46;
                end;
            else
                v46 = CFrame.new(v43.Position);
                v47 = Vector3.zero;
            end;
            return v42, v43.Instance, v43.Distance, table.freeze({
                RaycastResult = v43, 
                TargetMatrix = v46, 
                TargetSize = v47, 
                IsPivot = false
            });
        else
            return v42;
        end;
    end;
end;
v36.hasCycled = function(v54) --[[ Line: 172 ]] --[[ Name: hasCycled ]]
    -- upvalues: v3 (copy)
    if v3() then
        return v54:isValid() and v54._hasCycled;
    else
        return v54:isValid() and v54._currentIndex > 0;
    end;
end;
v36.reset = function(v55, v56) --[[ Line: 180 ]] --[[ Name: reset ]]
    -- upvalues: v3 (copy), v11 (copy), v26 (copy)
    assert(not v3(), "Remove with FFlagDraggerExternalHover");
    local v57 = v55._draggerContext:getMouseRay();
    local v58 = v11(v57, v55._draggerContext);
    local v59 = v26(v58, v55._draggerSchema);
    if #v59 > 0 then
        v55._cachedMouseLocation = v55._draggerContext:getMouseLocation();
        v55._cachedCameraPosition = v55._draggerContext:getCameraCFrame().Position;
        local v60 = 1;
        if v56 then
            local v61 = v55._cachedSelectables[v55._currentIndex];
            for v62, v63 in ipairs(v59) do
                if v63 == v61 then
                    v60 = v62;
                    break;
                end;
            end;
        end;
        v55._cachedSelectables = v59;
        v55._currentIndex = v60;
    else
        v55._cachedSelectables = {};
        v55._cachedMouseLocation = nil;
        v55._cachedCameraPosition = nil;
        v55._currentIndex = 0;
    end;
    v55._faceIsSelected = false;
    v55._analyticsNumberOfClicks = 0;
end;
v36.computeSelectionCycleCandidates = function(v64) --[[ Line: 214 ]] --[[ Name: computeSelectionCycleCandidates ]]
    -- upvalues: v3 (copy), v18 (copy), v35 (copy)
    assert(v3(), "New method under flag");
    v64._analyticsNumberOfClicks = 0;
    if v64:isValid() then
        return;
    else
        local v65 = v64._draggerContext:getMouseRay();
        local v66 = v18(v65, v64._draggerContext);
        local v67, v68 = v35(v66, v64._draggerSchema);
        v64._cachedRaycastResults = v67;
        v64._cachedSelectables = v68;
        if #v64._cachedRaycastResults > 0 then
            v64._cachedMouseLocation = v64._draggerContext:getMouseLocation();
            v64._cachedCameraPosition = v64._draggerContext:getCameraCFrame().Position;
            v64._currentIndex = 1;
        else
            v64._cachedMouseLocation = nil;
            v64._cachedCameraPosition = nil;
            v64._currentIndex = 0;
        end;
        v64._hasCycled = false;
        return;
    end;
end;
v36.isValid = function(v69) --[[ Line: 243 ]] --[[ Name: isValid ]]
    if v69._draggerContext:getCameraCFrame().Position ~= v69._cachedCameraPosition then
        return false;
    else
        return (v69._draggerContext:getMouseLocation() - v69._cachedMouseLocation).Magnitude <= 2;
    end;
end;
return v36;