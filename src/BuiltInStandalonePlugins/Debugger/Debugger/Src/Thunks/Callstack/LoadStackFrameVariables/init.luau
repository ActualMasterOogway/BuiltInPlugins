local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.Watch.ScopeEnum);
local _ = require(l_Models_0.StepStateBundle);
local v4 = require(l_Parent_0.Src.Models.Watch.VariableRow);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.Watch.AddRootVariables);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v8 = require(l_Thunks_0.Common.AddChildRowsToVars);
local function v26(v9, v10, v11, v12) --[[ Line: 14 ]] --[[ Name: addRootVarsAndChildren ]]
    -- upvalues: v4 (copy), v2 (copy), v6 (copy), v8 (copy)
    local l_filterText_0 = v11:getState().Watch.filterText;
    local l_listOfEnabledScopes_0 = v11:getState().Watch.listOfEnabledScopes;
    local l_Children_0 = v10.Locals:GetChildren();
    local l_Children_1 = v10.Globals:GetChildren();
    local l_Children_2 = v10.Upvalues:GetChildren();
    local v18 = {};
    local v19 = {};
    for _, v21 in ipairs(l_Children_0) do
        table.insert(v18, v4.fromInstance(v21, nil, v2.Local, l_filterText_0, l_listOfEnabledScopes_0));
        table.insert(v19, v21);
    end;
    for _, v23 in ipairs(l_Children_1) do
        table.insert(v18, v4.fromInstance(v23, nil, v2.Global, l_filterText_0, l_listOfEnabledScopes_0));
        table.insert(v19, v23);
    end;
    for _, v25 in ipairs(l_Children_2) do
        table.insert(v18, v4.fromInstance(v25, nil, v2.Upvalue, l_filterText_0, l_listOfEnabledScopes_0));
        table.insert(v19, v25);
    end;
    v11:dispatch(v6(v12, v18));
    v11:dispatch(v8("", v19, v12, true, v9));
end;
local function _(v27, v28, v29, v30, v31, v32) --[[ Line: 50 ]] --[[ Name: onScopePopulated ]]
    -- upvalues: v2 (copy), v26 (copy)
    v28[v27] = true;
    if v28[v2.Local] and v28[v2.Global] and v28[v2.Upvalue] then
        v26(v29, v30, v31, v32);
    end;
end;
local function v60(v34, v35, v36, v37) --[[ Line: 68 ]] --[[ Name: populateStackVariables ]]
    -- upvalues: v2 (copy), v26 (copy)
    local v38 = {};
    v34:Populate(v35.Locals, function() --[[ Line: 71 ]]
        -- upvalues: v37 (copy), v36 (copy), v2 (ref), v38 (copy), v34 (copy), v35 (copy), v26 (ref)
        local l_debuggerStateToken_0 = v37.debuggerStateToken;
        if l_debuggerStateToken_0 ~= v36:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_0.debuggerConnectionId] then
            return;
        else
            local l_Local_0 = v2.Local;
            local l_v38_0 = v38;
            local l_v34_0 = v34;
            local l_v35_0 = v35;
            local l_v36_0 = v36;
            local l_v37_0 = v37;
            l_v38_0[l_Local_0] = true;
            if l_v38_0[v2.Local] and l_v38_0[v2.Global] and l_v38_0[v2.Upvalue] then
                v26(l_v34_0, l_v35_0, l_v36_0, l_v37_0);
            end;
            return;
        end;
    end);
    v34:Populate(v35.Globals, function() --[[ Line: 78 ]]
        -- upvalues: v37 (copy), v36 (copy), v2 (ref), v38 (copy), v34 (copy), v35 (copy), v26 (ref)
        local l_debuggerStateToken_1 = v37.debuggerStateToken;
        if l_debuggerStateToken_1 ~= v36:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_1.debuggerConnectionId] then
            return;
        else
            local l_Global_0 = v2.Global;
            local l_v38_1 = v38;
            local l_v34_1 = v34;
            local l_v35_1 = v35;
            local l_v36_1 = v36;
            local l_v37_1 = v37;
            l_v38_1[l_Global_0] = true;
            if l_v38_1[v2.Local] and l_v38_1[v2.Global] and l_v38_1[v2.Upvalue] then
                v26(l_v34_1, l_v35_1, l_v36_1, l_v37_1);
            end;
            return;
        end;
    end);
    v34:Populate(v35.Upvalues, function() --[[ Line: 85 ]]
        -- upvalues: v37 (copy), v36 (copy), v2 (ref), v38 (copy), v34 (copy), v35 (copy), v26 (ref)
        local l_debuggerStateToken_2 = v37.debuggerStateToken;
        if l_debuggerStateToken_2 ~= v36:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_2.debuggerConnectionId] then
            return;
        else
            local l_Upvalue_0 = v2.Upvalue;
            local l_v38_2 = v38;
            local l_v34_2 = v34;
            local l_v35_2 = v35;
            local l_v36_2 = v36;
            local l_v37_2 = v37;
            l_v38_2[l_Upvalue_0] = true;
            if l_v38_2[v2.Local] and l_v38_2[v2.Global] and l_v38_2[v2.Upvalue] then
                v26(l_v34_2, l_v35_2, l_v36_2, l_v37_2);
            end;
            return;
        end;
    end);
end;
return function(v61, v62, v63) --[[ Line: 94 ]]
    -- upvalues: v60 (copy)
    return function(v64, _) --[[ Line: 95 ]]
        -- upvalues: v62 (copy), v61 (copy), v63 (copy), v60 (ref)
        if not v62.Populated then
            v61:Populate(v62, function() --[[ Line: 97 ]]
                -- upvalues: v63 (ref), v64 (copy), v60 (ref), v61 (ref), v62 (ref)
                local l_debuggerStateToken_3 = v63.debuggerStateToken;
                if l_debuggerStateToken_3 ~= v64:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_3.debuggerConnectionId] then
                    return;
                else
                    v60(v61, v62, v64, v63);
                    return;
                end;
            end);
        end;
    end;
end;