local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.utils.invariant);
local v4 = v2.Component:extend("StackViewCard");
v4.defaultProps = {
    transparent = false, 
    cardColor3 = Color3.new(1, 1, 1)
};
v4.init = function(v5) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local l_index_0 = v5.props.navigation.state.index;
    v5._isMounted = false;
    v5._positionLastValue = l_index_0;
    local v7 = v2.createRef();
    v5._getRef = function() --[[ Line: 42 ]]
        -- upvalues: v5 (copy), v2 (ref), v7 (copy)
        return v5.props[v2.Ref] or v7;
    end;
end;
v4.render = function(v8) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_forceHidden_0 = v8.props.forceHidden;
    local l_cardColor3_0 = v8.props.cardColor3;
    local l_transparent_0 = v8.props.transparent;
    local l_initialPosition_0 = v8.props.initialPosition;
    local l_renderScene_0 = v8.props.renderScene;
    local l_scene_0 = v8.props.scene;
    v3(type(l_renderScene_0) == "function", "renderScene must be a function");
    return v2.createElement("Frame", {
        Position = l_initialPosition_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_cardColor3_0, 
        BackgroundTransparency = l_transparent_0 and 1 or nil, 
        BorderSizePixel = 0, 
        ClipsDescendants = false, 
        Visible = not l_forceHidden_0, 
        [v2.Ref] = v8:_getRef()
    }, {
        Content = l_renderScene_0(l_scene_0)
    });
end;
v4.didMount = function(v15) --[[ Line: 71 ]] --[[ Name: didMount ]]
    v15._isMounted = true;
    v15._positionDisconnector = v15.props.position:onStep(function(...) --[[ Line: 75 ]]
        -- upvalues: v15 (copy)
        v15:_onPositionStep(...);
    end);
end;
v4.willUnmount = function(v16) --[[ Line: 80 ]] --[[ Name: willUnmount ]]
    v16._isMounted = false;
    if v16._positionDisconnector then
        v16._positionDisconnector();
        v16._positionDisconnector = nil;
    end;
end;
v4.didUpdate = function(v17, v18) --[[ Line: 89 ]] --[[ Name: didUpdate ]]
    local l_position_0 = v17.props.position;
    local l_positionStep_0 = v17.props.positionStep;
    if l_position_0 ~= v18.position then
        v17._positionDisconnector();
        v17._positionDisconnector = l_position_0:onStep(function(...) --[[ Line: 95 ]]
            -- upvalues: v17 (copy)
            v17:_onPositionStep(...);
        end);
    end;
    if l_positionStep_0 ~= v18.positionStep then
        v17:_onPositionStep(v17._positionLastValue);
    end;
end;
v4._onPositionStep = function(v21, v22) --[[ Line: 107 ]] --[[ Name: _onPositionStep ]]
    if not v21._isMounted then
        return;
    else
        local l_positionStep_1 = v21.props.positionStep;
        if l_positionStep_1 then
            l_positionStep_1(v21:_getRef(), v22);
        end;
        v21._positionLastValue = v22;
        return;
    end;
end;
return v4;