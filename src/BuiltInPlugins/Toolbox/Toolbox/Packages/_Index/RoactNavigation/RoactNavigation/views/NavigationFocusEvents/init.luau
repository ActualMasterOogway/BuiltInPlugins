local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.Events);
local v5 = v3.Component:extend("NavigationEventManager");
v5.didMount = function(v6) --[[ Line: 13 ]] --[[ Name: didMount ]]
    -- upvalues: v4 (copy)
    local l_navigation_0 = v6.props.navigation;
    v6._actionSubscription = l_navigation_0.addListener(v4.Action, function(...) --[[ Line: 16 ]]
        -- upvalues: v6 (copy)
        return v6:_handleAction(...);
    end);
    v6._willFocusSubscription = l_navigation_0.addListener(v4.WillFocus, function(...) --[[ Line: 20 ]]
        -- upvalues: v6 (copy)
        return v6:_handleWillFocus(...);
    end);
    v6._willBlurSubscription = l_navigation_0.addListener(v4.WillBlur, function(...) --[[ Line: 24 ]]
        -- upvalues: v6 (copy)
        return v6:_handleWillBlur(...);
    end);
    v6._didFocusSubscription = l_navigation_0.addListener(v4.DidFocus, function(...) --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        return v6:_handleDidFocus(...);
    end);
    v6._didBlurSubscription = l_navigation_0.addListener(v4.DidBlur, function(...) --[[ Line: 32 ]]
        -- upvalues: v6 (copy)
        return v6:_handleDidBlur(...);
    end);
    v6._refocusSubscription = l_navigation_0.addListener(v4.Refocus, function(...) --[[ Line: 36 ]]
        -- upvalues: v6 (copy)
        return v6:_handleRefocus(...);
    end);
end;
v5.willUnmount = function(v8) --[[ Line: 41 ]] --[[ Name: willUnmount ]]
    if v8._actionSubscription then
        v8._actionSubscription.remove();
    end;
    if v8._willFocusSubscription then
        v8._willFocusSubscription.remove();
    end;
    if v8._willBlurSubscription then
        v8._willBlurSubscription.remove();
    end;
    if v8._didFocusSubscription then
        v8._didFocusSubscription.remove();
    end;
    if v8._didBlurSubscription then
        v8._didBlurSubscription.remove();
    end;
    if v8._refocusSubscription then
        v8._refocusSubscription.remove();
    end;
end;
v5._handleAction = function(v9, v10) --[[ Line: 62 ]] --[[ Name: _handleAction ]]
    -- upvalues: v4 (copy)
    local l_state_0 = v10.state;
    local l_lastState_0 = v10.lastState;
    local l_action_0 = v10.action;
    local l_type_0 = v10.type;
    local l_context_0 = v10.context;
    local l_navigation_1 = v9.props.navigation;
    local l_onEvent_0 = v9.props.onEvent;
    if not l_navigation_1.isFocused() then
        return;
    else
        local v18 = nil;
        if l_lastState_0 and l_lastState_0.routes then
            v18 = l_lastState_0.routes[l_lastState_0.index];
        end;
        local v19 = l_state_0.routes[l_state_0.index];
        local v20 = {
            context = ("%s:%s_%s"):format(v19.key, tostring(l_action_0.type), l_context_0 or "Root"), 
            state = v19, 
            lastState = v18, 
            action = l_action_0, 
            type = l_type_0
        };
        if (v18 and v18.key) ~= v19.key then
            v9:_emitWillFocus(v19.key, v20);
            if v18 and v18.key then
                v9:_emitWillBlur(v18.key, v20);
            end;
        end;
        if l_lastState_0 and l_lastState_0.isTransitioning ~= l_state_0.isTransitioning and l_state_0.isTransitioning == false then
            if v9._lastWillBlurKey then
                v9:_emitDidBlur(v9._lastWillBlurKey, v20);
            end;
            if v9._lastWillFocusKey then
                v9:_emitDidFocus(v9._lastWillFocusKey, v20);
            end;
        end;
        l_onEvent_0(v19.key, v4.Action, v20);
        return;
    end;
