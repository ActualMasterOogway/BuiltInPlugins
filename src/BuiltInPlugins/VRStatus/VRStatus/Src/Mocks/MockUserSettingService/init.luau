local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v2 (copy)
    local v3 = {
        VREnabledSignal = l_Signal_0.new(), 
        VREnabled = false
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.GetPropertyChangedSignal = function(v4, v5) --[[ Line: 16 ]] --[[ Name: GetPropertyChangedSignal ]]
    if v5 == "VREnabled" then
        return v4.VREnabledSignal;
    else
        return nil;
    end;
end;
return v2;