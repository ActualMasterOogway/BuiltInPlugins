local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextItem_0 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem;
local v4 = require(l_Parent_0.Src.Util.Symbol).named("NetworkInterface");
local v5 = v2.PureComponent:extend("NetworkContext");
v5.init = function(v6, v7) --[[ Line: 13 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v6._context[v4] = v7.networkInterface;
end;
v5.render = function(v8) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    return v2.oneChild(v8.props[v2.Children]);
end;
return l_ContextItem_0:createSimple("Network");