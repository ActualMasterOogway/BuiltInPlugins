local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent.Cryo);
local v2 = require(script.Parent.NavigationActions);
local v3 = require(script.Parent.NavigationEvents);
local v4 = require(script.Parent.views.AppNavigationContext);
local v5 = require(script.Parent.getNavigation);
local v6 = require(script.Parent.utils.validate);
local function v12(v7) --[[ Line: 9 ]] --[[ Name: validateProps ]]
    -- upvalues: v6 (copy)
    if not v7.navigation then
        return;
    else
        local v8 = "This navigator has both 'navigation' and container props. " .. "It is unclear if it should own its own state. Remove the " .. "container props or don't pass a 'navigation' prop.";
        for v9 in pairs(v7) do
            local l_v6_0 = v6;
            local v11 = true;
            if v9 ~= "screenProps" then
                v11 = v9 == "navigation";
            end;
            l_v6_0(v11, v8);
        end;
        return;
    end;
end;
return function(v13) --[[ Line: 53 ]]
    -- upvalues: v6 (copy), v0 (copy), v12 (copy), v2 (copy), v5 (copy), v4 (copy), v1 (copy), v3 (copy)
    local l_v6_1 = v6;
    local v15 = false;
    if type(v13) == "table" then
        v15 = v13.router ~= nil;
    end;
    l_v6_1(v15, "AppComponent must be a navigator or a stateful Roact component with a 'router' field");
    l_v6_1 = string.format("NavigationContainer(%s)", (tostring(v13)));
    v15 = v0.Component:extend(l_v6_1);
    v15.getDerivedStateFromProps = function(v16) --[[ Line: 60 ]] --[[ Name: getDerivedStateFromProps ]]
        -- upvalues: v12 (ref)
        v12(v16);
        return nil;
    end;
    v15.init = function(v17) --[[ Line: 65 ]] --[[ Name: init ]]
        -- upvalues: v12 (ref), v2 (ref), v13 (copy)
        v12(v17.props);
        v17._actionEventSubscribers = {};
        v17._initialAction = v2.init();
        local v18 = nil;
        if v17:_isStateful() and not v17.props.persistenceKey then
            v18 = v13.router.getStateForAction(v17._initialAction);
        end;
        v17.state = {
            nav = v18
        };
    end;
    v15._updateExternalDispatchConnector = function(v19) --[[ Line: 82 ]] --[[ Name: _updateExternalDispatchConnector ]]
        local l_externalDispatchConnector_0 = v19.props.externalDispatchConnector;
        if v19._subs then
            v19._subs();
            v19._subs = nil;
        end;
        if l_externalDispatchConnector_0 ~= nil then
            v19._subs = l_externalDispatchConnector_0(function(...) --[[ Line: 90 ]]
                -- upvalues: v19 (copy)
                if v19._isMounted then
                    return v19:dispatch(...);
                else
                    return false;
                end;
            end);
        end;
    end;
    v15._renderLoading = function(v21) --[[ Line: 101 ]] --[[ Name: _renderLoading ]]
        local l_renderLoading_0 = v21.props.renderLoading;
        if l_renderLoading_0 then
            return l_renderLoading_0();
        else
            return nil;
        end;
    end;
    v15.render = function(v23) --[[ Line: 110 ]] --[[ Name: render ]]
        -- upvalues: v5 (ref), v13 (copy), v6 (ref), v0 (ref), v4 (ref), v1 (ref)
        local l_navigation_0 = v23.props.navigation;
        if v23:_isStateful() then
            local l_nav_0 = v23.state.nav;
            if not l_nav_0 then
                return v23:_renderLoading();
            else
                if not v23._navigation or v23._navigation.state ~= l_nav_0 then
                    v23._navigation = v5(v13.router, l_nav_0, function(...) --[[ Line: 123 ]]
                        -- upvalues: v23 (copy)
                        return v23:dispatch(...);
                    end, v23._actionEventSubscribers, function(...) --[[ Line: 127 ]]
                        -- upvalues: v23 (copy)
                        return v23:_getScreenProps(...);
                    end, function() --[[ Line: 130 ]]
                        -- upvalues: v23 (copy)
                        return v23._navigation;
                    end);
                end;
                l_navigation_0 = v23._navigation;
            end;
        end;
        v6(l_navigation_0 ~= nil, "failed to get navigation");
        return v0.createElement(v4.Provider, {
            navigation = l_navigation_0
        }, {
            AppComponent = v0.createElement(v13, v1.Dictionary.join(v23.props, {
                navigation = l_navigation_0
            }))
        });
    end;
    v15.didMount = function(v26) --[[ Line: 151 ]] --[[ Name: didMount ]]
        -- upvalues: v13 (copy), v3 (ref)
        v26._isMounted = true;
        v26:_updateExternalDispatchConnector();
        if not v26:_isStateful() then
            return;
        else
            local l__initialAction_0 = v26._initialAction;
            local v28 = v26.state.nav or v13.router.getStateForAction(l__initialAction_0);
            local function v30() --[[ Line: 167 ]] --[[ Name: dispatchActionEvents ]]
                -- upvalues: v26 (copy), v3 (ref), l__initialAction_0 (copy)
                for v29 in pairs(v26._actionEventSubscribers) do
                    v29({
                        type = v3.Action, 
                        action = l__initialAction_0, 
                        state = v26.state.nav
                    });
                end;
            end;
            if v28 ~= v26.state.nav then
                v26:setState({
                    nav = v28
                });
            end;
            spawn(v30);
            return;
        end;
    end;
    v15.willUnmount = function(v31) --[[ Line: 189 ]] --[[ Name: willUnmount ]]
        v31._isMounted = false;
        if v31._subs then
            v31._subs();
            v31._subs = nil;
        end;
    end;
    v15.didUpdate = function(v32, v33) --[[ Line: 200 ]] --[[ Name: didUpdate ]]
        if v32._navState == v32.state.nav then
            v32._navState = nil;
        end;
        if v32.props.externalDispatchConnector ~= v33.externalDispatchConnector then
            v32:_updateExternalDispatchConnector();
        end;
    end;
    v15._isStateful = function(v34) --[[ Line: 211 ]] --[[ Name: _isStateful ]]
        return not v34.props.navigation;
    end;
    v15._onNavigationStateChange = function(v35, v36, v37, v38) --[[ Line: 220 ]] --[[ Name: _onNavigationStateChange ]]
        local l_onNavigationStateChange_0 = v35.props.onNavigationStateChange;
        if type(l_onNavigationStateChange_0) == "function" then
            l_onNavigationStateChange_0(v36, v37, v38);
        end;
    end;
    v15._getScreenProps = function(v40, v41, v42) --[[ Line: 228 ]] --[[ Name: _getScreenProps ]]
        local v43 = v40.props.screenProps or {};
        if v41 ~= nil then
            return v43[v41] or v42;
        else
            return v43;
        end;
    end;
    v15.dispatch = function(v44, v45) --[[ Line: 238 ]] --[[ Name: dispatch ]]
        -- upvalues: v6 (ref), v13 (copy), v3 (ref)
        if v44.props.navigation then
            return v44.props.navigation.dispatch(v45);
        else
            v44._navState = v44._navState or v44.state.nav;
            local l__navState_0 = v44._navState;
            v6(l__navState_0 ~= nil, "navState should be set in constructor if stateful");
            local v47 = v13.router.getStateForAction(v45, l__navState_0);
            local v48 = v47 or l__navState_0;
            local function v50() --[[ Line: 254 ]] --[[ Name: dispatchActionEvents ]]
                -- upvalues: v44 (copy), v3 (ref), v45 (copy), v48 (ref), l__navState_0 (copy)
                for v49 in pairs(v44._actionEventSubscribers) do
                    v49({
                        type = v3.Action, 
                        action = v45, 
                        state = v48, 
                        lastState = l__navState_0
                    });
                end;
            end;
            if v47 == nil then
                v50();
                return true;
            elseif v48 ~= l__navState_0 then
                v44._navState = v48;
                v44:setState({
                    nav = v48
                });
                spawn(function() --[[ Line: 285 ]]
                    -- upvalues: v44 (copy), l__navState_0 (copy), v48 (ref), v45 (copy), v50 (copy)
                    v44:_onNavigationStateChange(l__navState_0, v48, v45);
                    v50();
                end);
                return true;
            else
                spawn(v50);
                return false;
            end;
        end;
    end;
    return v15;
end;