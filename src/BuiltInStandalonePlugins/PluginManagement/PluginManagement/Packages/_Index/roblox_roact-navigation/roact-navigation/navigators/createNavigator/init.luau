local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent.Parent.Cryo);
local v2 = require(script.Parent.Parent.utils.validate);
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy)
    local v6 = v0.Component:extend("Navigator");
    v6.router = v4;
    v6.navigationOptions = v5.navigationOptions;
    v6.init = function(v7) --[[ Line: 12 ]] --[[ Name: init ]]
        local l_screenProps_0 = v7.props.screenProps;
        v7.state = {
            descriptors = {}, 
            screenProps = l_screenProps_0
        };
    end;
    v6.getDerivedStateFromProps = function(v9, v10) --[[ Line: 21 ]] --[[ Name: getDerivedStateFromProps ]]
        -- upvalues: v2 (ref), v4 (copy)
        local l_descriptors_0 = v10.descriptors;
        local l_navigation_0 = v9.navigation;
        local l_screenProps_1 = v9.screenProps;
        v2(l_navigation_0 ~= nil, "The navigation prop is missing for this navigator");
        local l_routes_0 = l_navigation_0.state.routes;
        v2(type(l_routes_0) == "table", "No 'routes' found in navigation state. " .. "Don't try to pass the navigation prop from a Roact component to a Navigator child.");
        local v15 = {};
        for _, v17 in ipairs(l_routes_0) do
            if l_descriptors_0 and l_descriptors_0[v17.key] and v17 == l_descriptors_0[v17.key].state and l_screenProps_1 == v10.screenProps then
                v15[v17.key] = l_descriptors_0[v17.key];
            else
                local function v18() --[[ Line: 41 ]]
                    -- upvalues: v4 (ref), v17 (copy)
                    return v4.getComponentForRouteName(v17.routeName);
                end;
                local v19 = l_navigation_0.getChildNavigation(v17.key);
                local v20 = v4.getScreenOptions(v19, l_screenProps_1);
                v15[v17.key] = {
                    key = v17.key, 
                    getComponent = v18, 
                    options = v20, 
                    state = v17, 
                    navigation = v19
                };
            end;
        end;
        return {
            descriptors = v15, 
            screenProps = l_screenProps_1
        };
    end;
    v6.render = function(v21) --[[ Line: 64 ]] --[[ Name: render ]]
        -- upvalues: v0 (ref), v3 (copy), v1 (ref), v5 (copy)
        local l_navigation_1 = v21.props.navigation;
        local l_screenProps_2 = v21.state.screenProps;
        local l_descriptors_1 = v21.state.descriptors;
        return v0.createElement(v3, v1.Dictionary.join(v21.props, {
            screenProps = l_screenProps_2, 
            navigation = l_navigation_1, 
            navigationConfig = v5, 
            descriptors = l_descriptors_1
        }));
    end;
    return v6;
end;