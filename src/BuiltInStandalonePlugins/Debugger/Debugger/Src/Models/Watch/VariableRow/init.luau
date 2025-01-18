local _ = require(script.Parent.WatchWindowTableRow);
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Mocks.DebuggerVariable);
local v3 = require(l_Parent_0.Util.Constants);
local v4 = require(l_Parent_0.Util.WatchHelperFunctions);
local function v6(v5) --[[ Line: 12 ]] --[[ Name: fromData ]]
    return {
        nameColumn = v5.name, 
        pathColumn = v5.path, 
        idColumn = v5.id, 
        scopeColumn = v5.scope, 
        valueColumn = v5.value, 
        dataTypeColumn = v5.dataType, 
        childPaths = v5.childPaths or {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v14(v7, v8, v9, v10, v11) --[[ Line: 27 ]] --[[ Name: fromInstance ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v12 = if v8 then v8.pathColumn .. v3.SeparationToken else "";
    local v13 = {
        nameColumn = v7.Name, 
        pathColumn = v12 .. v7.Name, 
        idColumn = v7.VariableId, 
        scopeColumn = v8 and v8.scopeColumn or v9, 
        valueColumn = v7.Value, 
        dataTypeColumn = v7.Type, 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
    v13.textFilteredOut = not v4.textMatchRow(v10, v13);
    v13.scopeFilteredOut = v4.isScopeFiltered(v11, v13);
    return v13;
end;
return {
    fromData = v6, 
    fromInstance = v14, 
    dummyRow = function(v15, v16, v17) --[[ Line: 54 ]] --[[ Name: dummyRow ]]
        -- upvalues: v14 (copy), v2 (copy)
        return (v14(v2.newDummyRow(), v15, "", v16, v17));
    end
};