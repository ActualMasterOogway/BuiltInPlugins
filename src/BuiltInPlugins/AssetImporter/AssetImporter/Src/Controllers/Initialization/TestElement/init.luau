local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v3 = v1.PureComponent:extend("TestElement");
v3.render = function(v4) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy)
    local l_props_0 = v4.props;
    return l_ContextServices_0.provide(l_props_0.ContextItems, l_props_0.Payload);
end;
return v3;