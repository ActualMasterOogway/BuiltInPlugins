local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Utility.EditingMode);
local v4 = require(l_Parent_0.Src.Utility.StatusMessage);
local v5 = require(l_Parent_0.Src.Actions.BeginSelectingPivot);
local v6 = require(l_Parent_0.Src.Actions.DoneSelectingPivot);
local v7 = require(l_Parent_0.Src.Actions.SelectObjectForEditing);
local v8 = require(l_Parent_0.Src.Actions.SelectInvalidSelection);
local l_join_0 = v1.join;
local v10 = {
    targetObject = nil, 
    editingMode = v3.None, 
    statusMessage = v4.None
};
return v2.createReducer(v10, {
    [v5.name] = function(v11, v12) --[[ Line: 28 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v11, {
            editingMode = v12.editingMode, 
            statusMessage = v12.statusMessage
        });
    end, 
    [v6.name] = function(v13, _) --[[ Line: 34 ]]
        -- upvalues: l_join_0 (copy), v3 (copy), v4 (copy)
        return l_join_0(v13, {
            editingMode = v3.Transform, 
            statusMessage = v4.None
        });
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 40 ]]
        -- upvalues: l_join_0 (copy), v3 (copy), v4 (copy)
        return l_join_0(v15, {
            targetObject = v16.targetObject, 
            editingMode = v3.Transform, 
            statusMessage = v4.None
        });
    end, 
    [v8.name] = function(v17, v18) --[[ Line: 47 ]]
        -- upvalues: l_join_0 (copy), v1 (copy), v3 (copy)
        return l_join_0(v17, {
            targetObject = v1.None, 
            editingMode = v3.None, 
            statusMessage = v18.statusMessage
        });
    end
});