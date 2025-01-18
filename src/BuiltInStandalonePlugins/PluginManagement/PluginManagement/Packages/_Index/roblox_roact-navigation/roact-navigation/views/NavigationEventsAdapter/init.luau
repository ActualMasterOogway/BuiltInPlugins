local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.AppNavigationContext);
local v2 = require(script.Parent.Parent.NavigationEvents);
local v3 = require(script.Parent.Parent.utils.validate);
local v4 = v0.Component:extend("NavigationEventsAdapter");
v4.init = function(v5) --[[ Line: 41 ]] --[[ Name: init ]]
    v5.subscriptions = {};
end;
v4._subscribeAll = function(v6) --[[ Line: 45 ]] --[[ Name: _subscribeAll ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_navigation_0 = v6.props.navigation;
    assert(l_navigation_0 ~= nil, "NavigationEventsAdapter can only be used within the view hierarchy of a navigator.");
    for _, v9 in pairs(v2) do
        v6.subscriptions[v9] = l_navigation_0.addListener(v9, function(...) --[[ Line: 50 ]]
            -- upvalues: v6 (copy), v9 (copy), v3 (ref)
            local v10 = v6.props[v9] or nil;
            if v10 then
                v3(type(v10) == "function", "Value for event '%s' must be a function callback", (tostring(v9)));
                v10(...);
            end;
        end);
    end;
end;
v4._disconnectAll = function(v11) --[[ Line: 61 ]] --[[ Name: _disconnectAll ]]
    -- upvalues: v2 (copy)
    for _, v13 in pairs(v2) do
        local v14 = v11.subscriptions[v13];
        if v14 then
            v14.disconnect();
            v11.subscriptions[v13] = nil;
        end;
    end;
end;
v4.didMount = function(v15) --[[ Line: 71 ]] --[[ Name: didMount ]]
    v15:_subscribeAll();
end;
v4.willUnmount = function(v16) --[[ Line: 75 ]] --[[ Name: willUnmount ]]
    v16:_disconnectAll();
end;
v4.didUpdate = function(v17, v18) --[[ Line: 79 ]] --[[ Name: didUpdate ]]
    if v17.props.navigation ~= v18.navigation then
        v17:_disconnectAll();
        v17:_subscribeAll();
    end;
end;
v4.render = function(v19) --[[ Line: 87 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy)
    return v0.createElement("Folder", nil, v19.props[v0.Children]);
end;
return v1.connect(v4);