end;
v5._handleWillFocus = function(v21, v22) --[[ Line: 113 ]] --[[ Name: _handleWillFocus ]]
    -- upvalues: l_Array_0 (copy)
    local l_lastState_1 = v22.lastState;
    local l_action_1 = v22.action;
    local l_context_1 = v22.context;
    local l_type_1 = v22.type;
    local l_navigation_2 = v21.props.navigation;
    local v28 = l_navigation_2.state.routes[l_navigation_2.state.index];
    local v29 = nil;
    if l_lastState_1 and l_lastState_1.routes then
        local v31 = if l_lastState_1 then l_Array_0.findIndex(l_lastState_1.routes, function(v30) --[[ Line: 125 ]]
            -- upvalues: v28 (copy)
            return v30.key == v28.key;
        end) else {};
        if v31 > 0 then
            v29 = l_lastState_1.routes[v31];
        end;
    end;
    v21:_emitWillFocus(v28.key, {
        context = ("%s:%s_%s"):format(v28.key, tostring(l_action_1.type), l_context_1 or "Root"), 
        state = v28, 
        lastState = v29, 
        action = l_action_1, 
        type = l_type_1
    });
end;
v5._handleWillBlur = function(v32, v33) --[[ Line: 143 ]] --[[ Name: _handleWillBlur ]]
    -- upvalues: l_Array_0 (copy)
    local l_lastState_2 = v33.lastState;
    local l_action_2 = v33.action;
    local l_context_2 = v33.context;
    local l_type_2 = v33.type;
    local l_navigation_3 = v32.props.navigation;
    local v39 = l_navigation_3.state.routes[l_navigation_3.state.index];
    local v40 = nil;
    if l_lastState_2 and l_lastState_2.routes then
        local v42 = if l_lastState_2 then l_Array_0.findIndex(l_lastState_2.routes, function(v41) --[[ Line: 155 ]]
            -- upvalues: v39 (copy)
            return v41.key == v39.key;
        end) else {};
        if v42 > 0 then
            v40 = l_lastState_2.routes[v42];
        end;
    end;
    v32:_emitWillBlur(v39.key, {
        context = ("%s:%s_%s"):format(v39.key, tostring(l_action_2.type), l_context_2 or "Root"), 
        state = v39, 
        lastState = v40, 
        action = l_action_2, 
        type = l_type_2
    });
end;
v5._handleDidFocus = function(v43, v44) --[[ Line: 173 ]] --[[ Name: _handleDidFocus ]]
    -- upvalues: l_Array_0 (copy)
    local l_lastState_3 = v44.lastState;
    local l_action_3 = v44.action;
    local l_context_3 = v44.context;
    local l_type_3 = v44.type;
    local l_navigation_4 = v43.props.navigation;
    if v43._lastWillFocusKey then
        local v51 = l_Array_0.findIndex(l_navigation_4.state.routes, function(v50) --[[ Line: 182 ]]
            -- upvalues: v43 (copy)
            return v50.key == v43._lastWillFocusKey;
        end);
        if v51 then
            local v52 = l_navigation_4.state.routes[v51];
            local v53 = nil;
            if l_lastState_3 and l_lastState_3.routes then
                local v55 = if l_lastState_3 then l_Array_0.findIndex(l_lastState_3.routes, function(v54) --[[ Line: 192 ]]
                    -- upvalues: v52 (copy)
                    return v54.key == v52.key;
                end) else {};
                if v55 > 0 then
                    v53 = l_lastState_3.routes[v55];
                end;
            end;
            v43:_emitDidFocus(v52.key, {
                context = ("%s:%s_%s"):format(v52.key, tostring(l_action_3.type), l_context_3 or "Root"), 
                state = v52, 
                lastState = v53, 
                action = l_action_3, 
                type = l_type_3
            });
        end;
    end;
