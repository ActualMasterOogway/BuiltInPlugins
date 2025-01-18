local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Components.Contexts.DragDropContext);
local v3 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local v4 = require(l_script_FirstAncestor_0.Components.Contexts.MouseContext);
local v5 = require(l_script_FirstAncestor_0.Util.Observable);
local v6 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v8 = require(l_script_FirstAncestor_0.Util.getExplorerNodeDepth);
local v9 = require(l_script_FirstAncestor_0.Util.isExpanded);
local v10 = require(l_script_FirstAncestor_0.Util.shallowEqual);
local v11 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local function _() --[[ Line: 25 ]] --[[ Name: getAutoExpandHoverThreshold ]]
    return game:DefineFastInt("ExplorerAutoExpandHoverThresholdMs", 500);
end;
local function _() --[[ Line: 29 ]] --[[ Name: getInBetweenThreshold ]]
    return game:DefineFastInt("ExplorerInBetweenThresholdPixels", 4);
end;
local function _(v14, v15) --[[ Line: 33 ]] --[[ Name: isDescendantOfSelection ]]
    local v16 = v14.selectedIdsObservable.get();
    local l_v15_0 = v15;
    while true do
        if l_v15_0 ~= nil then
            if v16[l_v15_0.datum.id] then
                return true;
            else
                l_v15_0 = l_v15_0.parent;
            end;
        else
            return false;
        end;
    end;
end;
local function _(v19, v20) --[[ Line: 48 ]] --[[ Name: useAutoExpand ]]
    -- upvalues: v5 (copy)
    v5.useEffect(v20, function(v21) --[[ Line: 52 ]]
        -- upvalues: v19 (copy)
        if v21 == nil or v21.type ~= "onTop" then
            return nil;
        elseif v19.getExpandState(v21.targetId) ~= "Collapsed" then
            return nil;
        else
            local v22 = task.delay(game:DefineFastInt("ExplorerAutoExpandHoverThresholdMs", 500) / 1000, function() --[[ Line: 61 ]]
                -- upvalues: v19 (ref), v21 (copy)
                if v19.getExpandState(v21.targetId) ~= "Collapsed" then
                    return;
                else
                    task.spawn(function() --[[ Line: 68 ]]
                        -- upvalues: v19 (ref), v21 (ref)
                        v19.expandAsync(v21.targetId);
                    end);
                    return;
                end;
            end);
            return function() --[[ Line: 73 ]]
                -- upvalues: v22 (copy)
                task.cancel(v22);
            end;
        end;
    end, {});
