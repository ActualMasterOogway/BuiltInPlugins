local _ = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Utility.SelectionHelper);
local v3 = require(l_Parent_0.Flags.getFFlagDraggerHandlesIsEnabledFunction);
local v4 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v5 = require(l_Parent_0.Flags.getFFlagDraggerExternalHover);
local function _(v6, v7, v8, v9) --[[ Line: 17 ]] --[[ Name: isIgnoredHandleHit ]]
    if not v6:shouldBiasTowardsObjects() then
        return false;
    elseif not v9 or not v8:doesContainItem(v9) then
        return false;
    else
        return v6:hitTest(v7, true) == nil;
    end;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13, v14, v15, v16, v17) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v11 (copy)
    assert(type(v14) == "table");
    assert(type(v13) == "table");
    if not v5() then
        assert(not v12, "New param should be nil with flag off");
        assert(not v15, "New param should be nil with flag off");
    end;
    local v18 = setmetatable({
        _draggerSchema = v13, 
        _handlesList = v14, 
        _selectionCycleCache = v15, 
        _hoverHandleId = nil, 
        _hoverItem = nil, 
        _mouseInBounds = true, 
        _hoverMetadata = nil, 
        _canHoverPivot = v17, 
        _onHoverChanged = v16
    }, v11);
    if v5() and v13.onExternalHover then
        v18._disconnectOnExternalHover = v13.onExternalHover(v12, function(v19, v20) --[[ Line: 66 ]]
            -- upvalues: v18 (copy)
            v18._hoverSelectable = v19;
            v18._hoverItem = v20;
            if v18._onHoverChanged then
                v18._onHoverChanged();
            end;
        end);
    end;
    return v18;
end;
local function _(v21, v22, v23, v24) --[[ Line: 79 ]] --[[ Name: isCloser ]]
    if v24 then
        return v22 and v21 < v23;
    else
        return v22 or v21 < v23;
    end;
end;
local function _(v26, v27) --[[ Line: 92 ]] --[[ Name: ignoreHandlesDueToCycling ]]
    -- upvalues: v4 (copy)
    if v4() then
        if not v26:isAltKeyDown() then
            return false;
        elseif not v27 then
            return false;
        else
            return true;
        end;
    else
        return v26:isAltKeyDown();
    end;
end;
local function _(v29) --[[ Line: 112 ]] --[[ Name: hasConstraintWidgetManagerRendering ]]
    return v29:IsA("Attachment") or v29:IsA("WeldConstraint") or v29:IsA("Constraint");
