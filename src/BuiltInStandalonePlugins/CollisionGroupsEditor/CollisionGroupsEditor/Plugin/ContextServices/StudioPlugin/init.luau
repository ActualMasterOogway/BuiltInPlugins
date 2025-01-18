local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Util.Symbol).named("StudioPlugin");
local v3 = v1.PureComponent:extend("PluginProvider");
v3.init = function(v4) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local l_plugin_0 = v4.props.plugin;
    assert(l_plugin_0 ~= nil, "PluginProvider expected to be given the plugin");
    v4._context[v2] = l_plugin_0;
end;
v3.render = function(v6) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.oneChild(v6.props[v1.Children]);
end;
return {
    Provider = v3, 
    getPlugin = function(v7) --[[ Line: 25 ]] --[[ Name: getPlugin ]]
        -- upvalues: v2 (copy)
        assert(v7 ~= nil, "A component must be provided");
        assert(v7._context[v2] ~= nil, "A PluginProvider was not put into the Roact tree");
        return v7._context[v2];
    end
};