end;
v5._handleDidBlur = function(v56, v57) --[[ Line: 212 ]] --[[ Name: _handleDidBlur ]]
    -- upvalues: l_Array_0 (copy)
    local l_lastState_4 = v57.lastState;
    local l_action_4 = v57.action;
    local l_context_4 = v57.context;
    local l_type_4 = v57.type;
    local l_navigation_5 = v56.props.navigation;
    if v56._lastWillBlurKey then
        local v64 = l_Array_0.findIndex(l_navigation_5.state.routes, function(v63) --[[ Line: 221 ]]
            -- upvalues: v56 (copy)
            return v63.key == v56._lastWillBlurKey;
        end);
        if v64 > 0 then
            local v65 = l_navigation_5.state.routes[v64];
            local v66 = nil;
            if l_lastState_4 and l_lastState_4.routes then
                local v68 = if l_lastState_4 then l_Array_0.findIndex(l_lastState_4.routes, function(v67) --[[ Line: 231 ]]
                    -- upvalues: v65 (copy)
                    return v67.key == v65.key;
                end) else {};
                if v68 then
                    v66 = l_lastState_4.routes[v68];
                end;
            end;
            v56:_emitDidBlur(v65.key, {
                context = ("%s:%s_%s"):format(v65.key, tostring(l_action_4.type), l_context_4 or "Root"), 
                state = v65, 
                lastState = v66, 
                action = l_action_4, 
                type = l_type_4
            });
        end;
    end;
end;
v5._handleRefocus = function(v69) --[[ Line: 251 ]] --[[ Name: _handleRefocus ]]
    -- upvalues: v4 (copy)
    local l_onEvent_1 = v69.props.onEvent;
    local l_navigation_6 = v69.props.navigation;
    l_onEvent_1(l_navigation_6.state.routes[l_navigation_6.state.index].key, v4.Refocus);
end;
v5._emitWillFocus = function(v72, v73, v74) --[[ Line: 259 ]] --[[ Name: _emitWillFocus ]]
    -- upvalues: v4 (copy)
    if v72._lastWillBlurKey == v73 then
        v72._lastWillBlurKey = nil;
    end;
    if v72._lastWillFocusKey == v73 then
        return;
    else
        v72._lastDidFocusKey = nil;
        v72._lastWillFocusKey = v73;
        local l_navigation_7 = v72.props.navigation;
        v72.props.onEvent(v73, v4.WillFocus, v74);
        if type(l_navigation_7.state.isTransitioning) ~= "boolean" or l_navigation_7.state.isTransitioning ~= true and not l_navigation_7._dangerouslyGetParent() then
            v72:_emitDidFocus(v73, v74);
        end;
        return;
    end;
end;
v5._emitWillBlur = function(v76, v77, v78) --[[ Line: 284 ]] --[[ Name: _emitWillBlur ]]
    -- upvalues: v4 (copy)
    if v76._lastWillFocusKey == v77 then
        v76._lastWillFocusKey = nil;
    end;
    if v76._lastWillBlurKey == v77 then
        return;
    else
        v76._lastDidBlurKey = nil;
        v76._lastWillBlurKey = v77;
        local l_navigation_8 = v76.props.navigation;
        v76.props.onEvent(v77, v4.WillBlur, v78);
        if type(l_navigation_8.state.isTransitioning) ~= "boolean" or l_navigation_8.state.isTransitioning ~= true and not l_navigation_8._dangerouslyGetParent() then
            v76:_emitDidBlur(v77, v78);
        end;
        return;
    end;
end;
v5._emitDidFocus = function(v80, v81, v82) --[[ Line: 309 ]] --[[ Name: _emitDidFocus ]]
    -- upvalues: v4 (copy)
    if v80._lastWillFocusKey ~= v81 or v80._lastDidFocusKey == v81 then
        return;
    else
        v80._lastDidFocusKey = v81;
        v80.props.onEvent(v81, v4.DidFocus, v82);
        return;
    end;
end;
v5._emitDidBlur = function(v83, v84, v85) --[[ Line: 321 ]] --[[ Name: _emitDidBlur ]]
    -- upvalues: v4 (copy)
    if v83._lastWillBlurKey ~= v84 or v83._lastDidBlurKey == v84 then
        return;
    else
        v83._lastDidBlurKey = v84;
        v83.props.onEvent(v84, v4.DidBlur, v85);
        return;
    end;
end;
v5.render = function(_) --[[ Line: 333 ]] --[[ Name: render ]]
    return nil;
end;
return v5;