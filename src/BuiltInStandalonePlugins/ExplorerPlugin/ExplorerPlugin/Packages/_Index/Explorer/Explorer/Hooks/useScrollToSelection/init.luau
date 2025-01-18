local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagExplorerDontFocusViewport);
local v6 = require(l_script_FirstAncestor_0.Util.isNodeVisible);
return function(v7, v8) --[[ Line: 10 ]] --[[ Name: useScrollToSelection ]]
    -- upvalues: v3 (copy), v6 (copy), v1 (copy), v2 (copy), v5 (copy)
    local v16 = v3.useCallback(function(v9, v10) --[[ Line: 12 ]]
        -- upvalues: v7 (copy), v6 (ref), v1 (ref)
        local v11 = v7.getIndexOfInstanceId(v9);
        if v11 == nil then
            return false;
        else
            local v12 = v7.getExplorerNodeById(v9);
            if v12 and not v6(v12) then
                return false;
            else
                local v13 = v1.explorerRowHeight * v11;
                if v10.CanvasPosition.Y <= v13 and v13 <= v10.CanvasPosition.Y + v10.AbsoluteWindowSize.Y + v1.explorerRowHeight then
                    return true;
                else
                    local v14 = v10.AbsoluteWindowSize.Y * 0.25;
                    if v14 <= v1.explorerRowHeight then
                        v14 = 0;
                    end;
                    local v15 = v1.explorerRowHeight * (v11 - 1) - v14;
                    v10.CanvasPosition = Vector2.new(v10.CanvasPosition.X, v15);
                    return true;
                end;
            end;
        end;
    end, {
        v7.getIndexOfInstanceId, 
        v7.getExplorerNodeById
    });
    local v17 = v3.useRef({});
    v2.useEffect(v7.selectedIdsObservable, function(v18) --[[ Line: 54 ]]
        -- upvalues: v8 (copy), v17 (copy), v16 (copy)
        local l_current_0 = v8.current;
        if l_current_0 == nil then
            return;
        else
            for v20 in v18 do
                if not v17.current[v20] and v16(v20, l_current_0) then
                    break;
                end;
            end;
            v17.current = v18;
            return;
        end;
    end, {});
    v7.focusRequestedSignal:Connect(function() --[[ Line: 74 ]]
        -- upvalues: v5 (ref), v7 (copy), v8 (copy), v16 (copy)
        if not v5() then
            v7.setListenForFocus(false);
            v7.triggerFocus();
        end;
        local l_current_1 = v8.current;
        if l_current_1 == nil then
            return;
        else
            local v22 = v7.selectedIdsObservable.get();
            task.spawn(function() --[[ Line: 87 ]]
                -- upvalues: v22 (copy), v7 (ref), v16 (ref), l_current_1 (copy)
                for v23 in v22 do
                    local v24 = v7.getExplorerNodeById(v23);
                    if v24 and v24.parent then
                        v7.expandAsync(v24.parent.datum.id);
                    end;
                end;
                for v25 in v22 do
                    if v16(v25, l_current_1) then
                        break;
                    end;
                end;
            end);
            return;
        end;
    end);
end;