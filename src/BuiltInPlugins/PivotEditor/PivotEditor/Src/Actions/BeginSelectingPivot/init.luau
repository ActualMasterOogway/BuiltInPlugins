local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Utility.EditingMode);
local l_Framework_0 = l_Parent_0.Packages.Framework;
local l_Action_0 = require(l_Framework_0).Util.Action;
local v4 = {
    [v1.SelectGeometry] = true, 
    [v1.SelectSurface] = true, 
    [v1.SelectPart] = true
};
return l_Action_0(script.Name, function(v5, v6) --[[ Line: 15 ]]
    -- upvalues: v1 (copy), v4 (copy)
    assert(v1.isEnumValue(v5));
    assert(v4[v5]);
    assert(type(v6) == "string");
    return {
        editingMode = v5, 
        statusMessage = v6
    };
end);