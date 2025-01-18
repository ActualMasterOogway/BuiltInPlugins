local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
local v3 = require(l_Parent_0.Core.Util.DebugFlags);
return l_Action_0(script.Name, function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy)
    if v3.shouldDebugWarnings() and v4 and type(v4.creator) == "table" and v4.creator.Id ~= nil and v4.creator.Type == nil then
        warn("Setting PageInfo.creator without a type");
    end;
    return {
        changes = v4, 
        settings = v5
    };
end);