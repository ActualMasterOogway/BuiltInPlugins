local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.ContextServices.Navigation);
local v4 = v1.Component:extend("NavigatableView");
v4.init = function(v5) --[[ Line: 12 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v5.navigation = v3.new({
        navigation = v5.props.navigation
    });
end;
v4.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy)
    return l_ContextServices_0.provide({
        v6.navigation
    }, {
        v6.props[v1.Children]
    });
end;
return v4;