end;
v11.update = function(v31, v32, v33, v34, v35, v36) --[[ Line: 117 ]] --[[ Name: update ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    if v5() then
        assert(v36 == nil, "No longer need parameter with flag on");
    end;
    assert(v33 ~= nil);
    if not v31._mouseInBounds then
        return;
    else
        local l__hoverSelectable_0 = v31._hoverSelectable;
        local v38 = v32:getMouseRay();
        local v39 = nil;
        local v40 = nil;
        local v41 = nil;
        local v42 = nil;
        if v5() then
            if v32:isAltKeyDown() and not v32:shouldExtendSelection() then
                local v43, v44, v45, v46 = v31._selectionCycleCache:getNextSelectable(false);
                v39 = v43;
                v40 = v44;
                v41 = v45;
                v42 = v46;
                if typeof(v39) == "Instance" then
                    v44 = v39;
                    if v44:IsA("Attachment") or v44:IsA("WeldConstraint") or v44:IsA("Constraint") then
                        v32:gizmoRaycast(v38.Origin, v38.Direction, RaycastParams.new());
                    end;
                end;
            else
                local v47, v48, v49, v50 = v31._draggerSchema.getMouseTarget(v32, v38, v33, false, v31._canHoverPivot);
                v39 = v47;
                v40 = v48;
                v41 = v49;
                v42 = v50;
            end;
        else
            local v51, v52, v53, v54 = v31._draggerSchema.getMouseTarget(v32, v38, v33, false, v31._canHoverPivot);
            v39 = v51;
            v40 = v52;
            v41 = v53;
            v42 = v54;
        end;
        v31._hoverItem = v40;
        v31._hoverMetadata = v42;
        v31._hoverSelectable = v39;
        v31._hoverHandleId = nil;
        if v39 ~= nil then
            v31._hoverDistance = v41;
            v31._hoverPosition = v38.Origin + v38.Direction.Unit * v41;
        else
            v41 = 1e999;
            v31._hoverDistance = 1e999;
            v31._hoverPosition = nil;
        end;
        if v3() then
            v31._handlesList = v35;
        end;
        v31._hoverHandles = nil;
        local v55 = if v5() then v31._selectionCycleCache:hasCycled() else v36;
        if not if v4() then if v32:isAltKeyDown() then v55 and true or false else false else v32:isAltKeyDown() then
            local v56 = false;
            v55 = -1e999;
            for _, v58 in pairs(v31._handlesList) do
                local v59, v60, v61 = v58:hitTest(v38, false);
                local v62 = if v58.getPriority then v58:getPriority() else 0;
                if v59 then
                    local l_v41_0 = v41;
                    if if v56 then v61 and v60 < l_v41_0 else v61 or v60 < l_v41_0 then
                        l_v41_0 = v40;
                        if not (not not v58:shouldBiasTowardsObjects() and if l_v41_0 and v34:doesContainItem(l_v41_0) then v58:hitTest(v38, true) == nil else false) and v55 <= v62 then
                            v31._hoverHandles = v58;
                            v31._hoverHandleId = v59;
                            v31._hoverDistance = v60;
                            v31._hoverPosition = nil;
                            v41 = v60;
                            v56 = v61;
                            v55 = v62;
                        end;
                    end;
                end;
            end;
        end;
        if v31._hoverHandles then
            v31._draggerSchema.setHover(v32, nil, nil);
        else
            v31._draggerSchema.setHover(v32, v31._hoverSelectable, v31._hoverItem);
        end;
        if v31._onHoverChanged and v31._hoverSelectable ~= l__hoverSelectable_0 then
            v31:_freeHoverEscapeDetector();
            if v31._hoverSelectable then
                v31._hoverEscapeDetector = v31._draggerSchema.HoverEscapeDetector.new(v32, v31._hoverSelectable, v31._onHoverChanged);
            end;
        end;
        return;
    end;
end;
v11._freeHoverEscapeDetector = function(v64) --[[ Line: 225 ]] --[[ Name: _freeHoverEscapeDetector ]]
    if v64._hoverEscapeDetector then
        v64._hoverEscapeDetector:destroy();
        v64._hoverEscapeDetector = nil;
    end;
end;
v11.clearHover = function(v65, v66) --[[ Line: 232 ]] --[[ Name: clearHover ]]
    v65:_freeHoverEscapeDetector();
    v65._hoverItem = nil;
    v65._hoverMetadata = nil;
    v65._hoverSelectable = nil;
    v65._hoverPosition = nil;
    v65._hoverHandles = nil;
    v65._hoverHandleId = nil;
    v65._hoverDistance = nil;
    v65._draggerSchema.setHover(v66, nil, nil);
end;
v11.setMouseInBounds = function(v67, v68) --[[ Line: 244 ]] --[[ Name: setMouseInBounds ]]
    v67._mouseInBounds = v68;
end;
v11.getHoverHandleId = function(v69) --[[ Line: 251 ]] --[[ Name: getHoverHandleId ]]
    return v69._hoverHandles, v69._hoverHandleId, v69._hoverDistance;
end;
v11.getHoverItem = function(v70) --[[ Line: 258 ]] --[[ Name: getHoverItem ]]
    return v70._hoverItem, v70._hoverPosition;
end;
v11.getHoverMetadata = function(v71) --[[ Line: 266 ]] --[[ Name: getHoverMetadata ]]
    return v71._hoverMetadata;
end;
v11.getHoverSelectable = function(v72) --[[ Line: 270 ]] --[[ Name: getHoverSelectable ]]
    return v72._hoverSelectable;
end;
v11.destroy = function(v73) --[[ Line: 274 ]] --[[ Name: destroy ]]
    if v73._disconnectOnExternalHover then
        v73._disconnectOnExternalHover();
        v73._disconnectOnExternalHover = nil;
    end;
end;
return v11;