local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.utils.lerp);
local v4 = v2.Component:extend("StackViewOverlayFrame");
v4.init = function(v5) --[[ Line: 10 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v5._signalDisconnect = nil;
    local v6 = v2.createRef();
    v5._getRef = function() --[[ Line: 14 ]]
        -- upvalues: v5 (copy), v2 (ref), v6 (copy)
        return v5.props[v2.Ref] or v6;
    end;
end;
v4.render = function(v7) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_navigationOptions_0 = v7.props.navigationOptions;
    local l_initialTransitionValue_0 = v7.props.initialTransitionValue;
    local v10 = v3(1, l_navigationOptions_0.overlayTransparency, l_initialTransitionValue_0);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_navigationOptions_0.overlayColor3, 
        BackgroundTransparency = v10, 
        BorderSizePixel = 0, 
        [v2.Ref] = v7:_getRef()
    });
end;
v4.didUpdate = function(v11, v12) --[[ Line: 34 ]] --[[ Name: didUpdate ]]
    local l_transitionChangedSignal_0 = v11.props.transitionChangedSignal;
    if l_transitionChangedSignal_0 ~= v12.transitionChangedSignal then
        if v11._signalDisconnect then
            v11._signalDisconnect();
        end;
        v11._signalDisconnect = l_transitionChangedSignal_0(function(...) --[[ Line: 42 ]]
            -- upvalues: v11 (copy)
            v11:_transitionChanged(...);
        end);
    end;
end;
v4.didMount = function(v14) --[[ Line: 48 ]] --[[ Name: didMount ]]
    v14._isMounted = true;
    v14._signalDisconnect = v14.props.transitionChangedSignal(function(...) --[[ Line: 50 ]]
        -- upvalues: v14 (copy)
        v14:_transitionChanged(...);
    end);
end;
v4.willUnmount = function(v15) --[[ Line: 55 ]] --[[ Name: willUnmount ]]
    v15._isMounted = false;
    if v15._signalDisconnect then
        v15._signalDisconnect();
        v15._signalDisconnect = nil;
    end;
end;
v4._transitionChanged = function(v16, v17) --[[ Line: 63 ]] --[[ Name: _transitionChanged ]]
    -- upvalues: v3 (copy)
    if not v16._isMounted then
        return;
    else
        local v18 = v16:_getRef();
        if v18.current then
            local l_navigationOptions_1 = v16.props.navigationOptions;
            local v20 = v3(1, l_navigationOptions_1.overlayTransparency, v17);
            v18.current.BackgroundTransparency = v20;
        end;
        return;
    end;
end;
return v4;