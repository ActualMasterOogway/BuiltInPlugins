local v0 = require(script.Parent.Parent.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent.Parent.utils.validate);
local v2 = v0.Component:extend("StackViewCard");
v2.defaultProps = {
    transparent = false, 
    cardColor3 = Color3.new(1, 1, 1)
};
v2.init = function(v3) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v0 (copy)
    local l_index_0 = v3.props.navigation.state.index;
    v3._isMounted = false;
    v3._positionLastValue = l_index_0;
    local v5 = v0.createRef();
    v3._getRef = function() --[[ Line: 37 ]]
        -- upvalues: v3 (copy), v0 (ref), v5 (copy)
        return v3.props[v0.Ref] or v5;
    end;
end;
v2.render = function(v6) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_forceHidden_0 = v6.props.forceHidden;
    local l_cardColor3_0 = v6.props.cardColor3;
    local l_transparent_0 = v6.props.transparent;
    local l_initialPosition_0 = v6.props.initialPosition;
    local l_renderScene_0 = v6.props.renderScene;
    local l_scene_0 = v6.props.scene;
    v1(type(l_renderScene_0) == "function", "renderScene must be a function");
    return v0.createElement("Frame", {
        Position = l_initialPosition_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_cardColor3_0, 
        BackgroundTransparency = l_transparent_0 and 1 or nil, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Visible = not l_forceHidden_0, 
        [v0.Ref] = v6:_getRef()
    }, {
        Content = l_renderScene_0(l_scene_0)
    });
end;
v2.didMount = function(v13) --[[ Line: 66 ]] --[[ Name: didMount ]]
    v13._isMounted = true;
    v13._positionDisconnector = v13.props.position:onStep(function(...) --[[ Line: 70 ]]
        -- upvalues: v13 (copy)
        v13:_onPositionStep(...);
    end);
end;
v2.willUnmount = function(v14) --[[ Line: 75 ]] --[[ Name: willUnmount ]]
    v14._isMounted = false;
    if v14._positionDisconnector then
        v14._positionDisconnector();
        v14._positionDisconnector = nil;
    end;
end;
v2.didUpdate = function(v15, v16) --[[ Line: 84 ]] --[[ Name: didUpdate ]]
    local l_position_0 = v15.props.position;
    local l_positionStep_0 = v15.props.positionStep;
    if l_position_0 ~= v16.position then
        v15._positionDisconnector();
        v15._positionDisconnector = l_position_0:onStep(function(...) --[[ Line: 90 ]]
            -- upvalues: v15 (copy)
            v15:_onPositionStep(...);
        end);
    end;
    if l_positionStep_0 ~= v16.positionStep then
        v15:_onPositionStep(v15._positionLastValue);
    end;
end;
v2._onPositionStep = function(v19, v20) --[[ Line: 102 ]] --[[ Name: _onPositionStep ]]
    if not v19._isMounted then
        return;
    else
        local l_positionStep_1 = v19.props.positionStep;
        if l_positionStep_1 then
            l_positionStep_1(v19:_getRef(), v20);
        end;
        v19._positionLastValue = v20;
        return;
    end;
end;
return v2;