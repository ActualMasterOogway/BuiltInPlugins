local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Implementation.DraggerStateType);
local v4 = require(l_Parent_0.Components.AnimatedHoverBox);
local v5 = require(l_Parent_0.Components.LocalSpaceIndicator);
local v6 = require(l_Parent_0.Utility.SelectionHelper);
local v7 = require(l_Parent_0.Implementation.HoverTracker);
local v8 = require(l_Parent_0.Utility.StandardCursor);
local v9 = require(l_Parent_0.Flags.getFFlagDraggerHandlesIsEnabledFunction);
local v10 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v11 = require(l_Parent_0.Flags.getFFlagDraggerSelectionChangeFix);
local v12 = require(l_Parent_0.Flags.getFFlagDraggerExternalHover);
local v13 = {};
v13.__index = v13;
v13.new = function(v14) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    return (setmetatable({
        _draggerToolModel = v14
    }, v13));
end;
v13.enter = function(v15) --[[ Line: 28 ]] --[[ Name: enter ]]
    -- upvalues: v7 (copy), v12 (copy), v10 (copy)
    v15._hoverTracker = v7.new(if v12() then v15._draggerToolModel._draggerContext else nil, v15._draggerToolModel:getSchema(), v15._draggerToolModel:getHandlesList(), if v12() then v15._draggerToolModel._selectionCycleCache else nil, function() --[[ Line: 29 ]] --[[ Name: onHoverExternallyChanged ]]
        -- upvalues: v15 (copy)
        v15._draggerToolModel:_processViewChanged();
    end, if v10() then v15._draggerToolModel:shouldShowPivotIndicator() else nil);
    v15:_updateHoverTracker();
    if v10() and not v15._draggerToolModel._draggerContext:isTabKeyDown() then
        v15._draggerToolModel:_endSummon();
    end;
end;
v13.leave = function(v16) --[[ Line: 51 ]] --[[ Name: leave ]]
    -- upvalues: v12 (copy)
    v16._hoverTracker:clearHover(v16._draggerToolModel._draggerContext);
    if v12() then
        v16._hoverTracker:destroy();
    end;
end;
v13.render = function(v17) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v2 (copy), v4 (copy), v10 (copy), v8 (copy), v5 (copy)
    local v18 = {};
    local l__draggerContext_0 = v17._draggerToolModel._draggerContext;
    local v20 = v17._hoverTracker:getHoverSelectable();
    local v21 = l__draggerContext_0:shouldExtendSelection();
    if not v12() then
        local l__selectionCycleCache_0 = v17._draggerToolModel._selectionCycleCache;
        if l__draggerContext_0:isAltKeyDown() and not v21 and l__selectionCycleCache_0:isValid() then
            v20 = l__selectionCycleCache_0:getNextSelectable(false);
        end;
    end;
    if l__draggerContext_0:shouldShowHover() and v20 then
        local v23 = v17._draggerToolModel:getSchema().getSelectionBoxComponent(l__draggerContext_0, v20);
        if v23 then
            local v24 = nil;
            if l__draggerContext_0:shouldAnimateHover() then
                v24 = l__draggerContext_0:getHoverAnimationSpeedInSeconds();
            end;
            local v25 = false;
            if l__draggerContext_0:shouldShowActiveInstanceHighlight() then
                v25 = v20 == v17._draggerToolModel:getSelectionWrapper():getActiveSelectable();
            end;
            v18.HoverBox = v2.createElement(v4, {
                SelectionBoxComponent = v23, 
                HoverTarget = v20, 
                SelectColor = l__draggerContext_0:getSelectionBoxColor(v25), 
                Thickness = l__draggerContext_0:getHoverThickness(), 
                LineThickness = l__draggerContext_0:getHoverLineThickness(), 
                HoverColor = l__draggerContext_0:getHoverBoxColor(v25), 
                AnimatePeriod = v24, 
                ShowHoverBox = l__draggerContext_0:getShowBoundingBox(), 
                ShowOutline = l__draggerContext_0:getShowOutline()
            });
            if v10() and not v17._hoverTracker:getHoverHandleId() and not v17._draggerToolModel:_isSummoned() then
                local l_getHoverComponent_0 = v17._draggerToolModel:getSchema().getHoverComponent;
                if l_getHoverComponent_0 then
                    local v27 = l_getHoverComponent_0(l__draggerContext_0, v20);
                    if v27 then
                        v18.HoverDisplay = v2.createElement(v27, {
                            DraggerContext = v17._draggerToolModel._draggerContext, 
                            HoverMetadata = v17._hoverTracker:getHoverMetadata(), 
                            Pending = false
                        });
                    end;
                end;
            end;
        end;
    end;
    if v20 or v17._hoverTracker:getHoverHandleId() then
        v17._draggerToolModel:setMouseCursor(v8.getOpenHand());
    else
        v17._draggerToolModel:setMouseCursor(v8.getArrow());
    end;
    if v17._draggerToolModel:shouldShowLocalSpaceIndicator() then
        local l__selectionInfo_0 = v17._draggerToolModel._selectionInfo;
        if not l__selectionInfo_0:isEmpty() and l__draggerContext_0:shouldUseLocalSpace() then
            local v29, v30, v31 = l__selectionInfo_0:getBoundingBox();
            v18.LocalSpaceIndicator = v2.createElement(v5, {
                CFrame = v29 * CFrame.new(v30), 
                Size = v31, 
                TextColor3 = l__draggerContext_0:getSelectionBoxColor(), 
                DraggerContext = l__draggerContext_0
            });
        end;
    end;
    local v32, v33 = v17._hoverTracker:getHoverHandleId();
    for v34, v35 in pairs(v17._draggerToolModel:getHandlesList()) do
        v18["ImplementationUI" .. v34] = v35:render(v32 == v35 and v33 or nil);
    end;
    return v2.createFragment(v18);
