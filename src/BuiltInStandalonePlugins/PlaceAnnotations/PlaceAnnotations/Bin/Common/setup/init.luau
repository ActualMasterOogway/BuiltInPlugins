local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
return function(v2, v3) --[[ Line: 11 ]] --[[ Name: setup ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v1 (copy)
    v2.Name = l_script_FirstAncestor_0.Name;
    local l_RunService_0 = game:GetService("RunService");
    local v5 = v1.get() == v1.Standalone;
    local v6 = l_RunService_0:IsEdit();
    if v5 or v6 then
        v3(v2);
    end;
end;