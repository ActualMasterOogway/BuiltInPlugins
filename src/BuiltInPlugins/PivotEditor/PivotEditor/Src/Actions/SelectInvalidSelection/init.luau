local l_Parent_0 = script.Parent.Parent.Parent;
local l_Framework_0 = l_Parent_0.Packages.Framework;
local l_Action_0 = require(l_Framework_0).Util.Action;
local v3 = require(l_Parent_0.Src.Utility.EditingMode);
return l_Action_0(script.Name, function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    assert(type(v4) == "string");
    return {
        statusMessage = v4, 
        editingMode = v3.None
    };
end);