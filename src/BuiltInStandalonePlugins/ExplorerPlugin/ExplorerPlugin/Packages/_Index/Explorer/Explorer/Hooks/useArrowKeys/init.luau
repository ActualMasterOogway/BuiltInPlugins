local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v2 = require(l_script_FirstAncestor_0.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local v4 = require(l_script_FirstAncestor_0.Util.Observable);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v7 = require(l_script_FirstAncestor_0.Components.Contexts.WindowInputContext);
local v8 = require(l_script_FirstAncestor_0.Util.getExplorerNodeIndex);
local v9 = require(l_script_FirstAncestor_0.Util.isExpanded);
local v10 = require(l_script_FirstAncestor_0.Util.isNodeVisible);
local v11 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local function v16(v12) --[[ Line: 19 ]] --[[ Name: getMostRecentVisibleSelection ]]
    -- upvalues: v10 (copy)
    local v13 = v12.selectedIdsArrayObservable.get();
    for v14 = #v13, 1, -1 do
        local v15 = v12.getExplorerNodeById(v13[v14]);
        if v15 ~= nil and v10(v15) then
            return v15;
        end;
    end;
    return nil;
end;
local function _(v17, v18) --[[ Line: 32 ]] --[[ Name: shiftClickWouldBeNoticeable ]]
    local l_v17_0 = v17;
    while true do
        if l_v17_0 ~= nil then
            if v18[l_v17_0.datum.id] then
                return false;
            else
                l_v17_0 = l_v17_0.parent;
            end;
        else
            return true;
        end;
    end;
end;
local function v38(v21) --[[ Line: 56 ]] --[[ Name: useShiftArrowKey ]]
    -- upvalues: v5 (copy), v4 (copy), v10 (copy), v8 (copy), v3 (copy)
    local v22 = v5.useRef(nil);
    local v23 = v5.useRef(false);
    local v24 = v5.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy), v22 (copy)
        if v23.current then
            return;
        else
            v22.current = nil;
            return;
        end;
    end, {});
    v4.useEffect(v21.selectedIdsObservable, v24, {});
    return (v5.useCallback(function(v25) --[[ Line: 70 ]]
        -- upvalues: v22 (copy), v21 (copy), v23 (copy), v10 (ref), v8 (ref), v3 (ref)
        local l_current_0 = v22.current;
        if l_current_0 == nil then
            l_current_0 = {
                baseSelection = {
                    set = v21.selectedIdsObservable.get(), 
                    array = v21.selectedIdsArrayObservable.get()
                }, 
                direction = v25, 
                addedIds = {}
            };
            v22.current = l_current_0;
        end;
        assert(l_current_0 ~= nil, "Luau");
        if v25 ~= l_current_0.direction then
            table.remove(l_current_0.addedIds);
            local v27 = l_current_0.addedIds[#l_current_0.addedIds];
            if v27 == nil then
                v21.selectIds(l_current_0.baseSelection.array);
                v22.current = nil;
                return;
            else
                v23.current = true;
                v21.shiftClick(v27, l_current_0.baseSelection);
                v23.current = false;
                return;
            end;
        else
            local v28 = v21.selectedIdsArrayObservable.get();
            local v29 = v21.selectedIdsObservable.get();
            local v30 = nil;
            for v31 = #v28, 1, -1 do
                local v32 = v21.getExplorerNodeById(v28[v31]);
                if v32 ~= nil and v10(v32) then
                    v30 = v8(v32);
                    break;
                end;
            end;
            if v30 == nil then
                return;
            else
                local v33 = v30 + v25;
                local v34 = v21.focusedRootObservable.get();
                while true do
                    if v33 == 0 then
                        return;
                    else
                        local v35 = v3.getNthDescendant(v34.children, v33);
                        if v35 == nil then
                            return;
                        else
                            local l_v35_0 = v35;
                            local v37;
                            while true do
                                if l_v35_0 ~= nil then
                                    if v29[l_v35_0.datum.id] then
                                        v37 = false;
                                        break;
                                    else
                                        l_v35_0 = l_v35_0.parent;
                                    end;
                                else
                                    v37 = true;
                                    break;
                                end;
                            end;
                            if v37 then
                                v23.current = true;
                                v21.shiftClick(v35.datum.id, l_current_0.baseSelection);
                                v23.current = false;
                                table.insert(l_current_0.addedIds, v35.datum.id);
                                return;
                            else
                                v33 = v33 + v25;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end, {
        v21
    }));
end;
local function v48(v39) --[[ Line: 154 ]] --[[ Name: usePressHoldKey ]]
    -- upvalues: v5 (copy)
    local v40 = v5.useRef(nil);
    local v41 = v5.useRef(nil);
    local function _() --[[ Line: 158 ]] --[[ Name: cancelCurrentThread ]]
        -- upvalues: v40 (copy), v41 (copy)
        v40.current = nil;
        if v41.current then
            task.cancel(v41.current);
            v41.current = nil;
        end;
    end;
    local v45 = v5.useCallback(function(v43, v44) --[[ Line: 166 ]]
        -- upvalues: v40 (copy), v41 (copy)
        if v40.current == v44.KeyCode then
            return;
        else
            v40.current = nil;
            if v41.current then
                task.cancel(v41.current);
                v41.current = nil;
            end;
            v40.current = v44.KeyCode;
            v41.current = task.spawn(function() --[[ Line: 174 ]]
                -- upvalues: v43 (copy), v44 (copy)
                v43(v44);
                task.wait(0.5);
                while true do
                    v43(v44);
                    task.wait(0.02);
                end;
            end);
            return;
        end;
    end, {});
    local v47 = v5.useCallback(function(v46) --[[ Line: 184 ]]
        -- upvalues: v40 (copy), v41 (copy)
        if v40.current ~= v46.KeyCode then
            return;
        else
            v40.current = nil;
            if v41.current then
                task.cancel(v41.current);
                v41.current = nil;
            end;
            return;
        end;
    end, {});
    v5.useEffect(function() --[[ Line: 192 ]]
        -- upvalues: v40 (copy), v41 (copy)
        return function() --[[ Line: 193 ]]
            -- upvalues: v40 (ref), v41 (ref)
            v40.current = nil;
            if v41.current then
                task.cancel(v41.current);
                v41.current = nil;
            end;
        end;
    end, {
        v39
    });
    return {
        startPressHold = v45, 
        endHold = v47
    };
end;
return function(v49) --[[ Line: 204 ]] --[[ Name: useArrowKeys ]]
    -- upvalues: v38 (copy), v5 (copy), l_UserInputService_0 (copy), v16 (copy), v8 (copy), v3 (copy), v9 (copy), v2 (copy), v48 (copy), v7 (copy), v11 (copy)
    local v50 = v38(v49);
    local v55 = v5.useCallback(function(v51) --[[ Line: 207 ]]
        -- upvalues: l_UserInputService_0 (ref), v50 (copy), v16 (ref), v49 (copy), v8 (ref), v3 (ref)
        if l_UserInputService_0:GetFocusedTextBox() ~= nil then
            return;
        elseif v51:IsModifierKeyDown(Enum.ModifierKey.Ctrl) then
            return;
        elseif v51:IsModifierKeyDown(Enum.ModifierKey.Shift) then
            v50(-1);
            return;
        else
            local v52 = v16(v49);
            if v52 == nil then
                return;
            else
                local v53 = v8(v52);
                if v53 == 1 then
                    return;
                else
                    local v54 = v3.getNthDescendant(v49.focusedRootObservable.get().children, v53 - 1);
                    if v54 == nil then
                        return;
                    else
                        v49.selectIds(table.freeze({
                            v54.datum.id
                        }));
                        return;
                    end;
                end;
            end;
        end;
    end, {
        v49, 
        v50
    });
    local v60 = v5.useCallback(function(v56) --[[ Line: 241 ]]
        -- upvalues: l_UserInputService_0 (ref), v50 (copy), v16 (ref), v49 (copy), v8 (ref), v3 (ref)
        if l_UserInputService_0:GetFocusedTextBox() ~= nil then
            return;
        elseif v56:IsModifierKeyDown(Enum.ModifierKey.Ctrl) then
            return;
        elseif v56:IsModifierKeyDown(Enum.ModifierKey.Shift) then
            v50(1);
            return;
        else
            local v57 = v16(v49);
            if v57 == nil then
                return;
            else
                local v58 = v8(v57);
                local v59 = v3.getNthDescendant(v49.focusedRootObservable.get().children, v58 + 1);
                if v59 == nil then
                    return;
                else
                    v49.selectIds(table.freeze({
                        v59.datum.id
                    }));
                    return;
                end;
            end;
        end;
    end, {
        v49, 
        v50
    });
    local v64 = v5.useCallback(function(v61) --[[ Line: 272 ]]
        -- upvalues: l_UserInputService_0 (ref), v16 (ref), v49 (copy), v9 (ref), v2 (ref)
        if l_UserInputService_0:GetFocusedTextBox() ~= nil then
            return;
        elseif v61:IsModifierKeyDown(Enum.ModifierKey.Ctrl) or v61:IsModifierKeyDown(Enum.ModifierKey.Shift) then
            return;
        else
            local v62 = v16(v49);
            if v62 == nil then
                return;
            elseif v9(v62) and v62.datum.hasChildren then
                v49.unexpand(v62.datum.id);
                return;
            else
                local l_parent_0 = v62.parent;
                if l_parent_0 ~= nil and l_parent_0.datum.id ~= v2.rootId then
                    v49.selectIds(table.freeze({
                        l_parent_0.datum.id
                    }));
                end;
                return;
            end;
        end;
    end, {
        v49
    });
    local v68 = v5.useCallback(function(v65) --[[ Line: 299 ]]
        -- upvalues: l_UserInputService_0 (ref), v16 (ref), v49 (copy), v9 (ref), v3 (ref)
        if l_UserInputService_0:GetFocusedTextBox() ~= nil then
            return;
        elseif v65:IsModifierKeyDown(Enum.ModifierKey.Ctrl) or v65:IsModifierKeyDown(Enum.ModifierKey.Shift) then
            return;
        else
            local v66 = v16(v49);
            if v66 == nil then
                return;
            elseif not v66.datum.hasChildren then
                return;
            else
                if v9(v66) then
                    local v67 = v3.first(v66.children);
                    if v67 ~= nil then
                        v49.selectIds(table.freeze({
                            v67.datum.id
                        }));
                        return;
                    end;
                else
                    task.spawn(function() --[[ Line: 326 ]]
                        -- upvalues: v49 (ref), v66 (copy)
                        v49.expandAsync(v66.datum.id);
                    end);
                end;
                return;
            end;
        end;
    end, {
        v49
    });
    local v69 = v48(v49);
    local v70 = v5.useContext(v7.Context);
    v11(v70.inputBeganSignal, function(v71) --[[ Line: 335 ]]
        -- upvalues: v69 (copy), v55 (copy), v60 (copy), v64 (copy), v68 (copy)
        if v71.KeyCode == Enum.KeyCode.Up then
            v69.startPressHold(v55, v71);
            return;
        elseif v71.KeyCode == Enum.KeyCode.Down then
            v69.startPressHold(v60, v71);
            return;
        elseif v71.KeyCode == Enum.KeyCode.Left then
            v69.startPressHold(v64, v71);
            return;
        else
            if v71.KeyCode == Enum.KeyCode.Right then
                v69.startPressHold(v68, v71);
            end;
            return;
        end;
    end, {
        v69.startPressHold, 
        v55, 
        v60, 
        v64, 
        v68
    });
    v11(v70.inputEndedSignal, function(v72) --[[ Line: 347 ]]
        -- upvalues: v69 (copy)
        if v72.KeyCode == Enum.KeyCode.Up or v72.KeyCode == Enum.KeyCode.Down or v72.KeyCode == Enum.KeyCode.Left or v72.KeyCode == Enum.KeyCode.Right then
            v69.endHold(v72);
        end;
    end, {
        v69.endHold
    });
end;