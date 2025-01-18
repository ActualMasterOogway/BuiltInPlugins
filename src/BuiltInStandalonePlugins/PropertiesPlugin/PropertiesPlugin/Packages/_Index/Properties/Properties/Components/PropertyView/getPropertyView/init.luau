local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Components.PropertyView.BasicPropertyView);
local v2 = require(l_script_FirstAncestor_0.Components.PropertyView.StringPropertyView);
local v3 = require(l_script_FirstAncestor_0.Components.PropertyView.Vector3PropertyView);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = {
    string = v2, 
    Vector3 = v3
};
local v6 = {};
return function(v7) --[[ Line: 22 ]] --[[ Name: getPropertyView ]]
    -- upvalues: v6 (copy), v5 (copy), v1 (copy)
    local v8 = v6[v7.id.propertyName] or v5[v7.value.typeof];
    if v8 then
        return v8;
    else
        return v1;
    end;
end;