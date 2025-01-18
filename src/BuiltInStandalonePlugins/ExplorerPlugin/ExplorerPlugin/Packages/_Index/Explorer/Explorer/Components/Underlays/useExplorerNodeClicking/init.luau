local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.Contexts.DragDropContext);
local v2 = require(l_script_FirstAncestor_0.Components.Contexts.MouseContext);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v6 = require(l_script_FirstAncestor_0.Components.Contexts.WindowInputContext);
local v7 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local v8 = require(l_script_FirstAncestor_0.Util.getDoubleClickInterval);
local v9 = require(l_script_FirstAncestor_0.Util.hasOneItem);
local v10 = require(l_script_FirstAncestor_0.Util.profile);
local v11 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local v12 = require(l_script_FirstAncestor_0.Hooks.useRenameBoxActivity);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local v14 = v7("useExplorerNodeClicking");
local function _() --[[ Line: 19 ]] --[[ Name: getDragThreshold ]]
    return game:DefineFastInt("ExplorerDragThresholdPixels", 10);
end;
local function v21() --[[ Line: 23 ]] --[[ Name: useWatchForDragging ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v16 = v4.useContext(v2.Context);
    return v4.useCallback(function(v17) --[[ Line: 27 ]]
        -- upvalues: v16 (copy)
        local v18 = v16.getMousePosition();
        local v19 = v16.listenForMouseMove();
        local v20 = nil;
        v20 = v16.mouseMoved:Connect(function() --[[ Line: 33 ]]
            -- upvalues: v16 (ref), v18 (copy), v20 (ref), v19 (ref), v17 (copy)
            if (v16.getMousePosition() - v18).Magnitude < game:DefineFastInt("ExplorerDragThresholdPixels", 10) then
                return;
            else
                v20:Disconnect();
                if v19 ~= nil then
                    v19();
                    v19 = nil;
                end;
                v17();
                return;
            end;
        end);
        return function() --[[ Line: 50 ]]
            -- upvalues: v19 (ref), v20 (ref)
            if v19 ~= nil then
                v19();
                v19 = nil;
            end;
            v20:Disconnect();
        end;
    end, {
        v16.mouseMoved, 
        v16.getMousePosition, 
        v16.listenForMouseMove
    });
end;
return v10(function(v22, v23, v24) --[[ Line: 67 ]] --[[ Name: useExplorerNodeClicking ]]
    -- upvalues: v12 (copy), v3 (copy), v4 (copy), v1 (copy), v9 (copy), v21 (copy), v8 (copy), v14 (copy), v6 (copy), v11 (copy)
    local v25 = v12(v22);
    local v26 = v3.use(v23.selectedIdsObservable);
    local v27 = v4.useContext(v1.Context);
    local v28 = v4.useRef(-1e999);
    assert(v28.current ~= nil, "Luau");
    local v29 = v4.useRef(nil);
    local function v30() --[[ Line: 85 ]] --[[ Name: cancelDoubleClicks ]]
        -- upvalues: v29 (copy), v28 (copy)
        if v29.current ~= nil then
            task.cancel(v29.current);
            v29.current = nil;
        end;
        v28.current = -1e999;
    end;
    v4.useEffect(function() --[[ Line: 94 ]]
        -- upvalues: v30 (copy)
        return v30;
    end, {});
    v4.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v26 (copy), v22 (copy), v9 (ref), v29 (copy), v28 (copy)
        if not v26[v22.get().datum.id] or not v9(v26) then
            if v29.current ~= nil then
                task.cancel(v29.current);
                v29.current = nil;
            end;
            v28.current = -1e999;
        end;
    end, {
        v26, 
        v22
    });
    local v31 = v21();
    local v51 = v4.useCallback(function(_, v33) --[[ Line: 107 ]]
        -- upvalues: v22 (copy), v23 (copy), v27 (copy), v9 (ref), v28 (copy), v8 (ref), v29 (copy), v14 (ref), v24 (copy), v25 (copy), v31 (copy)
        if v33.UserInputType ~= Enum.UserInputType.MouseButton1 and v33.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            local l_id_0 = v22.get().datum.id;
            if v23.instancePickerActiveObservable.get() then
                v23.instancePickerSubmitInstance(l_id_0);
                return;
            else
                local v35 = v23.selectedIdsObservable.get();
                local v36 = not not v35[l_id_0];
                local v37 = false;
                if v33:IsModifierKeyDown(Enum.ModifierKey.Ctrl) then
                    v37 = true;
                    local v38 = v23.selectedIdsArrayObservable.get();
                    if v36 then
                        local v39 = {};
                        for _, v41 in v38 do
                            if v41 ~= l_id_0 then
                                table.insert(v39, v41);
                            end;
                        end;
                        v23.selectIds(table.freeze(v39));
                    else
                        local v42 = table.clone(v38);
                        table.insert(v42, l_id_0);
                        v23.selectIds(table.freeze(v42));
                    end;
                elseif v33:IsModifierKeyDown(Enum.ModifierKey.Shift) then
                    v37 = true;
                    v23.shiftClick(l_id_0);
                end;
                if v37 then
                    return;
                else
                    if not v36 then
                        v23.selectIds(table.freeze({
                            l_id_0
                        }));
                    end;
                    local function _() --[[ Line: 157 ]] --[[ Name: handleAsDrag ]]
                        -- upvalues: v27 (ref)
                        v27.startSelectionDrag();
                    end;
                    local function v47() --[[ Line: 161 ]] --[[ Name: handleAsClick ]]
                        -- upvalues: v22 (ref), l_id_0 (copy), v35 (ref), v23 (ref), v9 (ref), v28 (ref), v8 (ref), v29 (ref), v36 (copy), v14 (ref), v24 (ref), v33 (copy), v25 (ref)
                        if v22.get().datum.id ~= l_id_0 then
                            return;
                        else
                            v35 = v23.selectedIdsObservable.get();
                            if v9(v35) and os.clock() - v28.current <= v8() then
                                local v44 = next(v35);
                                assert(v44 ~= nil, "currentSelectedIds should have one ID");
                                v23.doubleClick(v44);
                                if v29.current ~= nil then
                                    task.cancel(v29.current);
                                    v29.current = nil;
                                end;
                                v28.current = -1e999;
                            elseif v36 then
                                v14("Already selected, waiting double click interval...");
                                v23.selectIds(table.freeze({
                                    l_id_0
                                }));
                                local l_current_0 = v24.current;
                                local v46 = false;
                                if l_current_0 ~= nil then
                                    v46 = false;
                                    if v33.Position.X >= l_current_0.AbsolutePosition.X then
                                        v46 = v33.Position.X <= l_current_0.AbsolutePosition.X + l_current_0.AbsoluteSize.X;
                                    end;
                                end;
                                v29.current = task.delay(v8(), function() --[[ Line: 188 ]]
                                    -- upvalues: v29 (ref), v22 (ref), l_id_0 (ref), v14 (ref), v46 (copy), v25 (ref)
                                    v29.current = nil;
                                    if v22.get().datum.id ~= l_id_0 then
                                        return;
                                    else
                                        v14("Opening rename box");
                                        if v46 then
                                            v25.enable();
                                        end;
                                        return;
                                    end;
                                end);
                            end;
                            v28.current = os.clock();
                            return;
                        end;
                    end;
                    local v48 = nil;
                    local v49 = nil;
                    local v50 = false;
                    v48 = v31(function() --[[ Line: 211 ]]
                        -- upvalues: v50 (ref), v48 (ref), v49 (ref), v27 (ref)
                        v50 = true;
                        v48();
                        v49:Disconnect();
                        v27.startSelectionDrag();
                    end);
                    v49 = v33:GetPropertyChangedSignal("UserInputState"):Connect(function() --[[ Line: 218 ]]
                        -- upvalues: v33 (copy), v48 (ref), v49 (ref), v50 (ref), v47 (copy)
                        if v33.UserInputState == Enum.UserInputState.End then
                            v48();
                            v49:Disconnect();
                            if not v50 then
                                v47();
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
    end, {
        v22, 
        v23.selectIds, 
        v31, 
        v27.startSelectionDrag
    });
    local v52 = v4.useContext(v6.Context);
    v11(v52.inputBeganSignal, function(v53, v54) --[[ Line: 233 ]]
        -- upvalues: v26 (copy), v22 (copy), v9 (ref), v25 (copy)
        if (v53.KeyCode == Enum.KeyCode.Return or v53.KeyCode == Enum.KeyCode.KeypadEnter or v53.KeyCode == Enum.KeyCode.F2) and not v54 and v26[v22.get().datum.id] and v9(v26) then
            v25.enable();
        end;
    end, {
        v26, 
        v22
    });
    return {
        inputBegan = v51, 
        textLabelRef = v24
    };
end);