end;
return function(v24, v25) --[[ Line: 79 ]] --[[ Name: useDragAndDrop ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy), v5 (copy), v1 (copy), v3 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    local v26 = v6.useContext(v2.Context);
    local v27 = v6.useContext(v4.Context);
    local v28, v29 = v5.useState(nil);
    local v47 = v6.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v24 (copy), v25 (copy), v27 (copy), v1 (ref), v3 (ref), v8 (ref), v9 (ref)
        local v30 = v24.focusedRootObservable.get();
        local l_current_0 = v25.current;
        if l_current_0 == nil then
            return nil;
        else
            local v32 = v27.getMousePosition();
            local v33 = l_current_0.CanvasPosition + (v32 - l_current_0.AbsolutePosition);
            local v34 = 1 + v33.Y // v1.explorerRowHeight;
            local v35 = v33.Y % v1.explorerRowHeight;
            local v36 = false;
            local v37 = game:DefineFastInt("ExplorerInBetweenThresholdPixels", 4);
            if v35 <= v37 then
                v36 = true;
                v34 = v34 - 1;
            elseif v1.explorerRowHeight - v37 <= v35 then
                v36 = true;
            end;
            local v38 = if v34 <= 0 then nil else v3.getNthDescendant(v30.children, v34);
            if v38 == nil then
                return nil;
            else
                local l_v38_0 = v38;
                if v36 then
                    local v40 = v3.getNthDescendant(v30.children, v34 + 1);
                    local v41 = v8(v38);
                    assert(v38.parent ~= nil, "No parent for in-between row");
                    if v40 ~= nil and v8(v40) < v41 and v33.X < v1.indentWidth * v41 and v38.parent.parent ~= nil and v38.parent.parent.datum.className ~= "DataModel" then
                        l_v38_0 = v38.parent.parent;
                    elseif (not v38.datum.hasChildren or not v9(v38)) and v38.parent.datum.className ~= "DataModel" then
                        l_v38_0 = v38.parent;
                    end;
                end;
                if l_v38_0 == nil then
                    return nil;
                else
                    local l_v24_0 = v24;
                    local l_l_v38_0_0 = l_v38_0;
                    local v44 = l_v24_0.selectedIdsObservable.get();
                    local l_l_l_v38_0_0_0 = l_l_v38_0_0;
                    local v46;
                    while true do
                        if l_l_l_v38_0_0_0 ~= nil then
                            if v44[l_l_l_v38_0_0_0.datum.id] then
                                v46 = true;
                                break;
                            else
                                l_l_l_v38_0_0_0 = l_l_l_v38_0_0_0.parent;
                            end;
                        else
                            v46 = false;
                            break;
                        end;
                    end;
                    if v46 then
                        return nil;
                    else
                        v46 = nil;
                        v46 = if v36 then {
                            type = "below", 
                            belowId = v38.datum.id, 
                            targetId = l_v38_0.datum.id, 
                            targetDepth = v8(l_v38_0)
                        } else {
                            type = "onTop", 
                            targetId = v38.datum.id
                        };
                        return table.freeze(v46);
                    end;
                end;
            end;
        end;
    end, {
        v24.focusedRootObservable, 
        v25, 
        v27.getMousePosition
    });
    local v49 = v6.useCallback(function() --[[ Line: 168 ]]
        -- upvalues: v47 (copy), v10 (ref), v28 (copy), v29 (copy)
        local v48 = v47();
        if not v10(v48, v28.get()) then
            v29(v48);
        end;
    end, {
        v28, 
        v47
    });
    v11(v26.selectionDragDropped, function() --[[ Line: 176 ]]
        -- upvalues: v47 (copy), v24 (copy)
        local v50 = v47();
        if v50 == nil then
            return;
        else
            v24.dropSelectionOntoAsync(v50.targetId);
            return;
        end;
    end, {
        v24.dropSelectionOntoAsync, 
        v47
    });
    v6.useEffect(function() --[[ Line: 187 ]]
        -- upvalues: v26 (copy), v29 (copy), v27 (copy), v49 (copy), v24 (copy)
        if not v26.selectionDragInProgress then
            v29(nil);
            return nil;
        else
            local v51 = v27.listenForMouseMove();
            local v52 = v27.mouseMoved:Connect(function() --[[ Line: 195 ]]
                -- upvalues: v49 (ref)
                v49();
            end);
            local v53 = v24.focusedRootObservable.changedSignal:Connect(function() --[[ Line: 199 ]]
                -- upvalues: v49 (ref)
                v49();
            end);
            v49();
            return function() --[[ Line: 205 ]]
                -- upvalues: v51 (copy), v52 (copy), v53 (copy)
                v51();
                v52:Disconnect();
                v53:Disconnect();
            end;
        end;
    end, {
        v26.selectionDragInProgress, 
        v49, 
        v24.focusedRootObservable, 
        v27.listenForMouseMove, 
        v27.mouseMoved
    });
    v5.useEffect(v28, function(v54) --[[ Line: 52 ]]
        -- upvalues: v24 (copy)
        if v54 == nil or v54.type ~= "onTop" then
            return nil;
        elseif v24.getExpandState(v54.targetId) ~= "Collapsed" then
            return nil;
        else
            local v55 = task.delay(game:DefineFastInt("ExplorerAutoExpandHoverThresholdMs", 500) / 1000, function() --[[ Line: 61 ]]
                -- upvalues: v24 (ref), v54 (copy)
                if v24.getExpandState(v54.targetId) ~= "Collapsed" then
                    return;
                else
                    task.spawn(function() --[[ Line: 68 ]]
                        -- upvalues: v24 (ref), v54 (ref)
                        v24.expandAsync(v54.targetId);
                    end);
                    return;
                end;
            end);
            return function() --[[ Line: 73 ]]
                -- upvalues: v55 (copy)
                task.cancel(v55);
            end;
        end;
    end, {});
    return v28;
end;