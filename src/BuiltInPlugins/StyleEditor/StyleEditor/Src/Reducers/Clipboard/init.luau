local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local l_Clipboard_0 = l_Parent_0.Src.Actions.Clipboard;
local v4 = require(l_Clipboard_0.CopyInstanceToClipboard);
local v5 = require(l_Clipboard_0.CopyAttributeToClipboard);
local v6 = require(l_Clipboard_0.CopyPropertyToClipboard);
local v7 = {
    Instance = nil, 
    Attribute = nil, 
    Property = nil
};
return v1.createReducer(v7, {
    [v4.name] = function(v8, v9) --[[ Line: 38 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v8, {
            Instance = v9.instance
        });
    end, 
    [v5.name] = function(v10, v11) --[[ Line: 44 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v10, {
            Attribute = {
                Name = v11.attributeName, 
                Value = v11.attributeValue
            }
        });
    end, 
    [v6.name] = function(v12, v13) --[[ Line: 53 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v12, {
            Property = {
                Name = v13.propertyName, 
                Value = v13.propertyValue
            }
        });
    end
});