end;
v13.processSelectionChanged = function(v36) --[[ Line: 150 ]] --[[ Name: processSelectionChanged ]]
    if v36._hoverTracker then
        v36:_updateHoverTracker();
    end;
end;
v13.processMouseDown = function(v37, v38) --[[ Line: 169 ]] --[[ Name: processMouseDown ]]
    -- upvalues: v3 (copy)
    v37:_updateHoverTracker();
    local v39, v40 = v37._hoverTracker:getHoverHandleId();
    if v40 then
        v37._draggerToolModel:transitionToState(v3.DraggingHandle, v39, v40);
        return;
    else
        v37:_clickInWorld(v38);
        return;
    end;
end;
v13.processViewChanged = function(v41) --[[ Line: 183 ]] --[[ Name: processViewChanged ]]
    v41:_updateHoverTracker();
end;
v13.processMouseUp = function(_) --[[ Line: 187 ]] --[[ Name: processMouseUp ]]

end;
v13.processMouseEnter = function(v43) --[[ Line: 191 ]] --[[ Name: processMouseEnter ]]
    v43._hoverTracker:setMouseInBounds(true);
end;
v13.processMouseLeave = function(v44) --[[ Line: 195 ]] --[[ Name: processMouseLeave ]]
    v44._hoverTracker:clearHover(v44._draggerToolModel._draggerContext);
    v44._hoverTracker:setMouseInBounds(false);
    v44._draggerToolModel:_scheduleRender();
end;
v13._scopeSelectChanged = function(v45) --[[ Line: 201 ]] --[[ Name: _scopeSelectChanged ]]
    -- upvalues: v12 (copy)
    if v12() or v45._hoverTracker:getHoverItem() ~= nil then
        v45:_updateHoverTracker();
        v45._draggerToolModel:_scheduleRender();
    end;
end;
v13.processKeyDown = function(v46, v47) --[[ Line: 208 ]] --[[ Name: processKeyDown ]]
    -- upvalues: v10 (copy)
    if v47 == Enum.KeyCode.LeftAlt or v47 == Enum.KeyCode.RightAlt then
        v46:_scopeSelectChanged();
    elseif v10() and v47 == Enum.KeyCode.Tab then
        v46._draggerToolModel:_beginSummon();
        v46:_updateHoverTracker();
        v46._draggerToolModel:_scheduleRender();
    end;
    for _, v49 in pairs(v46._draggerToolModel:getHandlesList()) do
        if v49.keyDown and v49:keyDown(v47) then
            v46:processViewChanged();
            v46._draggerToolModel:_scheduleRender();
        end;
    end;
end;
v13.processKeyUp = function(v50, v51) --[[ Line: 227 ]] --[[ Name: processKeyUp ]]
    -- upvalues: v12 (copy), v10 (copy)
    if v51 == Enum.KeyCode.LeftAlt or v51 == Enum.KeyCode.RightAlt then
        v50:_scopeSelectChanged();
        local l__selectionCycleCache_1 = v50._draggerToolModel._selectionCycleCache;
        local l__analyticsNumberOfClicks_0 = l__selectionCycleCache_1._analyticsNumberOfClicks;
        local v54 = l__selectionCycleCache_1:size();
        v50._draggerToolModel:_analyticsSendSelectionCycle(l__analyticsNumberOfClicks_0, v54);
        if v12() then
            l__selectionCycleCache_1:computeSelectionCycleCandidates();
        else
            l__selectionCycleCache_1:reset(false);
        end;
    elseif v10() and v51 == Enum.KeyCode.Tab then
        v50._draggerToolModel:_endSummon();
        v50:_updateHoverTracker();
        v50._draggerToolModel:_scheduleRender();
    end;
    for _, v56 in pairs(v50._draggerToolModel:getHandlesList()) do
        if v56.keyUp and v56:keyUp(v51) then
            v50:processViewChanged();
            v50._draggerToolModel:_scheduleRender();
        end;
    end;
