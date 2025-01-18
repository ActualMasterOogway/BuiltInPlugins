local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.AppNavigationContext);
local v2 = v0.PureComponent:extend("SceneView");
v2.render = function(v3) --[[ Line: 6 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy), v1 (copy)
    local l_screenProps_0 = v3.props.screenProps;
    local l_component_0 = v3.props.component;
    local l_navigation_0 = v3.props.navigation;
    return v0.createElement(v1.Provider, {
        navigation = l_navigation_0
    }, {
        Scene = v0.createElement(l_component_0, {
            screenProps = l_screenProps_0, 
            navigation = l_navigation_0
        })
    });
end;
return v2;