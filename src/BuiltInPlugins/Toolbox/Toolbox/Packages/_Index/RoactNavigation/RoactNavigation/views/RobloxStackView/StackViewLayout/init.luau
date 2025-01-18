local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_0.StackPresentationStyle);
local v6 = require(l_Parent_0.StackViewTransitionConfigs);
local v7 = require(l_Parent_0.StackViewOverlayFrame);
local v8 = require(l_Parent_0.StackViewCard);
local v9 = require(l_Parent_1.SceneView);
local v13 = {
    absorbInput = true, 
    overlayEnabled = false, 
    overlayColor3 = Color3.new(0, 0, 0), 
    overlayTransparency = 0.7, 
    renderOverlay = function(v10, v11, v12) --[[ Line: 21 ]] --[[ Name: renderOverlay ]]
        -- upvalues: v4 (copy), v7 (copy)
        return v4.createElement(v7, {
            navigationOptions = v10, 
            initialTransitionValue = v11, 
            transitionChangedSignal = v12
        });
    end, 
    transparent = false
};
local function _(v14, v15) --[[ Line: 33 ]] --[[ Name: calculateTransitionValue ]]
    return (math.max(math.min(1 + v15 - v14, 1), 0));
end;
local v17 = v4.Component:extend("StackViewLayout");
v17.init = function(v18) --[[ Line: 39 ]] --[[ Name: init ]]
    v18:setState({});
    local l_index_0 = v18.props.transitionProps.navigation.state.index;
    v18._isMounted = false;
    v18._positionLastValue = l_index_0;
    v18._renderScene = function(v20) --[[ Line: 46 ]]
        -- upvalues: v18 (copy)
        return v18:_renderInnerScene(v20);
    end;
    v18._subscribeToOverlayUpdates = function(v21) --[[ Line: 50 ]]
        -- upvalues: v18 (copy)
        local l_position_0 = v18.props.transitionProps.position;
        local l_index_1 = v18.props.transitionProps.scene.index;
        return l_position_0:onStep(function(v24) --[[ Line: 54 ]]
            -- upvalues: v21 (copy), l_index_1 (copy)
            local l_v21_0 = v21;
            local l_l_index_1_0 = l_index_1;
            l_v21_0((math.max(math.min(1 + v24 - l_l_index_1_0, 1), 0)));
        end);
    end;
end;
v17._renderCard = function(v27, v28, v29) --[[ Line: 60 ]] --[[ Name: _renderCard ]]
    -- upvalues: l_Object_0 (copy), v4 (copy), v8 (copy)
    local l_transitionProps_0 = v27.props.transitionProps;
    local l_lastTransitionProps_0 = v27.props.lastTransitionProps;
    local l_transitionConfig_0 = v27.state.transitionConfig;
    local l_cardColor3_0 = v29.cardColor3;
    local l_overlayEnabled_0 = v29.overlayEnabled;
    local l_transparent_0 = v29.transparent;
    local l_index_2 = l_transitionProps_0.scene.index;
    if l_lastTransitionProps_0 then
        l_index_2 = l_lastTransitionProps_0.scene.index;
    end;
    local v37 = {};
    local l_screenInterpolator_0 = l_transitionConfig_0.screenInterpolator;
    if l_screenInterpolator_0 then
        v37 = l_screenInterpolator_0(l_Object_0.assign(table.clone(l_transitionProps_0), {
            initialPositionValue = l_index_2, 
            scene = v28
        }));
    end;
    return v4.createElement(v8, l_Object_0.assign(table.clone(l_transitionProps_0), v37, {
        key = "card_" .. tostring(v28.key), 
        scene = v28, 
        renderScene = v27._renderScene, 
        transparent = l_overlayEnabled_0 or l_transparent_0, 
        cardColor3 = l_cardColor3_0
    }));
end;
v17._renderInnerScene = function(v39, v40) --[[ Line: 96 ]] --[[ Name: _renderInnerScene ]]
    -- upvalues: v4 (copy), v9 (copy)
    local l_navigation_0 = v40.descriptor.navigation;
    local v42 = v40.descriptor.getComponent();
    local l_screenProps_0 = v39.props.screenProps;
    return v4.createElement(v9, {
        screenProps = l_screenProps_0, 
        navigation = l_navigation_0, 
        component = v42
    });
