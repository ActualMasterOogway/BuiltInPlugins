local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local l_Models_0 = l_Parent_0.Src.Models;
local _ = require(l_Models_0.StepStateBundle);
local v4 = require(l_Models_0.Watch.VariableRow);
local v5 = require(l_Models_0.Watch.WatchRow);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v7 = require(l_Actions_0.Watch.AddChildVariables);
local v8 = require(l_Actions_0.Watch.AddChildExpression);
local v9 = require(l_Actions_0.Watch.RemoveDummyVariableFromParent);
local v10 = require(l_Parent_0.Common.defineLuaFlags);
local v11 = nil;
local function _(v12) --[[ Line: 21 ]] --[[ Name: shouldAddDummyChildRow ]]
    if v12.Type == "LazyTable" then
        local l_Value_0 = v12.Value;
        return string.sub(l_Value_0, string.len(l_Value_0) - 3 + 1, (string.len(l_Value_0))) ~= " {}";
    else
        return true;
    end;
end;
local function v34(v15, v16, v17, v18, v19, v20) --[[ Line: 33 ]] --[[ Name: populateChild ]]
    -- upvalues: v9 (copy), v4 (copy), v5 (copy), v7 (copy), v8 (copy), v11 (ref), v10 (copy)
    local v21 = v20:getState();
    local l_filterText_0 = v21.Watch.filterText;
    local l_listOfEnabledScopes_0 = v21.Watch.listOfEnabledScopes;
    local v24 = v21.Watch.stateTokenToFlattenedTree[v17.debuggerStateToken][v17.threadId][v17.frameNumber];
    local v25 = if v18 then v24.Variables[v16] else v24.Watches[v16];
    if if v18 then v21.Watch.pathToExpansionState[v16] else v21.Watch.expressionToExpansionState[v16] then
        if v15.Populated then
            return;
        else
            v19:Populate(v15, function() --[[ Line: 50 ]]
                -- upvalues: v17 (copy), v20 (copy), v9 (ref), v16 (copy), v18 (copy), v15 (copy), v4 (ref), v25 (copy), l_filterText_0 (copy), l_listOfEnabledScopes_0 (copy), v5 (ref), v7 (ref), v8 (ref), v11 (ref), v19 (copy)
                local l_debuggerStateToken_0 = v17.debuggerStateToken;
                if l_debuggerStateToken_0 ~= v20:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_0.debuggerConnectionId] then
                    return;
                else
                    v20:dispatch(v9(v17, v16, v18));
                    local l_v15_Children_0 = v15:GetChildren();
                    if #l_v15_Children_0 == 0 then
                        return;
                    else
                        local v28 = {};
                        for _, v30 in ipairs(l_v15_Children_0) do
                            local _ = nil;
                            table.insert(v28, if v18 then v4.fromInstance(v30, v25, nil, l_filterText_0, l_listOfEnabledScopes_0) else v5.fromChildInstance(v30, v16));
                        end;
                        if v18 then
                            v20:dispatch(v7(v17, v16, v28));
                        else
                            v20:dispatch(v8(v17, v16, v28));
                        end;
                        v11(v16, l_v15_Children_0, v17, v18, v19, v20);
                        return;
                    end;
                end;
            end);
            return;
        end;
    else
        if v10.getFFlagStudioDebuggerRemoveExpandArrowForEmptyTables() then
            local v32;
            if v15.Type == "LazyTable" then
                local l_Value_1 = v15.Value;
                v32 = string.sub(l_Value_1, string.len(l_Value_1) - 3 + 1, (string.len(l_Value_1))) ~= " {}";
            else
                v32 = true;
            end;
            if not v32 then
                return;
            end;
        end;
        if v18 then
            v20:dispatch(v7(v17, v16, {
                v4.dummyRow(v25, l_filterText_0, l_listOfEnabledScopes_0)
            }));
            return;
        else
            v20:dispatch(v8(v17, v16, {
                v5.dummyRow(v25)
            }));
            return;
        end;
    end;
end;
v11 = function(v35, v36, v37, v38, v39, v40) --[[ Line: 105 ]] --[[ Name: AddChildrenRowsToVariables ]]
    -- upvalues: v1 (copy), v34 (copy)
    for _, v42 in ipairs(v36) do
        if v42.VariableId ~= 0 then
            local v43 = if v35 == "" then v42.Name else v35 .. v1.SeparationToken .. v42.Name;
            v34(v42, v43, v37, v38, v39, v40);
        end;
    end;
end;
return function(v44, v45, v46, v47, v48) --[[ Line: 116 ]]
    -- upvalues: v11 (ref)
    return function(v49, _) --[[ Line: 123 ]]
        -- upvalues: v11 (ref), v44 (copy), v45 (copy), v46 (copy), v47 (copy), v48 (copy)
        v11(v44, v45, v46, v47, v48, v49);
    end;
end;