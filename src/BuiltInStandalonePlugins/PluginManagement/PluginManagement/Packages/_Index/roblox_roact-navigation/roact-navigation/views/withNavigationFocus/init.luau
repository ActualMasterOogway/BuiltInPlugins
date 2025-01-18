local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent.NavigationEvents);
local v2 = require(script.Parent.AppNavigationContext);
local v3 = require(script.Parent.Parent.utils.validate);
local v4 = v0.Component:extend("NavigationFocusComponent");
v4.init = function(v5) --[[ Line: 33 ]] --[[ Name: init ]]
    local l_navigation_0 = v5.props.navigation;
    v5.state = {
        isFocused = l_navigation_0 and l_navigation_0.isFocused() or false
    };
end;
v4.didMount = function(v7) --[[ Line: 40 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_navigation_1 = v7.props.navigation;
    v3(l_navigation_1 ~= nil, "withNavigationFocus can only be used within the view hierarchy of a navigator. " .. "The wrapped component cannot access 'navigation' from props or context.");
    v7._didFocusListener = l_navigation_1.addListener(v1.DidFocus, function() --[[ Line: 46 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            isFocused = true
        });
    end);
    v7._willBlurListener = l_navigation_1.addListener(v1.WillBlur, function() --[[ Line: 53 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            isFocused = false
        });
    end);
end;
v4.willUnmount = function(v9) --[[ Line: 61 ]] --[[ Name: willUnmount ]]
    if v9._didFocusListener then
        v9._didFocusListener:disconnect();
        v9._didFocusListener = nil;
    end;
    if v9._willBlurListener then
        v9._willBlurListener:disconnect();
        v9._willBlurListener = nil;
    end;
end;
v4.render = function(v10) --[[ Line: 73 ]] --[[ Name: render ]]
    local l_isFocused_0 = v10.state.isFocused;
    local l_navigation_2 = v10.props.navigation;
    return v10.props.render(l_navigation_2, l_isFocused_0);
end;
v4 = v2.connect(v4);
return function(v13) --[[ Line: 83 ]]
    -- upvalues: v3 (copy), v0 (copy), v4 (ref)
    v3(v13 ~= nil, "withNavigationFocus must be passed a render prop");
    return v0.createElement(v4, {
        render = v13
    });
end;