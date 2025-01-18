local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent.Parent.Cryo);
local v2 = require(script.Parent.Parent.NavigationSymbol);
local v3 = require(script.Parent.Parent.utils.validate);
local v4 = v2("APP_NAVIGATION_CONTEXT");
local v5 = v0.Component:extend("NavigationProvider");
v5.init = function(v6) --[[ Line: 11 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_navigation_0 = v6.props.navigation;
    v3(l_navigation_0 ~= nil, "AppNavigationContext.Provider requires a 'navigation' prop.");
    v6._context[v4] = {
        navigation = l_navigation_0
    };
end;
v5.render = function(v8) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy)
    return v0.oneChild(v8.props[v0.Children]);
end;
local v9 = v0.Component:extend("NavigationConsumer");
v9.render = function(v10) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v3 (copy)
    local l_render_0 = v10.props.render;
    local v12 = v10._context[v4] or {};
    local v13 = v10.props.navigation or v12.navigation;
    v3(l_render_0 ~= nil, "AppNavigationContext.Consumer requires 'render' prop.");
    v3(v13 ~= nil, "AppNavigationContext.Consumer requires a navigation prop or context entry.");
    return l_render_0(v13);
end;
return {
    Provider = v5, 
    Consumer = v9, 
    connect = function(v14) --[[ Line: 36 ]] --[[ Name: connect ]]
        -- upvalues: v0 (copy), v9 (copy), v1 (copy)
        local v15 = string.format("NavigationConnection(%s)", (tostring(v14)));
        local v16 = v0.Component:extend(v15);
        v16.render = function(v17) --[[ Line: 40 ]] --[[ Name: render ]]
            -- upvalues: v0 (ref), v9 (ref), v14 (copy), v1 (ref)
            local l_props_0 = v17.props;
            return v0.createElement(v9, {
                navigation = l_props_0.navigation, 
                render = function(v19) --[[ Line: 45 ]] --[[ Name: render ]]
                    -- upvalues: v0 (ref), v14 (ref), v1 (ref), l_props_0 (copy)
                    return v0.createElement(v14, v1.Dictionary.join({
                        navigation = v19
                    }, l_props_0));
                end
            });
        end;
        return v16;
    end
};