end;
v17.render = function(v44) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: l_Object_0 (copy), v13 (copy), v4 (copy)
    local l_transitionProps_1 = v44.props.transitionProps;
    local l_topMostOpaqueSceneIndex_0 = v44.state.topMostOpaqueSceneIndex;
    local l_scenes_0 = l_transitionProps_1.scenes;
    local v48 = {};
    for _, v50 in l_scenes_0 do
        local v51 = false;
        if v50.index < l_topMostOpaqueSceneIndex_0 then
            v51 = not v50.isActive;
        end;
        local v52 = if v50.descriptor.options then l_Object_0.assign(table.clone(v13), v50.descriptor.options) else table.clone(v13);
        local l_overlayEnabled_1 = v52.overlayEnabled;
        local l_absorbInput_0 = v52.absorbInput;
        local l_renderOverlay_0 = v52.renderOverlay;
        local v56 = nil;
        if l_overlayEnabled_1 then
            local l_createElement_0 = v4.createElement;
            local v58 = "Frame";
            local v59 = {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                ZIndex = 1
            };
            local v60 = {};
            local l_l_renderOverlay_0_0 = l_renderOverlay_0;
            local l_v52_0 = v52;
            local l_index_3 = v50.index;
            v60.Overlay = l_l_renderOverlay_0_0(l_v52_0, math.max(math.min(1 + v44._positionLastValue - l_index_3, 1), 0), v44._subscribeToOverlayUpdates);
            v56 = l_createElement_0(v58, v59, v60);
        end;
        local v64 = nil;
        if not v51 and l_absorbInput_0 then
            v64 = v4.createElement("TextButton", {
                Active = true, 
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = " ", 
                ZIndex = 2 * v50.index - 1
            });
        end;
        local v65 = v4.createFragment({
            AbsorbInput = v64, 
            [tostring(v50.index)] = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                ZIndex = 2 * v50.index, 
                Visible = not v51
            }, {
                StationaryContent = v56, 
                DynamicContent = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = false, 
                    BorderSizePixel = 0, 
                    ZIndex = 2
                }, {
                    ["card_" .. v50.key] = v44:_renderCard(v50, v52)
                })
            })
        });
        v48[tostring(v50.key)] = v65;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        BorderSizePixel = 0
    }, v48);
end;
v17.getDerivedStateFromProps = function(v66, _) --[[ Line: 202 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v5 (copy), l_Object_0 (copy), v13 (copy), v6 (copy)
    local l_transitionProps_2 = v66.transitionProps;
    local l_scenes_1 = l_transitionProps_2.scenes;
    local l_isTransitioning_0 = l_transitionProps_2.navigation.state.isTransitioning;
    local v71 = #l_scenes_1;
    local v72 = true;
    if v66.mode ~= v5.Modal then
        v72 = v66.mode == v5.Overlay;
    end;
    local v73 = 0;
    if v72 then
        for v74 = v71, 1, -1 do
            local v75 = l_scenes_1[v74];
            if not (if v75.descriptor.options then l_Object_0.assign(table.clone(v13), v75.descriptor.options) else table.clone(v13)).overlayEnabled and (not l_isTransitioning_0 or v74 ~= v71) then
                v73 = v74;
                break;
            end;
        end;
    else
        for v76 = v71, 1, -1 do
            if not l_isTransitioning_0 or v76 ~= v71 then
                v73 = v76;
                break;
            end;
        end;
    end;
    return {
        topMostOpaqueSceneIndex = v73, 
        transitionConfig = v6.getTransitionConfig(v66.transitionConfig, v66.transitionProps, v66.lastTransitionProps, v66.mode)
    };
end;
v17.didMount = function(v77) --[[ Line: 247 ]] --[[ Name: didMount ]]
    v77._isMounted = true;
    v77._positionDisconnector = v77.props.transitionProps.position:onStep(function(...) --[[ Line: 250 ]]
        -- upvalues: v77 (copy)
        v77:_onPositionStep(...);
    end);
end;
v17.willUnmount = function(v78) --[[ Line: 255 ]] --[[ Name: willUnmount ]]
    v78._isMounted = false;
    if v78._positionDisconnector then
        v78._positionDisconnector();
        v78._positionDisconnector = nil;
    end;
end;
v17.didUpdate = function(v79, v80) --[[ Line: 264 ]] --[[ Name: didUpdate ]]
    local l_position_1 = v79.props.transitionProps.position;
    if l_position_1 ~= v80.transitionProps.position then
        v79._positionDisconnector();
        v79._positionDisconnector = l_position_1:onStep(function(...) --[[ Line: 269 ]]
            -- upvalues: v79 (copy)
            v79:_onPositionStep(...);
        end);
    end;
end;
v17._onPositionStep = function(v82, v83) --[[ Line: 275 ]] --[[ Name: _onPositionStep ]]
    if v82._isMounted then
        v82._positionLastValue = v83;
    end;
end;
return v17;