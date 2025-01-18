local v0 = require(script.Parent.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent.Parent.utils.lerp);
local v2 = v0.Component:extend("StackViewOverlayFrame");
v2.init = function(v3) --[[ Line: 6 ]] --[[ Name: init ]]
    -- upvalues: v0 (copy)
    v3._signalDisconnect = nil;
    local v4 = v0.createRef();
    v3._getRef = function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy), v0 (ref), v4 (copy)
        return v3.props[v0.Ref] or v4;
    end;
end;
v2.render = function(v5) --[[ Line: 15 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_navigationOptions_0 = v5.props.navigationOptions;
    local l_initialTransitionValue_0 = v5.props.initialTransitionValue;
    local v8 = v1(1, l_navigationOptions_0.overlayTransparency, l_initialTransitionValue_0);
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_navigationOptions_0.overlayColor3, 
        BackgroundTransparency = v8, 
        BorderSizePixel = 0, 
        [v0.Ref] = v5:_getRef()
    });
end;
v2.didUpdate = function(v9, v10) --[[ Line: 30 ]] --[[ Name: didUpdate ]]
    local l_transitionChangedSignal_0 = v9.props.transitionChangedSignal;
    if l_transitionChangedSignal_0 ~= v10.transitionChangedSignal then
        if v9._signalDisconnect then
            v9._signalDisconnect();
        end;
        v9._signalDisconnect = l_transitionChangedSignal_0(function(...) --[[ Line: 38 ]]
            -- upvalues: v9 (copy)
            v9:_transitionChanged(...);
        end);
    end;
end;
v2.didMount = function(v12) --[[ Line: 44 ]] --[[ Name: didMount ]]
    v12._isMounted = true;
    v12._signalDisconnect = v12.props.transitionChangedSignal(function(...) --[[ Line: 46 ]]
        -- upvalues: v12 (copy)
        v12:_transitionChanged(...);
    end);
end;
v2.willUnmount = function(v13) --[[ Line: 51 ]] --[[ Name: willUnmount ]]
    v13._isMounted = false;
    if v13._signalDisconnect then
        v13._signalDisconnect();
    end;
end;
v2._transitionChanged = function(v14, v15) --[[ Line: 58 ]] --[[ Name: _transitionChanged ]]
    -- upvalues: v1 (copy)
    if not v14._isMounted then
        return;
    else
        local v16 = v14:_getRef();
        if v16.current then
            local l_navigationOptions_1 = v14.props.navigationOptions;
            local v18 = v1(1, l_navigationOptions_1.overlayTransparency, v15);
            v16.current.BackgroundTransparency = v18;
        end;
        return;
    end;
end;
return v2;