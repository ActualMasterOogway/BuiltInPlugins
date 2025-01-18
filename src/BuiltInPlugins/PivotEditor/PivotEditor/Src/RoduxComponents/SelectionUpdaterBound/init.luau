local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Src.Actions.SelectObjectForEditing);
local v3 = require(l_Parent_0.Src.Actions.SelectInvalidSelection);
local v4 = require(l_Parent_0.Src.Components.SelectionUpdater);
return v1.connect(function(v5, _) --[[ Line: 10 ]] --[[ Name: mapStateToProps ]]
    return {
        targetObject = v5.targetObject
    };
end, function(v7) --[[ Line: 16 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v2 (copy), v3 (copy)
    return {
        selectObjectForEditing = function(v8) --[[ Line: 18 ]] --[[ Name: selectObjectForEditing ]]
            -- upvalues: v7 (copy), v2 (ref)
            v7(v2(v8));
        end, 
        selectInvalidSelection = function(v9) --[[ Line: 21 ]] --[[ Name: selectInvalidSelection ]]
            -- upvalues: v7 (copy), v3 (ref)
            v7(v3(v9));
        end
    };
end)(v4);