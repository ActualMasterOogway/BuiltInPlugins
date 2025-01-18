local v0 = require(script.Parent.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.Parent.Parent.Roact);
local v2 = require(script.Parent.Parent.Parent.NavigationActions);
local v3 = require(script.Parent.StackViewLayout);
local v4 = require(script.Parent.Parent.Transitioner);
local v5 = require(script.Parent.StackViewTransitionConfigs);
local v6 = {
    mode = require(script.Parent.StackPresentationStyle).Default
};
local v7 = v1.Component:extend("StackView");
v7.init = function(v8) --[[ Line: 16 ]] --[[ Name: init ]]
    v8._doRender = function(...) --[[ Line: 17 ]]
        -- upvalues: v8 (copy)
        return v8:_render(...);
    end;
    v8._doConfigureTransition = function(...) --[[ Line: 21 ]]
        -- upvalues: v8 (copy)
        return v8:_configureTransition(...);
    end;
    v8._doOnTransitionStart = function(...) --[[ Line: 25 ]]
        -- upvalues: v8 (copy)
        return v8:_onTransitionStart(...);
    end;
    v8._doOnTransitionEnd = function(...) --[[ Line: 29 ]]
        -- upvalues: v8 (copy)
        return v8:_onTransitionEnd(...);
    end;
    v8._doOnTransitionStep = function(...) --[[ Line: 33 ]]
        -- upvalues: v8 (copy)
        return v8:_onTransitionStep(...);
    end;
end;
v7.render = function(v9) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_screenProps_0 = v9.props.screenProps;
    local l_navigation_0 = v9.props.navigation;
    local l_descriptors_0 = v9.props.descriptors;
    return v1.createElement(v4, {
        render = v9._doRender, 
        configureTransition = v9._doConfigureTransition, 
        screenProps = l_screenProps_0, 
        navigation = l_navigation_0, 
        descriptors = l_descriptors_0, 
        onTransitionStart = v9._doOnTransitionStart, 
        onTransitionEnd = v9._doOnTransitionEnd, 
        onTransitionStep = v9._doOnTransitionStep
    });
end;
v7.didMount = function(v13) --[[ Line: 57 ]] --[[ Name: didMount ]]
    -- upvalues: v2 (copy)
    local l_navigation_1 = v13.props.navigation;
    if l_navigation_1.state.isTransitioning then
        l_navigation_1.dispatch(v2.completeTransition({
            key = l_navigation_1.state.key
        }));
    end;
end;
v7._render = function(v15, v16, v17) --[[ Line: 66 ]] --[[ Name: _render ]]
    -- upvalues: v0 (copy), v6 (copy), v1 (copy), v3 (copy)
    local l_screenProps_1 = v15.props.screenProps;
    local v19 = v0.Dictionary.join(v6, v15.props.navigationConfig);
    local l_descriptors_1 = v15.props.descriptors;
    return v1.createElement(v3, v0.Dictionary.join(v19, {
        screenProps = l_screenProps_1, 
        descriptors = l_descriptors_1, 
        transitionProps = v16, 
        lastTransitionProps = v17
    }));
end;
v7._configureTransition = function(v21, v22, v23) --[[ Line: 79 ]] --[[ Name: _configureTransition ]]
    -- upvalues: v5 (copy)
    return v5.getTransitionConfig(v21.props.navigationConfig.transitionConfig, v22, v23, v21.props.navigationConfig.mode).transitionSpec;
end;
v7._onTransitionStart = function(v24, v25, v26) --[[ Line: 88 ]] --[[ Name: _onTransitionStart ]]
    local v27 = v24.props.onTransitionStart or v24.props.navigationConfig.onTransitionStart;
    if v27 and v25.index ~= v26.index then
        v27(v25.navigation, v26.navigation);
    end;
end;
v7._onTransitionEnd = function(v28, v29, v30) --[[ Line: 100 ]] --[[ Name: _onTransitionEnd ]]
    -- upvalues: v2 (copy)
    local l_navigationConfig_0 = v28.props.navigationConfig;
    local l_navigation_2 = v28.props.navigation;
    local v33 = v28.props.onTransitionEnd or l_navigationConfig_0.onTransitionEnd;
    local l_key_0 = v29.scene.route.key;
    local v35 = l_navigation_2.state.routes[l_navigation_2.state.index].key == l_key_0;
    if v29.navigation.state.isTransitioning and v35 then
        l_navigation_2.dispatch(v2.completeTransition({
            key = l_navigation_2.state.key, 
            toChildKey = l_key_0
        }));
    end;
    if v33 and v29.index ~= v30.index then
        v33(v29.navigation, v30.navigation);
    end;
end;
v7._onTransitionStep = function(v36, v37, v38, v39) --[[ Line: 122 ]] --[[ Name: _onTransitionStep ]]
    local v40 = v36.props.onTransitionStep or v36.props.navigationConfig.onTransitionStep;
    if v40 and v37.index ~= v38.index then
        v40(v37.navigation, v38.navigation, v39);
    end;
end;
return v7;