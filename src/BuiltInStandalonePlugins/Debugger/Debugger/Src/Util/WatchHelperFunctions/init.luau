local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return {
    textMatchRow = function(v3, v4) --[[ Line: 7 ]]
        local v5 = v3:lower();
        if v4.nameColumn ~= nil and string.find(v4.nameColumn:lower(), v5) ~= nil then
            return true;
        elseif v4.expressionColumn ~= nil and string.find(v4.expressionColumn:lower(), v5) ~= nil then
            return true;
        elseif string.find(v4.scopeColumn:lower(), v5) ~= nil then
            return true;
        elseif string.find(v4.valueColumn:lower(), v5) ~= nil then
            return true;
        elseif string.find(v4.dataTypeColumn:lower(), v5) ~= nil then
            return true;
        else
            return false;
        end;
    end, 
    isScopeFiltered = function(v6, v7) --[[ Line: 36 ]]
        assert(v7 ~= nil, ("isScopeFiltered got a nil node for path %s"):format((tostring(v7))));
        for _, v9 in ipairs(v6) do
            if string.find(v7.scopeColumn, v9) then
                return false;
            end;
        end;
        return true;
    end, 
    evaluateWatchWithCallback = function(v10, v11, v12, v13, v14) --[[ Line: 47 ]]
        -- upvalues: v1 (copy)
        local l_debuggerStateToken_0 = v11.debuggerStateToken;
        if l_debuggerStateToken_0 ~= v13:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_0.debuggerConnectionId] then
            v14(nil);
        end;
        if v12 == nil then
            assert(false);
        end;
        local l_v12_ThreadById_0 = v12:GetThreadById(v11.threadId);
        if l_v12_ThreadById_0 == nil then
            assert(false);
        end;
        local l_l_v12_ThreadById_0_Frame_0 = l_v12_ThreadById_0:GetFrame(v11.frameNumber - 1);
        if l_l_v12_ThreadById_0_Frame_0 == nil then
            assert(false);
        end;
        v12:EvaluateWatch(v10, l_l_v12_ThreadById_0_Frame_0, function(v18) --[[ Line: 74 ]]
            -- upvalues: v11 (copy), v13 (copy), v14 (copy), v1 (ref)
            local l_debuggerStateToken_1 = v11.debuggerStateToken;
            if l_debuggerStateToken_1 ~= v13:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_1.debuggerConnectionId] then
                v14(nil);
            end;
            if tostring(v18.Status) ~= v1.DebuggerStatus.Success then
                v14(nil);
            end;
            v14(v18:GetArg());
        end);
    end, 
    sortTableByColumnAndOrder = function(v20, v21, v22, v23, v24, v25) --[[ Line: 89 ]]
        local v26 = v22 or Enum.SortDirection.Descending;
        local v27 = nil;
        local v28 = false;
        if v21 == nil then
            v28 = v22 == nil;
        end;
        if v28 and v25 and #v25 > 0 then
            v27 = v25[1];
        else
            local v29 = v23[v21] and v21 or 1;
            v27 = v23[v21] and v23[v21] or v23[v29];
        end;
        local function v37(v30, v31, v32) --[[ Line: 107 ]]
            local l_v30_0 = v30;
            local l_v31_0 = v31;
            if type(l_v30_0) == "boolean" then
                l_v30_0 = l_v30_0 and 1 or 0;
                l_v31_0 = l_v31_0 and 1 or 0;
            elseif type(l_v30_0) == "string" then
                local v35 = string.lower(l_v30_0);
                local v36 = string.lower(l_v31_0);
                if v35 ~= v36 then
                    l_v30_0 = v35;
                    l_v31_0 = v36;
                end;
            end;
            if v32 == Enum.SortDirection.Ascending then
                return l_v31_0 < l_v30_0;
            else
                return l_v30_0 < l_v31_0;
            end;
        end;
        local function v43(v38, v39) --[[ Line: 132 ]]
            -- upvalues: v27 (ref), v25 (copy), v23 (copy), v37 (copy), v26 (copy)
            if v38[v27] == v39[v27] then
                local v40 = if v25 then v25 else v23;
                for _, v42 in ipairs(v40) do
                    if v38[v42] ~= v39[v42] then
                        return (v37(v38[v42], v39[v42], Enum.SortDirection.Descending));
                    end;
                end;
                return false;
            else
                return (v37(v38[v27], v39[v27], v26));
            end;
        end;
        local v44 = nil;
        if v24 and #v20 > 0 then
            v44 = table.remove(v20);
        end;
        table.sort(v20, v43);
        if v24 and v44 then
            table.insert(v20, v44);
        end;
    end
};