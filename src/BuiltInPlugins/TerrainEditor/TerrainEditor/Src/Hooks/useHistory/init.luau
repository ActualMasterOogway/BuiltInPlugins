local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
return function(v6, v7, v8) --[[ Line: 10 ]] --[[ Name: useHistory ]]
    -- upvalues: l_useRef_0 (copy), l_useEffect_0 (copy), l_ChangeHistoryService_0 (copy), l_useCallback_0 (copy)
    local v9 = l_useRef_0(v6);
    local v10 = l_useRef_0({});
    local v11 = l_useRef_0({});
    l_useEffect_0(function() --[[ Line: 15 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v10 (copy), v11 (copy), v9 (copy), v7 (copy)
        local v17 = l_ChangeHistoryService_0.OnUndo:Connect(function(v12) --[[ Line: 16 ]]
            -- upvalues: v10 (ref), v11 (ref), v9 (ref), v7 (ref)
            local l_current_0 = v10.current;
            local l_current_1 = v11.current;
            if not l_current_0[v12] or #l_current_0[v12] == 0 then
                return;
            else
                if not l_current_1[v12] then
                    l_current_1[v12] = {};
                end;
                local v15 = #l_current_0[v12];
                local v16 = l_current_0[v12][v15];
                table.insert(l_current_1[v12], v9.current);
                table.remove(l_current_0[v12], v15);
                v9.current = v16;
                v7(v16);
                v10.current = l_current_0;
                v11.current = l_current_1;
                return;
            end;
        end);
        local v23 = l_ChangeHistoryService_0.OnRedo:Connect(function(v18) --[[ Line: 44 ]]
            -- upvalues: v10 (ref), v11 (ref), v9 (ref), v7 (ref)
            local l_current_2 = v10.current;
            local l_current_3 = v11.current;
            if not l_current_3[v18] or #l_current_3[v18] == 0 then
                return;
            else
                local v21 = #l_current_3[v18];
                local v22 = l_current_3[v18][v21];
                table.insert(l_current_2[v18], v9.current);
                table.remove(l_current_3[v18], v21);
                v9.current = v22;
                v7(v22);
                v10.current = l_current_2;
                v11.current = l_current_3;
                return;
            end;
        end);
        return function() --[[ Line: 67 ]]
            -- upvalues: v17 (copy), v23 (copy)
            v17:Disconnect();
            v23:Disconnect();
        end;
    end, v8);
    l_useEffect_0(function() --[[ Line: 73 ]]
        -- upvalues: v10 (copy), v11 (copy)
        v10.current = {};
        v11.current = {};
    end, v8);
    return (l_useCallback_0(function(v24, v25) --[[ Line: 78 ]]
        -- upvalues: v10 (copy), v11 (copy), l_ChangeHistoryService_0 (ref), v9 (copy)
        local l_current_4 = v10.current;
        if not l_current_4[v24] then
            l_current_4[v24] = {};
        end;
        v11.current = {};
        l_ChangeHistoryService_0:SetWaypoint(v24);
        table.insert(l_current_4[v24], table.clone(v9.current));
        v9.current = v25;
        v10.current = l_current_4;
    end, v8));
end;