end;
v13._updateHoverTracker = function(v57) --[[ Line: 256 ]] --[[ Name: _updateHoverTracker ]]
    -- upvalues: v9 (copy), v10 (copy), v12 (copy)
    v57._hoverTracker:update(v57._draggerToolModel._draggerContext, v57._draggerToolModel:getSelectionWrapper():get(), v57._draggerToolModel._selectionInfo, if v9() then v57._draggerToolModel:getHandlesList() else nil, if not v10() or v12() then nil else v57._draggerToolModel._selectionCycleCache:hasCycled());
end;
local _ = function(v58, v59) --[[ Line: 268 ]] --[[ Name: contains ]]
    for _, v61 in ipairs(v58) do
        if v61 == v59 then
            return true;
        end;
    end;
    return false;
end;
v13._clickInWorld = function(v63, v64) --[[ Line: 280 ]] --[[ Name: _clickInWorld ]]
    -- upvalues: v10 (copy), v12 (copy), v6 (copy), v11 (copy), v3 (copy)
    local v65 = false;
    local v66 = false;
    local l__draggerContext_1 = v63._draggerToolModel._draggerContext;
    local v68, v69 = v63._hoverTracker:getHoverItem();
    local v70 = v63._hoverTracker:getHoverSelectable();
    local v71 = if v10() then v63._hoverTracker:getHoverMetadata() else nil;
    local v72 = v63._draggerToolModel:getSelectionWrapper():get();
    local l_v70_0 = v70;
    local v74;
    for _, v76 in ipairs(v72) do
        if v76 == l_v70_0 then
            v74 = true;
            v65 = true;
        end;
        if v65 then
            break;
        end;
    end;
    if not v65 then
        v74 = false;
    end;
    v65 = false;
    l_v70_0 = l__draggerContext_1:shouldExtendSelection();
    if v64 and v74 then
        l_v70_0 = false;
    end;
    if not v12() and l__draggerContext_1:isAltKeyDown() and not l_v70_0 then
        local l__selectionCycleCache_2 = v63._draggerToolModel._selectionCycleCache;
        if not l__selectionCycleCache_2:isValid() then
            l__selectionCycleCache_2:reset(false);
        end;
        if v68 and not v69 then
            v70 = l__selectionCycleCache_2:getNextSelectable(true);
        end;
    end;
    local v78 = false;
    if v70 ~= nil then
        v78 = v63._draggerToolModel:getSchema().isExclusiveSelectable(l__draggerContext_1, v70, v68);
    end;
    local v79, v80, v81 = v6.updateSelection(v70, v72, v78, l_v70_0);
    if v79 then
        v63._draggerToolModel:getSelectionWrapper():set(v80, v81);
        if v11() and not v63._draggerToolModel:isSelected() then
            return;
        else
            v63._draggerToolModel:_processSelectionChanged();
            v63._draggerToolModel:getSchema().setActivePoint(v63._draggerToolModel._draggerContext, v63._draggerToolModel._selectionInfo);
        end;
    end;
    v63._draggerToolModel:_analyticsSendClick(v68, v79);
    local l_freeze_0 = table.freeze;
    local v83 = {
        DoubleClicked = v64, 
        ClickedSelectable = v70, 
        ClickedItem = v68, 
        ClickedPosition = v69, 
        ClickedMetadata = v71, 
        SelectionDidContainSelectable = v74
    };
    local l_v70_1 = v70;
    local v85;
    for _, v87 in ipairs(v80) do
        if v87 == l_v70_1 then
            v85 = true;
            v66 = true;
        end;
        if v66 then
            break;
        end;
    end;
    if not v66 then
        v85 = false;
    end;
    v66 = false;
    v83.SelectionNowContainsSelectable = v85;
    l_freeze_0 = l_freeze_0(v83);
    v83, v85 = v63._draggerToolModel:getSchema().dispatchWorldClick(v63._draggerToolModel._draggerContext, v63._draggerToolModel, l_freeze_0);
    if v83 == "Ready" then
        if v70 and (not v79 or v64) then
            v63._draggerToolModel:transitionToState(v3.PendingSelectNext, v64, l_freeze_0);
            return;
        end;
    elseif v83 == "DragSelecting" then
        if v63._draggerToolModel:doesAllowDragSelect() then
            v63._draggerToolModel:transitionToState(v3.DragSelecting);
            return;
        end;
    elseif v83 == "FreeformSelectionDrag" then
        v63._draggerToolModel:transitionToState(v3.PendingDraggingParts, v64, v85, v71);
        return;
    else
        error("Bad state returned from dispatchWorldClick: `" .. tostring(v83) .. "`");
    end;
end;
return v13;