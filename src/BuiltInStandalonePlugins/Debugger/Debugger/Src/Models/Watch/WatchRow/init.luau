local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Mocks.DebuggerVariable);
local v2 = require(l_Parent_0.Util.Constants);
local _ = require(script.Parent.WatchWindowTableRow);
local function v5(v4) --[[ Line: 10 ]] --[[ Name: fromExpression ]]
    return {
        expressionColumn = v4, 
        pathColumn = v4, 
        scopeColumn = "", 
        valueColumn = "", 
        dataTypeColumn = "", 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v7(v6) --[[ Line: 24 ]] --[[ Name: fromData ]]
    return {
        expressionColumn = v6.expression, 
        pathColumn = v6.path, 
        scopeColumn = v6.scope, 
        valueColumn = v6.value, 
        dataTypeColumn = v6.dataType, 
        childPaths = v6.childPaths or {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v10(v8, v9) --[[ Line: 38 ]] --[[ Name: fromInstance ]]
    return {
        expressionColumn = v9, 
        pathColumn = v9, 
        idColumn = v8.VariableId, 
        scopeColumn = "", 
        valueColumn = v8.Value, 
        dataTypeColumn = v8.Type, 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v14(v11, v12) --[[ Line: 53 ]] --[[ Name: fromChildInstance ]]
    -- upvalues: v2 (copy)
    local v13 = v12 .. v2.SeparationToken;
    return {
        expressionColumn = v11.Name, 
        pathColumn = v13 .. v11.Name, 
        idColumn = v11.VariableId, 
        scopeColumn = "", 
        valueColumn = v11.Value, 
        dataTypeColumn = v11.Type, 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
return {
    fromData = v7, 
    fromExpression = v5, 
    fromInstance = v10, 
    fromChildInstance = v14, 
    dummyRow = function(v15) --[[ Line: 70 ]] --[[ Name: dummyRow ]]
        -- upvalues: v14 (copy), v1 (copy)
        return (v14(v1.newDummyRow(), v15.pathColumn));
    end
};